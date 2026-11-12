// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Que cuisiner';

  @override
  String get tabPantry => 'Garde-manger';

  @override
  String get tabShopping => 'Courses';

  @override
  String get groupReady => 'Prêt à cuisiner';

  @override
  String get groupMissing1 => 'Il manque 1 ingrédient';

  @override
  String get groupMissing23 => 'Il manque 2 à 3 ingrédients';

  @override
  String get groupMore => 'Courses à faire';

  @override
  String get emptyPantryHint =>
      'Ajoutez ce que vous avez chez vous et je vous montrerai ce que vous pouvez cuisiner.';

  @override
  String get addToPantry => 'Ajouter au garde-manger';

  @override
  String get searchIngredient => 'Qu\'avez-vous ? (p. ex. œufs, riz)';

  @override
  String get pantryEmpty =>
      'Votre garde-manger est vide. Ajoutez le premier ingrédient.';

  @override
  String get pantryStaplesNote =>
      'Je suppose que vous avez du sel, du poivre, de l\'huile et d\'autres produits de base.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n portions',
      one: '$n portion',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'facile',
      '2': 'abordable',
      'other': 'plus difficile',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'il manque $n',
      one: 'il manque $n',
      zero: 'vous avez tout',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingrédients';

  @override
  String get steps => 'Préparation';

  @override
  String get tips => 'Conseils';

  @override
  String get optional => 'facultatif';

  @override
  String get toTaste => 'selon le goût';

  @override
  String get addMissingToShopping => 'Ajouter le manquant aux courses';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n articles ajoutés',
      one: '$n article ajouté',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Cuisiner';

  @override
  String stepOf(int i, int n) {
    return 'Étape $i sur $n';
  }

  @override
  String get next => 'Suivant';

  @override
  String get back => 'Retour';

  @override
  String get done => 'Terminé';

  @override
  String startTimer(String t) {
    return 'Lancer le minuteur $t';
  }

  @override
  String get timerDone => 'Le temps est écoulé !';

  @override
  String get cookedTitle => 'Bon appétit !';

  @override
  String get cookedBody =>
      'C\'est cuisiné. Retirer les ingrédients utilisés du garde-manger ?';

  @override
  String get removeUsed => 'Retirer';

  @override
  String get keep => 'Garder';

  @override
  String get shoppingEmpty => 'Votre liste de courses est vide.';

  @override
  String get checkout => 'Acheté';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingrédients sont dans le garde-manger',
      one: '$n ingrédient est dans le garde-manger',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Langue des recettes';

  @override
  String get noRecipes => 'Les recettes sont encore en préparation.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Tchèque',
      'italian': 'Italienne',
      'vietnamese': 'Vietnamienne',
      'asian': 'Asiatique',
      'mexmed': 'Mexicaine et méditerranéenne',
      'quick': 'Rapide',
      'family': 'Familiale',
      'other': 'Autres',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Légumes',
      'ovoce': 'Fruits',
      'houby': 'Champignons',
      'cerstve_bylinky': 'Herbes fraîches',
      'maso': 'Viande',
      'uzeniny': 'Charcuterie',
      'ryby': 'Poisson',
      'mlecne': 'Produits laitiers',
      'vejce': 'Œufs',
      'rostlinne_bilkoviny': 'Tofu et assimilés',
      'obiloviny': 'Céréales',
      'mouka': 'Farine',
      'testoviny': 'Pâtes',
      'pecivo': 'Pain et viennoiseries',
      'lusteniny': 'Légumineuses',
      'orechy_seminka': 'Noix et graines',
      'susene_plody': 'Fruits secs',
      'koreni': 'Épices',
      'oleje_tuky': 'Huiles et matières grasses',
      'ocet_omacky': 'Sauces et vinaigre',
      'sladidla': 'Édulcorants',
      'konzervy': 'Conserves',
      'napoje': 'Boissons',
      'other': 'Autres',
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
      'ks': 'pièce',
      'lzice': 'c. à soupe',
      'lzicka': 'c. à café',
      'hrnek': 'tasse',
      'strouzek': 'gousse',
      'stipka': 'pincée',
      'plechovka': 'boîte',
      'svazek': 'botte',
      'hrst': 'poignée',
      'platek': 'tranche',
      'dkg': 'dag',
      'balicek': 'paquet',
      'stonek': 'tige',
      'snitka': 'brin',
      'kostka': 'cube',
      'hlava': 'tête',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }
}
