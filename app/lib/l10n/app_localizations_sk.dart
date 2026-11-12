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
  String get tabShop => 'Kuchyne';

  @override
  String get restorePurchases => 'Obnoviť nákupy';

  @override
  String get restoreStarted => 'Obnovujem nákupy…';

  @override
  String get storeUnavailable =>
      'Obchod teraz nie je dostupný. Skús to neskôr, keď budeš online.';

  @override
  String get storeLoading => 'Načítavam ceny…';

  @override
  String get unlockedLabel => 'Odomknuté';

  @override
  String buy(String price) {
    return 'Kúpiť · $price';
  }

  @override
  String get notForSale => 'Zatiaľ sa nedá kúpiť';

  @override
  String get purchasePending => 'Čaká sa na potvrdenie…';

  @override
  String purchaseFailed(String msg) {
    return 'Nákup sa nepodaril: $msg';
  }

  @override
  String get allPacksTitle => 'Všetky kuchyne';

  @override
  String get allPacksBody =>
      'Odomkne všetky balíčky naraz, výhodnejšie ako po jednom.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n receptov',
      few: '$n recepty',
      one: '$n recept',
      zero: 'recepty sa pripravujú',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Recept z balíčka $pack';
  }

  @override
  String get lockedBody =>
      'Suroviny vidíš, postup a režim varenia sa ukážu po odomknutí balíčka.';

  @override
  String get unlock => 'Odomknúť';
}
