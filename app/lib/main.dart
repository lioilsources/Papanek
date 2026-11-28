import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ol1n_telemetry/ol1n_telemetry.dart';

import 'data/app_state.dart';
import 'l10n/app_localizations.dart';
import 'screens/cook_list.dart';
import 'screens/pantry.dart';
import 'screens/shop.dart';
import 'screens/shopping.dart';
import 'telemetry/app_telemetry.dart';
import 'telemetry/telemetry_dictionary.dart';

Future<void> main() async {
  final launchedAt = DateTime.now();
  WidgetsFlutterBinding.ensureInitialized();
  telemetryUiLocale = resolveLocale(ui.PlatformDispatcher.instance.locales, AppLocalizations.supportedLocales);
  final state = await AppState.load(ui.PlatformDispatcher.instance.locale.languageCode);
  final readyMs = DateTime.now().difference(launchedAt).inMilliseconds;
  unawaited(startTelemetry(state, launchedAt: launchedAt, readyMs: readyMs)); // the app never waits for it
  runApp(PapanekApp(state: state));
}

/// Zpřístupní stav celé appce a přestaví závislé widgety při změně.
class Scope extends InheritedNotifier<AppState> {
  const Scope({super.key, required AppState state, required super.child}) : super(notifier: state);
  static AppState of(BuildContext c) => c.dependOnInheritedWidgetOfExactType<Scope>()!.notifier!;
}

const brand = Color(0xFFE8833A);

/// Picks the best supported UI locale for the system locales, falling back to English.
Locale resolveLocale(List<Locale>? locales, Iterable<Locale> supported) {
  final wanted = [
    for (final l in locales ?? const <Locale>[])
      if (l.languageCode == 'no')
        Locale.fromSubtags(languageCode: 'nb', scriptCode: l.scriptCode, countryCode: l.countryCode)
      else
        l,
  ];
  final r = basicLocaleListResolution(wanted, supported);
  return wanted.any((l) => l.languageCode == r.languageCode) ? r : const Locale('en');
}

ThemeData theme(Brightness b) {
  final scheme = ColorScheme.fromSeed(seedColor: brand, brightness: b);
  return ThemeData(
    colorScheme: scheme,
    useMaterial3: true,
    textTheme: Typography.material2021(platform: TargetPlatform.iOS).black.apply(
      bodyColor: b == Brightness.dark ? Colors.white : null,
      displayColor: b == Brightness.dark ? Colors.white : null,
    ),
    cardTheme: const CardThemeData(clipBehavior: Clip.antiAlias, margin: EdgeInsets.zero),
  );
}

class PapanekApp extends StatelessWidget {
  const PapanekApp({super.key, required this.state});
  final AppState state;

  @override
  Widget build(BuildContext context) {
    return Scope(
      state: state,
      child: ListenableBuilder(
        listenable: state,
        builder: (context, _) => MaterialApp(
          onGenerateTitle: (c) => AppLocalizations.of(c).appTitle,
          debugShowCheckedModeBanner: false,
          // The UI follows the system language; state.lang only selects the recipe language (cs / en).
          localeListResolutionCallback: (locales, supported) => telemetryUiLocale = resolveLocale(locales, supported),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: theme(Brightness.light),
          darkTheme: theme(Brightness.dark),
          navigatorObservers: [PapanekNavigatorObserver()],
          home: const Home(),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final s = Scope.of(context);
    final open = s.shopping.length;
    // Kuchyně (obchod) jen když má nějaký placený balíček recepty; v 1.0 jsou všechny zdarma.
    final shop = s.content.packs.any((p) => !p.free && s.content.recipeCount(p.id) > 0);
    if (!shop && tab > 2) tab = 0;
    telemetryTab = kTabScreens[tab];
    return Scaffold(
      body: IndexedStack(
        index: tab,
        children: [const CookList(), const PantryScreen(), const ShoppingScreen(), if (shop) const ShopScreen()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) {
          setState(() => tab = i);
          Telemetry.screen(kTabScreens[i]);
          if (kTabScreens[i] == 'shop') reportShopShown(s);
        },
        destinations: [
          NavigationDestination(icon: const Icon(Icons.restaurant_menu), label: l.tabCook),
          NavigationDestination(icon: const Icon(Icons.kitchen), label: l.tabPantry),
          NavigationDestination(
            icon: Badge(isLabelVisible: open > 0, label: Text('$open'), child: const Icon(Icons.shopping_basket)),
            label: l.tabShopping,
          ),
          if (shop) NavigationDestination(icon: const Icon(Icons.storefront), label: l.tabShop),
        ],
      ),
    );
  }
}
