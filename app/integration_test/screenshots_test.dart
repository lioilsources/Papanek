// Projde hlavní obrazovky s naplněnou spíží a vyfotí je (podklad i pro App Store).
//
//   flutter drive --driver=test_driver/integration_test.dart \
//     --target=integration_test/screenshots_test.dart -d <simulátor>
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:papanek/data/app_state.dart';
import 'package:papanek/main.dart';
import 'package:papanek/screens/cook_list.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('screenshoty', (tester) async {
    final state = await AppState.load('cs');
    await state.setLang('cs');
    const have = ['egg', 'butter', 'parmesan', 'spaghetti', 'garlic', 'chilli_flakes', 'potato', 'onion',
      'chicken_breast', 'rice_white', 'soy_sauce', 'tomato', 'parsley', 'milk', 'flour_plain'];
    final bySlug = {for (final i in state.content.ingredients.values) i.slug: i.id};
    await state.addToPantry([for (final s in have) if (bySlug[s] != null) bySlug[s]!]);

    await tester.pumpWidget(PapanekApp(state: state));
    await tester.pumpAndSettle();
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
    await binding.takeScreenshot('1_co_uvarim');

    await tester.tap(find.byType(RecipeCard).first);
    await tester.pumpAndSettle();
    await binding.takeScreenshot('2_recept');
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -700));
    await tester.pumpAndSettle();
    await binding.takeScreenshot('3_recept_suroviny');

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FilledButton).last);
    await tester.pumpAndSettle();
    await binding.takeScreenshot('4_vareni');
    final nav = tester.state<NavigatorState>(find.byType(Navigator).first);
    nav.popUntil((r) => r.isFirst);
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.kitchen));
    await tester.pumpAndSettle();
    await binding.takeScreenshot('5_spiz');
    await tester.enterText(find.byType(TextField), 'kuř');
    await tester.pumpAndSettle();
    await binding.takeScreenshot('6_naseptavac');
  });
}
