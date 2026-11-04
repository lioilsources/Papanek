import 'package:flutter_test/flutter_test.dart';
import 'package:papanek/data/app_state.dart';
import 'package:papanek/data/content.dart';
import 'package:papanek/screens/widgets.dart';

Ingredient ing(int id, String slug, {bool staple = false}) => Ingredient(id, slug, slug, slug, 'zelenina', staple, []);

Recipe recipe(int id, int minutes, List<Ingredient> items, {List<Ingredient> optional = const []}) {
  final r = Recipe(id, 'r$id', 'free', 'czech', 1, minutes, 0, 4, null);
  for (final i in items) {
    r.lines.add(RecipeLine(i, 1, 'ks', false, {}));
  }
  for (final i in optional) {
    r.lines.add(RecipeLine(i, 1, 'ks', true, {}));
  }
  r.text['cs'] = RecipeText('R$id', '', [Step('a', 0)], '');
  return r;
}

void main() {
  final egg = ing(1, 'egg'), rice = ing(2, 'rice'), salt = ing(3, 'salt', staple: true), herb = ing(4, 'herb');
  final omelette = recipe(1, 10, [egg, salt], optional: [herb]);
  final friedRice = recipe(2, 20, [egg, rice, salt]);
  final content = Content.test({for (final i in [egg, rice, salt, herb]) i.id: i}, [friedRice, omelette]);

  test('základy a volitelné suroviny nechybí', () {
    final s = AppState.memory(content)..pantry.add(egg.id);
    expect(s.missing(omelette), isEmpty);
    expect(s.missing(friedRice).map((i) => i.slug), ['rice']);
  });

  test('řazení: nejdřív co jde hned, při shodě víc využité spíže', () {
    final s = AppState.memory(content)..pantry.addAll([egg.id, rice.id]);
    expect(s.matches().map((m) => m.recipe.id), [2, 1]);
    s.pantry.remove(rice.id);
    expect(s.matches().map((m) => m.recipe.id), [1, 2]);
  });

  test('normalizace odpovídá Go: bez diakritiky, malá písmena', () {
    expect(normalize('Kuřecí  PRSA!'), 'kureci prsa');
    expect(normalize('Crème brûlée'), 'creme brulee');
  });

  test('množství', () {
    expect(formatQty(0.5), '½');
    expect(formatQty(1.5), '1½');
    expect(formatQty(250), '250');
    expect(formatQty(1.2), '1.2');
    expect(formatQty(3), '3');
  });

  test('našeptávač: diakritika má přednost před shodou bez ní', () {
    final chicken = ing(10, 'whole_chicken'), lemon = ing(11, 'lemon');
    final c = Content.test({10: chicken, 11: lemon}, [], [
      Alias(11, 'kůra z citronu', 'kura z citronu', 'cs'),
      Alias(10, 'kuře', 'kure', 'cs'),
    ]);
    expect(c.suggest('kuř', 'cs').map((i) => i.slug), ['whole_chicken', 'lemon']);
    expect(c.suggest('kur', 'cs').first.slug, 'whole_chicken');
  });
}
