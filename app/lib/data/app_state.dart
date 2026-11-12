// Stav uživatele (spíž, nákup, jazyk) v user.db a matching „co uvařím“ (§8).
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'content.dart';
import 'store.dart';

class Match {
  Match(this.recipe, this.missing);
  final Recipe recipe;
  final List<Ingredient> missing;
}

class AppState extends ChangeNotifier {
  AppState(this.content, this._db, this.pantry, this.shopping, this.lang, this.owned);
  final Content content;
  final Database? _db;
  final Set<int> pantry; // ingredient_id, který doma je
  final Map<int, bool> shopping; // ingredient_id → odškrtnuto
  String lang;
  final Set<String> owned; // odemčené balíčky (cache stavu IAP, §6 purchases)
  Shop? shop;

  static Future<AppState> load(String systemLang) async {
    final content = await Content.load();
    final dir = await getApplicationSupportDirectory();
    const purchases = 'CREATE TABLE purchases (pack_id TEXT PRIMARY KEY, purchased_at INTEGER NOT NULL)';
    final db = await openDatabase(
      p.join(dir.path, 'user.db'),
      version: 2,
      onCreate: (db, _) async {
        await db.execute('CREATE TABLE pantry (ingredient_id INTEGER PRIMARY KEY, added_at INTEGER NOT NULL)');
        await db.execute(
          'CREATE TABLE shopping (ingredient_id INTEGER PRIMARY KEY, checked INTEGER NOT NULL DEFAULT 0)',
        );
        await db.execute('CREATE TABLE settings (key TEXT PRIMARY KEY, value TEXT NOT NULL)');
        await db.execute(purchases);
      },
      onUpgrade: (db, from, _) async {
        if (from < 2) await db.execute(purchases);
      },
    );
    final pantry = {for (final r in await db.query('pantry')) r['ingredient_id'] as int};
    final shopping = {
      for (final r in await db.query('shopping')) r['ingredient_id'] as int: (r['checked'] as int) == 1,
    };
    final s = await db.query('settings', where: 'key = ?', whereArgs: ['lang']);
    final lang = s.isNotEmpty ? s.first['value'] as String : (systemLang == 'cs' ? 'cs' : 'en');
    final owned = {for (final r in await db.query('purchases')) r['pack_id'] as String};
    final state = AppState(content, db, pantry, shopping, lang, owned);
    state.shop = Shop(content.packs, state.grant)..addListener(state.notifyListeners);
    unawaited(state.shop!.init()); // start appky nečeká na store
    return state;
  }

  /// Pro testy: stav bez úložiště.
  @visibleForTesting
  AppState.memory(this.content, {this.lang = 'cs'}) : _db = null, pantry = {}, shopping = {}, owned = {};

  bool ownsPack(String pack) => pack == freePack || owned.contains(pack) || owned.contains(allPack);
  bool unlocked(Recipe r) => ownsPack(r.pack);

  /// Odemkne balíček po nákupu nebo obnovení. Idempotentní.
  Future<void> grant(String pack) async {
    if (!owned.add(pack)) return;
    notifyListeners();
    await _db?.insert('purchases', {
      'pack_id': pack,
      'purchased_at': DateTime.now().millisecondsSinceEpoch,
    }, conflictAlgorithm: ConflictAlgorithm.ignore);
  }

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
      if (!has(l.ingredient)) l.ingredient,
  ];

  /// Recepty seřazené podle počtu chybějících surovin, pak podle času (§8 zjednodušeně:
  /// bez množství a bez expirace, ty přijdou se spíží s množstvím).
  List<Match> matches() {
    final out = [for (final r in content.recipes) Match(r, missing(r))];
    out.sort((a, b) {
      final c = a.missing.length.compareTo(b.missing.length);
      if (c != 0) return c;
      // Zamčené recepty se ukazují taky (upsell, §8), ale až za odemčenými.
      final lock = (unlocked(a.recipe) ? 0 : 1).compareTo(unlocked(b.recipe) ? 0 : 1);
      if (lock != 0) return lock;
      final req = b.recipe.required.length.compareTo(a.recipe.required.length);
      if (a.missing.isEmpty && req != 0) return req; // víc využité spíže je lepší
      return a.recipe.totalMin.compareTo(b.recipe.totalMin);
    });
    return out;
  }
}
