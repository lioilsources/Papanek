// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Hva skal jeg lage';

  @override
  String get tabPantry => 'Spiskammer';

  @override
  String get tabShopping => 'Handleliste';

  @override
  String get groupReady => 'Kan lages nå';

  @override
  String get groupMissing1 => 'Mangler 1 ting';

  @override
  String get groupMissing23 => 'Mangler 2–3 ting';

  @override
  String get groupMore => 'Må handles';

  @override
  String get emptyPantryHint =>
      'Legg til det du har hjemme, så viser jeg deg hva du kan lage.';

  @override
  String get addToPantry => 'Legg til i spiskammeret';

  @override
  String get searchIngredient => 'Hva har du? (f.eks. egg, ris)';

  @override
  String get pantryEmpty =>
      'Spiskammeret er tomt. Legg til den første ingrediensen.';

  @override
  String get pantryStaplesNote =>
      'Jeg regner med at du har salt, pepper, olje og andre basisvarer.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n porsjoner',
      one: '$n porsjon',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'enkel',
      '2': 'overkommelig',
      'other': 'vanskeligere',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'mangler $n',
      zero: 'du har alt',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingredienser';

  @override
  String get steps => 'Fremgangsmåte';

  @override
  String get tips => 'Tips';

  @override
  String get optional => 'valgfritt';

  @override
  String get toTaste => 'etter smak';

  @override
  String get addMissingToShopping => 'Legg til det som mangler på handlelisten';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n varer lagt til',
      one: '$n vare lagt til',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Lag mat';

  @override
  String stepOf(int i, int n) {
    return 'Trinn $i av $n';
  }

  @override
  String get next => 'Neste';

  @override
  String get back => 'Tilbake';

  @override
  String get done => 'Ferdig';

  @override
  String startTimer(String t) {
    return 'Start timer $t';
  }

  @override
  String get timerDone => 'Tiden er ute!';

  @override
  String get cookedTitle => 'Vel bekomme!';

  @override
  String get cookedBody =>
      'Maten er ferdig. Fjerne de brukte ingrediensene fra spiskammeret?';

  @override
  String get removeUsed => 'Fjern';

  @override
  String get keep => 'Behold';

  @override
  String get shoppingEmpty => 'Handlelisten er tom.';

  @override
  String get checkout => 'Kjøpt';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingredienser er i spiskammeret',
      one: '$n ingrediens er i spiskammeret',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Oppskriftsspråk';

  @override
  String get noRecipes => 'Oppskriftene er fortsatt under arbeid.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Tsjekkisk',
      'italian': 'Italiensk',
      'vietnamese': 'Vietnamesisk',
      'asian': 'Asiatisk',
      'mexmed': 'Meksikansk og middelhavs',
      'quick': 'Raskt',
      'family': 'Familie',
      'other': 'Annet',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Grønnsaker',
      'ovoce': 'Frukt',
      'houby': 'Sopp',
      'cerstve_bylinky': 'Friske urter',
      'maso': 'Kjøtt',
      'uzeniny': 'Pålegg',
      'ryby': 'Fisk',
      'mlecne': 'Meieriprodukter',
      'vejce': 'Egg',
      'rostlinne_bilkoviny': 'Tofu m.m.',
      'obiloviny': 'Korn',
      'mouka': 'Mel',
      'testoviny': 'Pasta',
      'pecivo': 'Brød og bakverk',
      'lusteniny': 'Belgfrukter',
      'orechy_seminka': 'Nøtter og frø',
      'susene_plody': 'Tørket frukt',
      'koreni': 'Krydder',
      'oleje_tuky': 'Oljer og fett',
      'ocet_omacky': 'Sauser og eddik',
      'sladidla': 'Søtningsmidler',
      'konzervy': 'Hermetikk',
      'napoje': 'Drikke',
      'other': 'Annet',
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
      'ks': 'stk.',
      'lzice': 'ss',
      'lzicka': 'ts',
      'hrnek': 'kopp',
      'strouzek': 'fedd',
      'stipka': 'klype',
      'plechovka': 'boks',
      'svazek': 'bunt',
      'hrst': 'håndfull',
      'platek': 'skive',
      'dkg': 'dkg',
      'balicek': 'pakke',
      'stonek': 'stilk',
      'snitka': 'kvist',
      'kostka': 'terning',
      'hlava': 'hode',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Kjøkken';

  @override
  String get restorePurchases => 'Gjenopprett kjøp';

  @override
  String get restoreStarted => 'Gjenoppretter kjøp…';

  @override
  String get storeUnavailable =>
      'Butikken er ikke tilgjengelig nå. Prøv igjen senere når du er på nett.';

  @override
  String get storeLoading => 'Laster inn priser…';

  @override
  String get unlockedLabel => 'Låst opp';

  @override
  String buy(String price) {
    return 'Kjøp · $price';
  }

  @override
  String get notForSale => 'Ikke tilgjengelig ennå';

  @override
  String get purchasePending => 'Venter på bekreftelse…';

  @override
  String purchaseFailed(String msg) {
    return 'Kjøpet mislyktes: $msg';
  }

  @override
  String get allPacksTitle => 'Alle kjøkken';

  @override
  String get allPacksBody =>
      'Låser opp alle pakkene på én gang, billigere enn én og én.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n oppskrifter',
      one: '$n oppskrift',
      zero: 'oppskrifter på vei',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Oppskrift fra pakken $pack';
  }

  @override
  String get lockedBody =>
      'Du ser ingrediensene; fremgangsmåten og matlagingsmodus låses opp med pakken.';

  @override
  String get unlock => 'Lås opp';
}
