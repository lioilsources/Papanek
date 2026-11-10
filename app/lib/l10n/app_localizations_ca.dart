// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Què cuino';

  @override
  String get tabPantry => 'Rebost';

  @override
  String get tabShopping => 'Compra';

  @override
  String get groupReady => 'Ho pots fer ara';

  @override
  String get groupMissing1 => 'Falta 1 cosa';

  @override
  String get groupMissing23 => 'Falten 2–3 coses';

  @override
  String get groupMore => 'Cal comprar';

  @override
  String get emptyPantryHint =>
      'Afegeix el que tens a casa i et mostraré què pots cuinar.';

  @override
  String get addToPantry => 'Afegeix al rebost';

  @override
  String get searchIngredient => 'Què tens a casa? (p. ex. ous, arròs)';

  @override
  String get pantryEmpty => 'El rebost és buit. Afegeix el primer ingredient.';

  @override
  String get pantryStaplesNote =>
      'Dono per fet que tens sal, pebre, oli i altres bàsics.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n racions',
      one: '$n ració',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'fàcil',
      '2': 'assequible',
      'other': 'més difícil',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'falten $n',
      one: 'falta $n',
      zero: 'ho tens tot',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingredients';

  @override
  String get steps => 'Preparació';

  @override
  String get tips => 'Consells';

  @override
  String get optional => 'opcional';

  @override
  String get toTaste => 'al gust';

  @override
  String get addMissingToShopping => 'Afegeix el que falta a la compra';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'S\'han afegit $n elements',
      one: 'S\'ha afegit $n element',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Cuina';

  @override
  String stepOf(int i, int n) {
    return 'Pas $i de $n';
  }

  @override
  String get next => 'Següent';

  @override
  String get back => 'Enrere';

  @override
  String get done => 'Fet';

  @override
  String startTimer(String t) {
    return 'Inicia el temporitzador $t';
  }

  @override
  String get timerDone => 'S\'ha acabat el temps!';

  @override
  String get cookedTitle => 'Bon profit!';

  @override
  String get cookedBody =>
      'Ja està cuinat. Vols treure els ingredients utilitzats del rebost?';

  @override
  String get removeUsed => 'Treu';

  @override
  String get keep => 'Conserva';

  @override
  String get shoppingEmpty => 'La llista de la compra és buida.';

  @override
  String get checkout => 'Comprat';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingredients són al rebost',
      one: '$n ingredient és al rebost',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Idioma de les receptes';

  @override
  String get noRecipes => 'Les receptes encara s\'estan preparant.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Txeca',
      'italian': 'Italiana',
      'vietnamese': 'Vietnamita',
      'asian': 'Asiàtica',
      'mexmed': 'Mexicana i mediterrània',
      'quick': 'Ràpida',
      'family': 'Familiar',
      'other': 'Altres',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Verdures',
      'ovoce': 'Fruita',
      'houby': 'Bolets',
      'cerstve_bylinky': 'Herbes fresques',
      'maso': 'Carn',
      'uzeniny': 'Embotits',
      'ryby': 'Peix',
      'mlecne': 'Làctics',
      'vejce': 'Ous',
      'rostlinne_bilkoviny': 'Tofu i similars',
      'obiloviny': 'Cereals',
      'mouka': 'Farina',
      'testoviny': 'Pasta',
      'pecivo': 'Pa i pastisseria',
      'lusteniny': 'Llegums',
      'orechy_seminka': 'Fruits secs i llavors',
      'susene_plody': 'Fruita seca',
      'koreni': 'Espècies',
      'oleje_tuky': 'Olis i greixos',
      'ocet_omacky': 'Salses i vinagre',
      'sladidla': 'Edulcorants',
      'konzervy': 'Conserves',
      'napoje': 'Begudes',
      'other': 'Altres',
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
      'ks': 'u.',
      'lzice': 'cullerada',
      'lzicka': 'culleradeta',
      'hrnek': 'tassa',
      'strouzek': 'gra',
      'stipka': 'pessic',
      'plechovka': 'llauna',
      'svazek': 'manat',
      'hrst': 'grapat',
      'platek': 'llesca',
      'dkg': 'dkg',
      'balicek': 'paquet',
      'stonek': 'tija',
      'snitka': 'branqueta',
      'kostka': 'cub',
      'hlava': 'cap',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }
}
