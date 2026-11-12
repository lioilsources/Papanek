// Čtení content.db (plán §4): read-only obsah přibalený v assets.
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Ingredient {
  Ingredient(this.id, this.slug, this.cs, this.en, this.category, this.staple, this.allergens);
  final int id;
  final String slug, cs, en, category;
  final bool staple;
  final List<String> allergens;
  String name(String lang) => lang == 'cs' ? cs : en;
}

class RecipeLine {
  RecipeLine(this.ingredient, this.qty, this.unit, this.optional, this.note);
  final Ingredient ingredient;
  final double? qty;
  final String? unit;
  final bool optional;
  final Map<String, String> note;
}

class Step {
  Step(this.text, this.timerSec);
  final String text;
  final int timerSec;
}

class RecipeText {
  RecipeText(this.title, this.summary, this.steps, this.tips);
  final String title, summary, tips;
  final List<Step> steps;
}

class Recipe {
  Recipe(
    this.id,
    this.slug,
    this.pack,
    this.cuisine,
    this.difficulty,
    this.prepMin,
    this.cookMin,
    this.servings,
    this.image,
  );
  final int id, difficulty, prepMin, cookMin, servings;
  final String slug, pack, cuisine;
  final String? image;
  final lines = <RecipeLine>[];
  final tags = <String>{};
  final text = <String, RecipeText>{};
  int get totalMin => prepMin + cookMin;
  RecipeText t(String lang) => text[lang] ?? text.values.first;

  /// Suroviny, na kterých záleží pro „co uvařím“ (§8): bez volitelných a bez základů.
  Iterable<RecipeLine> get required => lines.where((l) => !l.optional && !l.ingredient.staple);
}

/// Balíček receptů (§5). `free` nemá produkt a je odemčený vždy.
class Pack {
  Pack(this.id, this.cs, this.en, this.productIos, this.productAndroid, this.sort);
  final String id, cs, en;
  final String? productIos, productAndroid;
  final int sort;
  bool get free => id == freePack;
  String name(String lang) => lang == 'cs' ? cs : en;
}

const freePack = 'free';

class Unit {
  Unit(this.id, this.name);
  final String id, name;
}

class Alias {
  Alias(this.ingredientId, this.alias, this.norm, this.lang);
  final int ingredientId;
  final String alias, norm, lang;
}

class Content {
  Content._(this.ingredients, this.recipes, this.units, this.aliases, this.packs);

  @visibleForTesting
  Content.test(this.ingredients, this.recipes, [this.aliases = const [], this.packs = const []]) : units = {};
  final Map<int, Ingredient> ingredients;
  final List<Pack> packs; // podle sort
  int recipeCount(String pack) => recipes.where((r) => r.pack == pack).length;
  final List<Recipe> recipes;
  final Map<String, Unit> units;
  final List<Alias> aliases;

