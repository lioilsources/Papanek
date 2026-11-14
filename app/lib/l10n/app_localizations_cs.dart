// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Co uvařím';

  @override
  String get tabPantry => 'Spíž';

  @override
  String get tabShopping => 'Nákup';

  @override
  String get groupReady => 'Můžeš hned';

  @override
  String get groupMissing1 => 'Chybí 1 věc';

  @override
  String get groupMissing23 => 'Chybí 2–3 věci';

  @override
  String get groupMore => 'Na nákup';

  @override
  String get emptyPantryHint =>
      'Přidej do spíže, co máš doma, a ukážu ti, co z toho uvaříš.';

  @override
  String get addToPantry => 'Přidat do spíže';

  @override
  String get searchIngredient => 'Co máš doma? (např. vejce, rýže)';

  @override
  String get pantryEmpty => 'Spíž je prázdná. Přidej první surovinu.';

  @override
  String get pantryStaplesNote =>
      'Sůl, pepř, olej a další základy počítám, že doma máš.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n porcí',
      few: '$n porce',
      one: '$n porce',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'snadné',
      '2': 'zvládnutelné',
      'other': 'náročnější',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'chybí $n',
      few: 'chybí $n',
      one: 'chybí $n',
      zero: 'máš všechno',
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
  String get toTaste => 'podle chuti';

  @override
  String get addMissingToShopping => 'Chybějící na nákup';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Přidáno $n položek',
      few: 'Přidány $n položky',
      one: 'Přidána $n položka',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Vařit';

  @override
  String stepOf(int i, int n) {
    return 'Krok $i z $n';
  }

  @override
  String get next => 'Další';

  @override
  String get back => 'Zpět';

  @override
  String get done => 'Hotovo';

  @override
  String startTimer(String t) {
    return 'Spustit časovač $t';
  }

  @override
  String get timerDone => 'Čas vypršel!';

  @override
  String get cookedTitle => 'Dobrou chuť!';

  @override
  String get cookedBody => 'Uvařeno. Odebrat použité suroviny ze spíže?';

  @override
  String get removeUsed => 'Odebrat';

  @override
  String get keep => 'Nechat';

  @override
  String get shoppingEmpty => 'Nákupní seznam je prázdný.';

  @override
  String get checkout => 'Nakoupeno';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n surovin je ve spíži',
      few: '$n suroviny jsou ve spíži',
      one: '$n surovina je ve spíži',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Jazyk receptů';

  @override
  String get noRecipes => 'Recepty se ještě připravují.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Česká',
      'italian': 'Italská',
      'vietnamese': 'Vietnamská',
      'asian': 'Asijská',
      'mexmed': 'Mexická a středomořská',
      'quick': 'Rychlovka',
      'family': 'Rodinná',
      'other': 'Ostatní',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Zelenina',
      'ovoce': 'Ovoce',
      'houby': 'Houby',
      'cerstve_bylinky': 'Bylinky',
      'maso': 'Maso',
      'uzeniny': 'Uzeniny',
      'ryby': 'Ryby',
      'mlecne': 'Mléčné',
      'vejce': 'Vejce',
      'rostlinne_bilkoviny': 'Tofu a spol.',
      'obiloviny': 'Obiloviny',
      'mouka': 'Mouka',
      'testoviny': 'Těstoviny',
      'pecivo': 'Pečivo',
      'lusteniny': 'Luštěniny',
      'orechy_seminka': 'Ořechy a semínka',
      'susene_plody': 'Sušené ovoce',
      'koreni': 'Koření',
      'oleje_tuky': 'Oleje a tuky',
      'ocet_omacky': 'Omáčky a ocet',
      'sladidla': 'Sladidla',
      'konzervy': 'Konzervy',
      'napoje': 'Nápoje',
      'other': 'Ostatní',
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
      'lzice': 'lžíce',
      'lzicka': 'lžička',
      'hrnek': 'hrnek',
      'strouzek': 'stroužek',
      'stipka': 'špetka',
      'plechovka': 'plechovka',
      'svazek': 'svazek',
      'hrst': 'hrst',
      'platek': 'plátek',
      'dkg': 'dkg',
      'balicek': 'balíček',
      'stonek': 'stonek',
      'snitka': 'snítka',
      'kostka': 'kostka',
      'hlava': 'hlávka',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Kuchyně';

  @override
  String get restorePurchases => 'Obnovit nákupy';

  @override
  String get restoreStarted => 'Obnovuji nákupy…';

  @override
  String get storeUnavailable =>
      'Obchod teď není dostupný. Zkus to později, až budeš online.';

  @override
  String get storeLoading => 'Načítám ceny…';

  @override
  String get unlockedLabel => 'Odemčeno';

  @override
  String buy(String price) {
    return 'Koupit · $price';
  }

  @override
  String get notForSale => 'Zatím nejde koupit';

  @override
  String get purchasePending => 'Čeká na potvrzení…';

  @override
  String purchaseFailed(String msg) {
    return 'Nákup se nepovedl: $msg';
  }

  @override
  String get allPacksTitle => 'Všechny kuchyně';

  @override
  String get allPacksBody =>
      'Odemkne všechny balíčky najednou, výhodněji než po jednom.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n receptů',
      few: '$n recepty',
      one: '$n recept',
      zero: 'recepty se připravují',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Recept z balíčku $pack';
  }

  @override
  String get lockedBody =>
      'Suroviny vidíš, postup a režim vaření se ukážou po odemčení balíčku.';

  @override
  String get unlock => 'Odemknout';

  @override
  String get settings => 'Nastavení';

  @override
  String get statsToggle => 'Anonymní statistiky';

  @override
  String get statsToggleBody =>
      'Pomáhají appku zlepšovat. Bez identifikátorů a bez čehokoli, co zadáš.';
}
