// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Hvad skal jeg lave';

  @override
  String get tabPantry => 'Spisekammer';

  @override
  String get tabShopping => 'Indkøb';

  @override
  String get groupReady => 'Kan laves nu';

  @override
  String get groupMissing1 => 'Mangler 1 ting';

  @override
  String get groupMissing23 => 'Mangler 2–3 ting';

  @override
  String get groupMore => 'Kræver indkøb';

  @override
  String get emptyPantryHint =>
      'Tilføj, hvad du har derhjemme, så viser jeg dig, hvad du kan lave.';

  @override
  String get addToPantry => 'Tilføj til spisekammer';

  @override
  String get searchIngredient => 'Hvad har du? (fx æg, ris)';

  @override
  String get pantryEmpty =>
      'Dit spisekammer er tomt. Tilføj den første ingrediens.';

  @override
  String get pantryStaplesNote =>
      'Jeg regner med, at du har salt, peber, olie og andre basisvarer.';

  @override
  String minutes(int n) {
    return '$n min.';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n portioner',
      one: '$n portion',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'nem',
      '2': 'overkommelig',
      'other': 'sværere',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'mangler $n',
      zero: 'du har det hele',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingredienser';

  @override
  String get steps => 'Fremgangsmåde';

  @override
  String get tips => 'Tips';

  @override
  String get optional => 'valgfri';

  @override
  String get toTaste => 'efter smag';

  @override
  String get addMissingToShopping => 'Tilføj manglende til indkøb';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n varer tilføjet',
      one: '$n vare tilføjet',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Lav mad';

  @override
  String stepOf(int i, int n) {
    return 'Trin $i af $n';
  }

  @override
  String get next => 'Næste';

  @override
  String get back => 'Tilbage';

  @override
  String get done => 'Færdig';

  @override
  String startTimer(String t) {
    return 'Start timer $t';
  }

  @override
  String get timerDone => 'Tiden er gået!';

  @override
  String get cookedTitle => 'Velbekomme!';

  @override
  String get cookedBody =>
      'Maden er lavet. Skal de brugte ingredienser fjernes fra spisekammeret?';

  @override
  String get removeUsed => 'Fjern';

  @override
  String get keep => 'Behold';

  @override
  String get shoppingEmpty => 'Din indkøbsliste er tom.';

  @override
  String get checkout => 'Købt';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingredienser er i dit spisekammer',
      one: '$n ingrediens er i dit spisekammer',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Opskrifternes sprog';

  @override
  String get noRecipes => 'Opskrifterne er stadig under udarbejdelse.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Tjekkisk',
      'italian': 'Italiensk',
      'vietnamese': 'Vietnamesisk',
      'asian': 'Asiatisk',
      'mexmed': 'Mexicansk og middelhavsk',
      'quick': 'Hurtig',
      'family': 'Familie',
      'other': 'Andet',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Grøntsager',
      'ovoce': 'Frugt',
      'houby': 'Svampe',
      'cerstve_bylinky': 'Friske krydderurter',
      'maso': 'Kød',
      'uzeniny': 'Pålæg',
      'ryby': 'Fisk',
      'mlecne': 'Mejeriprodukter',
      'vejce': 'Æg',
      'rostlinne_bilkoviny': 'Tofu m.m.',
      'obiloviny': 'Kornprodukter',
      'mouka': 'Mel',
      'testoviny': 'Pasta',
      'pecivo': 'Brød og bagværk',
      'lusteniny': 'Bælgfrugter',
      'orechy_seminka': 'Nødder og frø',
      'susene_plody': 'Tørret frugt',
      'koreni': 'Krydderier',
      'oleje_tuky': 'Olier og fedtstoffer',
      'ocet_omacky': 'Saucer og eddike',
      'sladidla': 'Sødemidler',
      'konzervy': 'Konserves',
      'napoje': 'Drikkevarer',
      'other': 'Andet',
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
      'lzice': 'spsk.',
      'lzicka': 'tsk.',
      'hrnek': 'kop',
      'strouzek': 'fed',
      'stipka': 'knivspids',
      'plechovka': 'dåse',
      'svazek': 'bundt',
      'hrst': 'håndfuld',
      'platek': 'skive',
      'dkg': 'dkg',
      'balicek': 'pakke',
      'stonek': 'stilk',
      'snitka': 'kvist',
      'kostka': 'terning',
      'hlava': 'hoved',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }
}