  static Future<Content> load() async {
    // sqflite neotevře asset přímo: zkopírovat do podpory appky, když se změnila verze.
    final dir = await getApplicationSupportDirectory();
    final path = p.join(dir.path, 'content.db');
    final data = await rootBundle.load('assets/content.db');
    final bytes = data.buffer.asUint8List();
    final f = File(path);
    if (!f.existsSync() || f.lengthSync() != bytes.length) {
      await f.parent.create(recursive: true);
      await f.writeAsBytes(bytes, flush: true);
    }
    final db = await openDatabase(path, readOnly: true, singleInstance: false);
    try {
      final ings = <int, Ingredient>{};
      for (final r in await db.query('ingredients')) {
        ings[r['id'] as int] = Ingredient(
          r['id'] as int,
          r['slug'] as String,
          r['canonical_name_cs'] as String,
          r['canonical_name_en'] as String,
          r['category'] as String,
          (r['is_staple'] as int) == 1,
          (jsonDecode(r['allergens'] as String? ?? '[]') as List).cast<String>(),
        );
      }
      final units = {
        for (final r in await db.query('units')) r['id'] as String: Unit(r['id'] as String, r['name'] as String),
      };
      final recipes = <int, Recipe>{};
      for (final r in await db.query('recipes', orderBy: 'id')) {
        recipes[r['id'] as int] = Recipe(
          r['id'] as int,
          r['slug'] as String,
          r['pack_id'] as String,
          r['cuisine'] as String,
          r['difficulty'] as int,
          r['prep_min'] as int,
          r['cook_min'] as int,
          r['servings'] as int,
          r['image_file'] as String?,
        );
      }
      for (final r in await db.query('recipe_ingredients')) {
        final rec = recipes[r['recipe_id'] as int];
        final ing = ings[r['ingredient_id'] as int];
        if (rec == null || ing == null) continue;
        final note = r['note'] as String?;
        rec.lines.add(
          RecipeLine(
            ing,
            (r['qty'] as num?)?.toDouble(),
            r['unit'] as String?,
            (r['optional'] as int) == 1,
            note == null ? {} : (jsonDecode(note) as Map).cast<String, String>(),
          ),
        );
      }
      for (final r in await db.query('recipe_tags')) {
        recipes[r['recipe_id'] as int]?.tags.add(r['tag'] as String);
      }
      for (final r in await db.query('recipe_translations')) {
        final steps = (jsonDecode(r['steps'] as String) as List)
            .map((s) => Step(s['text'] as String, (s['timer_sec'] as num?)?.toInt() ?? 0))
            .toList();
        recipes[r['recipe_id'] as int]?.text[r['lang'] as String] = RecipeText(
          r['title'] as String,
          r['summary'] as String,
          steps,
          r['tips'] as String,
        );
      }
      final aliases = [
        for (final r in await db.query('ingredient_aliases'))
          Alias(r['ingredient_id'] as int, r['alias'] as String, r['alias_ascii'] as String, r['lang'] as String),
      ];
      final packs = [
        for (final r in await db.query('packs', orderBy: 'sort'))
          Pack(
            r['id'] as String,
            r['name_cs'] as String,
            r['name_en'] as String,
            r['product_id_ios'] as String?,
            r['product_id_android'] as String?,
            r['sort'] as int,
          ),
      ];
      return Content._(ings, recipes.values.toList(), units, aliases, packs);
    } finally {
      await db.close();
    }
  }

  /// Našeptávač pro spíž (§11): prefix i podřetězec nad aliasy, bez diakritiky.
  List<Ingredient> suggest(String query, String lang, {int limit = 12}) {
    final raw = query.toLowerCase().trim();
    final q = normalize(query);
    if (q.isEmpty) return [];
    // Shoda s diakritikou má přednost: „kuř“ je kuře, ne „kůra z citronu“.
    final score = <int, int>{};
    for (final a in aliases) {
      int? s;
      if (a.alias == raw) {
        s = 0;
      } else if (a.alias.startsWith(raw)) {
        s = 1;
      } else if (a.norm == q) {
        s = 2;
      } else if (a.norm.startsWith(q)) {
        s = 3;
      } else if (a.alias.contains(' $raw')) {
        s = 4;
      } else if (a.norm.contains(' $q')) {
        s = 5;
      } else if (q.length >= 3 && a.norm.contains(q)) {
        s = 6;
      }
      if (s == null) continue;
      // Při shodě vyhrává kratší alias: „kure“ je přesnější než „kura z citronu“.
      s = (s * 2 + (a.lang == lang ? 0 : 1)) * 1000 + a.alias.length.clamp(0, 999);
      final prev = score[a.ingredientId];
      if (prev == null || s < prev) score[a.ingredientId] = s;
    }
    final ids = score.keys.toList()
      ..sort((a, b) {
        final c = score[a]!.compareTo(score[b]!);
        return c != 0 ? c : ingredients[a]!.name(lang).length.compareTo(ingredients[b]!.name(lang).length);
      });
    return ids.take(limit).map((id) => ingredients[id]!).toList();
  }
}

const _from = 'áäčďéěëíňóöřšťúůüýžàâèêîôûçñ';
const _to = 'aacdeeeinoorstuuuyzaaeeiouucn';

/// Stejná normalizace jako ontology.Normalize v Go: malá písmena, bez diakritiky.
String normalize(String s) {
  final b = StringBuffer();
  for (final ch in s.toLowerCase().runes) {
    final c = String.fromCharCode(ch);
    final i = _from.indexOf(c);
    final out = i >= 0 ? _to[i] : c;
    b.write(RegExp(r'[a-z0-9]').hasMatch(out) ? out : ' ');
  }
  return b.toString().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).join(' ');
}
