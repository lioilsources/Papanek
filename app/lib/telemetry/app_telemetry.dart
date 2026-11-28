// Wiring of the anonymous usage statistics (docs/telemetry.md). Without
// TELEMETRY_KEY and TELEMETRY_HOST in the build nothing here records or sends
// anything.
import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../data/app_state.dart';
import 'telemetry_dictionary.dart';

/// The UI locale MaterialApp resolved last; reported as `lang`.
Locale telemetryUiLocale = const Locale('en');

/// The tab the tab bar shows; the `/` route reports it as its screen.
String telemetryTab = kTabScreens.first;

/// Starts the client. Never awaited by the app. [readyMs]: from `main` to
/// the loaded app state (on the first launch this includes copying
/// content.db out of the assets).
Future<void> startTelemetry(AppState state, {required DateTime launchedAt, required int readyMs}) async {
  final dir = await getApplicationSupportDirectory();
  final started = Telemetry.init(
    app: kTelemetryApp,
    appVersion: kAppVersion,
    dictionary: papanekDictionary,
    store: FileTelemetryStore(p.join(dir.path, 'telemetry')),
    lang: () => telemetryLocaleId(telemetryUiLocale),
    tester: !kReleaseMode,
    hadDataBefore: () => state.hadData,
    common: () => {'recipe_lang': state.lang == 'cs' ? 'cs' : 'en'},
    launchedAt: launchedAt,
  );
  Telemetry.track('app_ready', {'ms': readyMs.clamp(0, 60000)}); // queued until init is done
  await started;
}

/// Maps route names to screens; the tab bar (`/`) reports the current tab.
class PapanekNavigatorObserver extends TelemetryNavigatorObserver {
  PapanekNavigatorObserver() : super(kScreenRoutes);

  @override
  String screenOfName(String? name) => name == '/' ? telemetryTab : super.screenOfName(name);
}
