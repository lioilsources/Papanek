// Stav uživatele (spíž, nákup, jazyk) v user.db a matching „co uvařím“ (§8).
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'content.dart';

class Match {
  Match(this.recipe, this.missing);
  final Recipe recipe;
  final List<Ingredient> missing;
}

class AppState extends ChangeNotifier {
  AppState(this.content, this._db, this.pantry, this.shopping, this.lang);
  final Content content;
  final Database? _db;
  final Set<int> pantry; // ingredient_id, který doma je
  final Map<int, bool> shopping; // ingredient_id → odškrtnuto
  String lang;

  static Future<AppState> load(String systemLang) async {
    final content = await Content.load();
    final dir = await getApplicationSupportDirectory();
    final db = await openDatabase(p.join(dir.path, 'user.db'), version: 1, onCreate: (db, _) async {
      await db.execute('CREATE TABLE pantry (ingredient_id INTEGER PRIMARY KEY, added_at INTEGER NOT NULL)');
      await db.execute('CREATE TABLE shopping (ingredient_id INTEGER PRIMARY KEY, checked INTEGER NOT NULL DEFAULT 0)');
      await db.execute('CREATE TABLE settings (key TEXT PRIMARY KEY, value TEXT NOT NULL)');
    });
    final pantry = {for (final r in await db.query('pantry')) r['ingredient_id'] as int};
    final shopping = {
      for (final r in await db.query('shopping')) r['ingredient_id'] as int: (r['checked'] as int) == 1
    };
    final s = await db.query('settings', where: 'key = ?', whereArgs: ['lang']);
    final lang = s.isNotEmpty ? s.first['value'] as String : (systemLang == 'cs' ? 'cs' : 'en');
    return AppState(content, db, pantry, shopping, lang);
  }

  /// Pro testy: stav bez úložiště.
  @visibleForTesting
  AppState.memory(this.content, {this.lang = 'cs'})
      : _db = null,
        pantry = {},
        shopping = {};

  bool has(Ingredient i) => i.staple || pantry.contains(i.id);

  Future<void> setLang(String l) async {
    lang = l;
    notifyListeners();
    await _db?.insert('settings', {'key': 'lang', 'value': l}, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> addToPantry(Iterable<int> ids) async {
    pantry.addAll(ids);
    notifyListeners();
    final now = DateTime.now().millisecondsSinceEpoch;
    for (final id in ids) {
      await _db?.insert('pantry', {'ingredient_id': id, 'added_at': now}, conflictAlgorithm: ConflictAlgorithm.ignore);
    }
  }

  Future<void> removeFromPantry(int id) async {
    pantry.remove(id);
    notifyListeners();
    await _db?.delete('pantry', where: 'ingredient_id = ?', whereArgs: [id]);
  }

  Future<void> addToShopping(Iterable<int> ids) async {
    for (final id in ids) {
      shopping.putIfAbsent(id, () => false);
      await _db?.insert('shopping', {'ingredient_id': id}, conflictAlgorithm: ConflictAlgorithm.ignore);
    }
    notifyListeners();
  }

  Future<void> toggleShopping(int id) async {
    final v = !(shopping[id] ?? false);
    shopping[id] = v;
    notifyListeners();
    await _db?.update('shopping', {'checked': v ? 1 : 0}, where: 'ingredient_id = ?', whereArgs: [id]);
  }

  Future<void> removeFromShopping(int id) async {
    shopping.remove(id);
    notifyListeners();
    await _db?.delete('shopping', where: 'ingredient_id = ?', whereArgs: [id]);
  }

  /// „Nakoupeno“ (§11): odškrtnuté položky jdou do spíže a zmizí ze seznamu.
  Future<int> checkoutShopping() async {
    final done = shopping.entries.where((e) => e.value).map((e) => e.key).toList();
    for (final id in done) {
      shopping.remove(id);
      await _db?.delete('shopping', where: 'ingredient_id = ?', whereArgs: [id]);
    }
    await addToPantry(done);
    return done.length;
  }

  List<Ingredient> missing(Recipe r) => [
        for (final l in r.required)
          if (!has(l.ingredient)) l.ingredient
      ];

  /// Recepty seřazené podle počtu chybějících surovin, pak podle času (§8 zjednodušeně:
  /// bez množství a bez expirace, ty přijdou se spíží s množstvím).
  List<Match> matches() {
    final out = [for (final r in content.recipes) Match(r, missing(r))];
    out.sort((a, b) {
      final c = a.missing.length.compareTo(b.missing.length);
      if (c != 0) return c;
      final req = b.recipe.required.length.compareTo(a.recipe.required.length);
      if (a.missing.isEmpty && req != 0) return req; // víc využité spíže je lepší
      return a.recipe.totalMin.compareTo(b.recipe.totalMin);
    });
    return out;
  }
}
