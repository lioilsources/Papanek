// The one event dictionary of Papánek, mirrored in docs/telemetry.md;
// test/telemetry_test.dart fails when the two drift apart.
import 'package:ol1n_telemetry/ol1n_telemetry.dart';

import '../l10n/app_localizations.dart';

/// The app version this build reports; test/telemetry_test.dart keeps it
/// equal to `version:` in pubspec.yaml, and the release workflows rewrite
/// both from the tag.
const kAppVersion = '1.0.0';

/// The id of this app in StoreMetrics (`apps.yaml`).
const kTelemetryApp = 'papanek';

/// Route name → screen. Pushed routes carry these names; `/` is the tab bar
/// and reports the current tab (see `PapanekNavigatorObserver`).
const kScreenRoutes = {
  '/': 'cook',
  '/recipe': 'recipe',
  '/cooking': 'cooking',
  '/shop': 'shop',
  '/settings': 'settings',
};

/// Tab index → screen, in the order of the tab bar.
const kTabScreens = ['cook', 'pantry', 'shopping', 'shop'];

final papanekDictionary = TelemetryDictionary(
  appVersion: kAppVersion,
  languages: {for (final l in AppLocalizations.supportedLocales) telemetryLocaleId(l)},
  screens: {...kScreenRoutes.values, ...kTabScreens},
  features: {
    'pantry',
    'shopping_list',
    'checkout',
    'cooking_mode',
    'step_timer',
    'servings',
    'recipe_lang',
    'pantry_deduct',
  },
  errorKinds: {'store_unavailable', 'purchase'},
  lockedTargets: {'recipe', 'unlock'},
  common: {
    'recipe_lang': const EnumProp({'cs', 'en'}),
  },
  events: {
    'app_ready': {'ms': const IntProp(60000)},
    'recipe_open': {'missing': const IntProp(100), 'free': const BoolProp()},
    ...TelemetryDictionary.flow(
      'cook',
      start: {'steps': const IntProp(100)},
      end: {'step': const IntProp(100), 'timers': const IntProp(100)},
    ),
    'pantry_add': {'items': const IntProp(10000)},
    'pantry_search_miss': {},
    'shopping_add': {'items': const IntProp(100)},
    'shopping_checkout': {'items': const IntProp(10000)},
    ...TelemetryDictionary.flow(
      'purchase',
      results: {'restored'},
      start: {
        'target': const EnumProp({'all', 'pack'}),
      },
    ),
  },
);
