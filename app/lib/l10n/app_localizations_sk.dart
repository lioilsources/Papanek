// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Čo uvarím';

  @override
  String get tabPantry => 'Špajza';

  @override
  String get tabShopping => 'Nákup';

  @override
  String get groupReady => 'Môžeš hneď';

  @override
  String get groupMissing1 => 'Chýba 1 vec';

  @override
  String get groupMissing23 => 'Chýbajú 2–3 veci';

  @override
  String get groupMore => 'Treba nakúpiť';

  @override
  String get emptyPantryHint =>
      'Pridaj, čo máš doma, a ukážem ti, čo z toho uvaríš.';

  @override
  String get addToPantry => 'Pridať do špajze';

  @override
  String get searchIngredient => 'Čo máš doma? (napr. vajcia, ryža)';

  @override
  String get pantryEmpty => 'Špajza je prázdna. Pridaj prvú surovinu.';

  @override
  String get pantryStaplesNote =>
      'Soľ, korenie, olej a ďalšie základy počítam, že máš doma.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Porcií: $n',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'jednoduché',
      '2': 'zvládnuteľné',
      'other': 'náročnejšie',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'chýba: $n',
      zero: 'máš všetko',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Suroviny';

  @override
  String get steps => 'Postup';

  @override
  String get tips => 'Rady';

  @override
  String get optional => 'nepovinné';

  @override
  String get toTaste => 'podľa chuti';

  @override
  String get addMissingToShopping => 'Chýbajúce na nákup';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Pridané položky: $n',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Variť';

  @override
  String stepOf(int i, int n) {
    return 'Krok $i z $n';
  }

  @override
  String get next => 'Ďalej';

  @override
  String get back => 'Späť';

  @override
  String get done => 'Hotovo';

  @override
  String startTimer(String t) {
    return 'Spustiť časovač $t';
  }

  @override
  String get timerDone => 'Čas vypršal!';

  @override
  String get cookedTitle => 'Dobrú chuť!';

  @override
  String get cookedBody => 'Uvarené. Odobrať použité suroviny zo špajze?';

  @override
  String get removeUsed => 'Odobrať';

  @override
  String get keep => 'Nechať';

  @override
  String get shoppingEmpty => 'Nákupný zoznam je prázdny.';

  @override
  String get checkout => 'Nakúpené';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Surovín v špajze: $n',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Jazyk receptov';

  @override
  String get noRecipes => 'Recepty sa ešte pripravujú.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Česká',
      'italian': 'Talianska',
      'vietnamese': 'Vietnamská',
      'asian': 'Ázijská',
      'mexmed': 'Mexická a stredomorská',
      'quick': 'Rýchlovka',
      'family': 'Rodinná',
      'other': 'Ostatné',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Zelenina',
      'ovoce': 'Ovocie',
      'houby': 'Huby',
      'cerstve_bylinky': 'Čerstvé bylinky',
      'maso': 'Mäso',
      'uzeniny': 'Údeniny',
      'ryby': 'Ryby',
      'mlecne': 'Mliečne',
      'vejce': 'Vajcia',
      'rostlinne_bilkoviny': 'Tofu a spol.',
      'obiloviny': 'Obilniny',
      'mouka': 'Múka',
      'testoviny': 'Cestoviny',
      'pecivo': 'Pečivo',
      'lusteniny': 'Strukoviny',
      'orechy_seminka': 'Orechy a semienka',
      'susene_plody': 'Sušené ovocie',
      'koreni': 'Korenie',
      'oleje_tuky': 'Oleje a tuky',
      'ocet_omacky': 'Omáčky a ocot',
      'sladidla': 'Sladidlá',
      'konzervy': 'Konzervy',
      'napoje': 'Nápoje',
      'other': 'Ostatné',
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
      'ks': 'ks',
      'lzice': 'lyžica',
      'lzicka': 'lyžička',
      'hrnek': 'hrnček',
      'strouzek': 'strúčik',
      'stipka': 'štipka',
      'plechovka': 'plechovka',
      'svazek': 'zväzok',
      'hrst': 'hrsť',
      'platek': 'plátok',
      'dkg': 'dkg',
      'balicek': 'balíček',
      'stonek': 'stonka',
      'snitka': 'vetvička',
      'kostka': 'kocka',
      'hlava': 'hlávka',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Cuisines';

  @override
  String get restorePurchases => 'Restore purchases';

  @override
  String get restoreStarted => 'Restoring purchases…';

  @override
  String get storeUnavailable =>
      'The store isn\'t available right now. Try again when you\'re online.';

  @override
  String get storeLoading => 'Loading prices…';

  @override
  String get unlockedLabel => 'Unlocked';

  @override
  String buy(String price) {
    return 'Buy · $price';
  }

  @override
  String get notForSale => 'Not available yet';

  @override
  String get purchasePending => 'Waiting for confirmation…';

  @override
  String purchaseFailed(String msg) {
    return 'Purchase failed: $msg';
  }

  @override
  String get allPacksTitle => 'All cuisines';

  @override
  String get allPacksBody =>
      'Unlocks every pack at once, cheaper than one by one.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n recipes',
      one: '$n recipe',
      zero: 'recipes coming soon',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Recipe from the $pack pack';
  }

  @override
  String get lockedBody =>
      'You can see the ingredients; the steps and cooking mode unlock with the pack.';

  @override
  String get unlock => 'Unlock';
}
