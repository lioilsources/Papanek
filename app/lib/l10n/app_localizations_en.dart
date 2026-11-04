// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'What can I cook';

  @override
  String get tabPantry => 'Pantry';

  @override
  String get tabShopping => 'Shopping';

  @override
  String get groupReady => 'Ready to cook';

  @override
  String get groupMissing1 => 'Missing 1 thing';

  @override
  String get groupMissing23 => 'Missing 2–3 things';

  @override
  String get groupMore => 'Needs shopping';

  @override
  String get emptyPantryHint =>
      'Add what you have at home and I\'ll show you what you can cook.';

  @override
  String get addToPantry => 'Add to pantry';

  @override
  String get searchIngredient => 'What do you have? (e.g. eggs, rice)';

  @override
  String get pantryEmpty => 'Your pantry is empty. Add your first ingredient.';

  @override
  String get pantryStaplesNote =>
      'I assume you have salt, pepper, oil and other basics.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n servings',
      one: '$n serving',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'easy',
      '2': 'manageable',
      'other': 'harder',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'missing $n',
      zero: 'you have everything',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingredients';

  @override
  String get steps => 'Steps';

  @override
  String get tips => 'Tips';

  @override
  String get optional => 'optional';

  @override
  String get toTaste => 'to taste';

  @override
  String get addMissingToShopping => 'Add missing to shopping';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Added $n items',
      one: 'Added $n item',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Cook';

  @override
  String stepOf(int i, int n) {
    return 'Step $i of $n';
  }

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get done => 'Done';

  @override
  String startTimer(String t) {
    return 'Start timer $t';
  }

  @override
  String get timerDone => 'Time\'s up!';

  @override
  String get cookedTitle => 'Enjoy!';

  @override
  String get cookedBody =>
      'All cooked. Remove the used ingredients from your pantry?';

  @override
  String get removeUsed => 'Remove';

  @override
  String get keep => 'Keep';

  @override
  String get shoppingEmpty => 'Your shopping list is empty.';

  @override
  String get checkout => 'Bought';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingredients are in your pantry',
      one: '$n ingredient is in your pantry',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Recipe language';

  @override
  String get noRecipes => 'Recipes are still being prepared.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Czech',
      'italian': 'Italian',
      'vietnamese': 'Vietnamese',
      'asian': 'Asian',
      'mexmed': 'Mexican & Mediterranean',
      'quick': 'Quick',
      'family': 'Family',
      'other': 'Other',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Vegetables',
      'ovoce': 'Fruit',
      'houby': 'Mushrooms',
      'cerstve_bylinky': 'Herbs',
      'maso': 'Meat',
      'uzeniny': 'Cured meat',
      'ryby': 'Fish',
      'mlecne': 'Dairy',
      'vejce': 'Eggs',
      'rostlinne_bilkoviny': 'Tofu & co.',
      'obiloviny': 'Grains',
      'mouka': 'Flour',
      'testoviny': 'Pasta',
      'pecivo': 'Bread',
      'lusteniny': 'Legumes',
      'orechy_seminka': 'Nuts & seeds',
      'susene_plody': 'Dried fruit',
      'koreni': 'Spices',
      'oleje_tuky': 'Oils & fats',
      'ocet_omacky': 'Sauces & vinegar',
      'sladidla': 'Sweeteners',
      'konzervy': 'Canned',
      'napoje': 'Drinks',
      'other': 'Other',
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
      'ks': 'pc',
      'lzice': 'tbsp',
      'lzicka': 'tsp',
      'hrnek': 'cup',
      'strouzek': 'clove',
      'stipka': 'pinch',
      'plechovka': 'can',
      'svazek': 'bunch',
      'hrst': 'handful',
      'platek': 'slice',
      'dkg': 'dkg',
      'balicek': 'packet',
      'stonek': 'stalk',
      'snitka': 'sprig',
      'kostka': 'cube',
      'hlava': 'head',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }
}
