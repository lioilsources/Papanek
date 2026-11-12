import 'package:flutter_test/flutter_test.dart';
import 'package:papanek/data/app_state.dart';
import 'package:papanek/data/content.dart';
import 'package:papanek/data/store.dart';

Recipe recipe(int id, String pack, List<Ingredient> items) {
  final r = Recipe(id, 'r$id', pack, 'czech', 1, 10, 0, 4, null);
  for (final i in items) {
    r.lines.add(RecipeLine(i, 1, 'ks', false, {}));
  }
  r.text['cs'] = RecipeText('R$id', '', [Step('a', 0)], '');
  return r;
}

void main() {
  final egg = Ingredient(1, 'egg', 'vejce', 'egg', 'vejce', false, []);
  final locked = recipe(1, 'czech', [egg]);
  final free = recipe(2, freePack, [egg]);
  final content = Content.test({egg.id: egg}, [locked, free]);

  test('free je odemčený vždy, placený až po nákupu', () async {
    final s = AppState.memory(content);
    expect(s.unlocked(free), isTrue);
    expect(s.unlocked(locked), isFalse);
    await s.grant('czech');
    expect(s.unlocked(locked), isTrue);
  });

  test('„Vše“ odemkne každý balíček', () async {
    final s = AppState.memory(content);
    await s.grant(allPack);
    expect(s.unlocked(locked), isTrue);
  });

  test('zamčené recepty jsou za odemčenými se stejným počtem chybějících', () async {
    final s = AppState.memory(content)..pantry.add(egg.id);
    expect(s.matches().map((m) => m.recipe.id), [2, 1]);
    await s.grant('czech');
    expect(s.matches().map((m) => m.recipe.id), [1, 2]); // pak rozhoduje čas, tady stejný → původní pořadí
  });
}
