// The checks of ol1n_telemetry's test kit: dictionary ↔ docs/telemetry.md,
// no free text, version constant ↔ pubspec, literal event names, no key → no
// network, off → nothing. Plus the screen mapping of the tab bar.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';
import 'package:ol1n_telemetry/testing.dart';
import 'package:papanek/telemetry/app_telemetry.dart';
import 'package:papanek/telemetry/telemetry_dictionary.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('docs/telemetry.md lists exactly the dictionary', () {
    expect(telemetryDocProblems(papanekDictionary, File('../docs/telemetry.md').readAsStringSync()), isEmpty);
  });

  test('no property is free text', () {
    expect(telemetryDictionaryProblems(papanekDictionary), isEmpty);
  });

  test('app version matches pubspec.yaml', () {
    expect(telemetryVersionProblems(kAppVersion, File('pubspec.yaml').readAsStringSync()), isEmpty);
  });

  test('the code sends only dictionary events, and every one of them', () {
    expect(telemetryTrackCallProblems(papanekDictionary), isEmpty);
  });

  test('no key, no network', () async {
    expect(await telemetryNoKeyProblems(papanekDictionary), isEmpty);
  }, skip: const bool.fromEnvironment('TELEMETRY_DEBUG'));

  test('off means nothing', () async {
    expect(await telemetryOffProblems(papanekDictionary), isEmpty);
  });

  test('every tab and route maps to a dictionary screen', () {
    final screens = papanekDictionary.events['screen_view']!['screen']!;
    for (final s in [...kTabScreens, ...kScreenRoutes.values]) {
      expect(screens.accepts(s), isTrue, reason: s);
    }
    final o = PapanekNavigatorObserver();
    telemetryTab = 'pantry';
    expect(o.screenOfName('/'), 'pantry');
    expect(o.screenOfName('/recipe'), 'recipe');
    expect(o.screenOfName(null), 'other');
    telemetryTab = kTabScreens.first;
  });

  group('session', () {
    tearDown(Telemetry.resetForTest);

    test('a cook from the tab bar is recorded as the dictionary says', () async {
      final sink = FakeSink();
      await Telemetry.init(
        app: kTelemetryApp,
        appVersion: kAppVersion,
        dictionary: papanekDictionary,
        store: MemoryTelemetryStore(),
        lang: () => 'cs',
        common: () => {'recipe_lang': 'cs'},
        sink: sink,
        startTimer: false,
        observeLifecycle: false,
      );
      Telemetry.screen('cook');
      Telemetry.track('recipe_open', {'missing': 0, 'free': true});
      Telemetry.screen('recipe');
      final f = Telemetry.flow('cook', {'steps': 4});
      Telemetry.feature('cooking_mode');
      f.end('ok', {'step': 4, 'timers': 1});
      Telemetry.activation();
      final names = Telemetry.debugQueue.map((e) => e.name).toList();
      expect(
        names,
        containsAllInOrder(['app_open', 'screen_view', 'recipe_open', 'cook_start', 'cook_end', 'activation']),
      );
      expect(Telemetry.debugQueue.every((e) => papanekDictionary.valid(e.name, e.props)), isTrue);
    });
  });
}
