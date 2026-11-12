// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Was koche ich';

  @override
  String get tabPantry => 'Vorrat';

  @override
  String get tabShopping => 'Einkauf';

  @override
  String get groupReady => 'Sofort möglich';

  @override
  String get groupMissing1 => '1 Zutat fehlt';

  @override
  String get groupMissing23 => '2–3 Zutaten fehlen';

  @override
  String get groupMore => 'Einkauf nötig';

  @override
  String get emptyPantryHint =>
      'Füge hinzu, was du zu Hause hast, und ich zeige dir, was du daraus kochen kannst.';

  @override
  String get addToPantry => 'Zum Vorrat hinzufügen';

  @override
  String get searchIngredient => 'Was hast du da? (z. B. Eier, Reis)';

  @override
  String get pantryEmpty => 'Dein Vorrat ist leer. Füge die erste Zutat hinzu.';

  @override
  String get pantryStaplesNote =>
      'Ich gehe davon aus, dass du Salz, Pfeffer, Öl und andere Grundzutaten zu Hause hast.';

  @override
  String minutes(int n) {
    return '$n Min.';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Portionen',
      one: '$n Portion',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'einfach',
      '2': 'machbar',
      'other': 'anspruchsvoller',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n fehlen',
      zero: 'alles da',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Zutaten';

  @override
  String get steps => 'Zubereitung';

  @override
  String get tips => 'Tipps';

  @override
  String get optional => 'optional';

  @override
  String get toTaste => 'nach Geschmack';

  @override
  String get addMissingToShopping => 'Fehlendes auf den Einkaufszettel';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Artikel hinzugefügt',
      one: '$n Artikel hinzugefügt',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Kochen';

  @override
  String stepOf(int i, int n) {
    return 'Schritt $i von $n';
  }

  @override
  String get next => 'Weiter';

  @override
  String get back => 'Zurück';

  @override
  String get done => 'Fertig';

  @override
  String startTimer(String t) {
    return 'Timer $t starten';
  }

  @override
  String get timerDone => 'Zeit ist um!';

  @override
  String get cookedTitle => 'Guten Appetit!';

  @override
  String get cookedBody =>
      'Fertig gekocht. Verbrauchte Zutaten aus dem Vorrat entfernen?';

  @override
  String get removeUsed => 'Entfernen';

  @override
  String get keep => 'Behalten';

  @override
  String get shoppingEmpty => 'Deine Einkaufsliste ist leer.';

  @override
  String get checkout => 'Eingekauft';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Zutaten sind im Vorrat',
      one: '$n Zutat ist im Vorrat',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Rezeptsprache';

  @override
  String get noRecipes => 'Die Rezepte sind noch in Arbeit.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Tschechisch',
      'italian': 'Italienisch',
      'vietnamese': 'Vietnamesisch',
      'asian': 'Asiatisch',
      'mexmed': 'Mexikanisch & mediterran',
      'quick': 'Schnell',
      'family': 'Familie',
      'other': 'Sonstiges',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Gemüse',
      'ovoce': 'Obst',
      'houby': 'Pilze',
      'cerstve_bylinky': 'Frische Kräuter',
      'maso': 'Fleisch',
      'uzeniny': 'Wurstwaren',
      'ryby': 'Fisch',
      'mlecne': 'Milchprodukte',
      'vejce': 'Eier',
      'rostlinne_bilkoviny': 'Tofu & Co.',
      'obiloviny': 'Getreide',
      'mouka': 'Mehl',
      'testoviny': 'Nudeln',
      'pecivo': 'Brot & Gebäck',
      'lusteniny': 'Hülsenfrüchte',
      'orechy_seminka': 'Nüsse & Samen',
      'susene_plody': 'Trockenobst',
      'koreni': 'Gewürze',
      'oleje_tuky': 'Öle & Fette',
      'ocet_omacky': 'Soßen & Essig',
      'sladidla': 'Süßungsmittel',
      'konzervy': 'Konserven',
      'napoje': 'Getränke',
      'other': 'Sonstiges',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'g',
      'kg': 'kg',
      'ml': 'ml',
      'l': 'l',
      'dl': 'dl',
      'cl': 'cl',
      'ks': 'Stk.',
      'lzice': 'EL',
      'lzicka': 'TL',
      'hrnek': 'Tasse',
      'strouzek': 'Zehe',
      'stipka': 'Prise',
      'plechovka': 'Dose',
      'svazek': 'Bund',
      'hrst': 'Handvoll',
      'platek': 'Scheibe',
      'dkg': 'dag',
      'balicek': 'Päckchen',
      'stonek': 'Stängel',
      'snitka': 'Zweig',
      'kostka': 'Würfel',
      'hlava': 'Kopf',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Küchen';

  @override
  String get restorePurchases => 'Käufe wiederherstellen';

  @override
  String get restoreStarted => 'Käufe werden wiederhergestellt…';

  @override
  String get storeUnavailable =>
      'Der Store ist gerade nicht verfügbar. Versuch es später erneut, wenn du online bist.';

  @override
  String get storeLoading => 'Preise werden geladen…';

  @override
  String get unlockedLabel => 'Freigeschaltet';

  @override
  String buy(String price) {
    return 'Kaufen · $price';
  }

  @override
  String get notForSale => 'Noch nicht erhältlich';

  @override
  String get purchasePending => 'Warte auf Bestätigung…';

  @override
  String purchaseFailed(String msg) {
    return 'Kauf fehlgeschlagen: $msg';
  }

  @override
  String get allPacksTitle => 'Alle Küchen';

  @override
  String get allPacksBody =>
      'Schaltet alle Pakete auf einmal frei, günstiger als einzeln.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Rezepte',
      one: '$n Rezept',
      zero: 'Rezepte in Vorbereitung',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Rezept aus dem Paket $pack';
  }

  @override
  String get lockedBody =>
      'Die Zutaten siehst du schon; Anleitung und Kochmodus werden mit dem Paket freigeschaltet.';

  @override
  String get unlock => 'Freischalten';
}
