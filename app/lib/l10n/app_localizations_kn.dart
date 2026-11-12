// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'ಏನು ಅಡುಗೆ ಮಾಡಲಿ';

  @override
  String get tabPantry => 'ಅಡುಗೆ ಸಂಗ್ರಹ';

  @override
  String get tabShopping => 'ಖರೀದಿ';

  @override
  String get groupReady => 'ಈಗಲೇ ಮಾಡಬಹುದು';

  @override
  String get groupMissing1 => '1 ವಸ್ತು ಕಡಿಮೆ ಇದೆ';

  @override
  String get groupMissing23 => '2–3 ವಸ್ತುಗಳು ಕಡಿಮೆ ಇವೆ';

  @override
  String get groupMore => 'ಖರೀದಿ ಬೇಕು';

  @override
  String get emptyPantryHint =>
      'ಮನೆಯಲ್ಲಿರುವುದನ್ನು ಸೇರಿಸಿ, ನೀವು ಏನು ಮಾಡಬಹುದು ಎಂದು ನಾನು ತೋರಿಸುತ್ತೇನೆ.';

  @override
  String get addToPantry => 'ಸಂಗ್ರಹಕ್ಕೆ ಸೇರಿಸಿ';

  @override
  String get searchIngredient => 'ಮನೆಯಲ್ಲಿ ಏನಿದೆ? (ಉದಾ. ಮೊಟ್ಟೆ, ಅಕ್ಕಿ)';

  @override
  String get pantryEmpty => 'ಸಂಗ್ರಹ ಖಾಲಿಯಾಗಿದೆ. ಮೊದಲ ಪದಾರ್ಥವನ್ನು ಸೇರಿಸಿ.';

  @override
  String get pantryStaplesNote =>
      'ನಿಮ್ಮ ಬಳಿ ಉಪ್ಪು, ಮೆಣಸು, ಎಣ್ಣೆ ಮತ್ತು ಇತರ ಮೂಲ ವಸ್ತುಗಳಿವೆ ಎಂದು ನಾನು ಭಾವಿಸುತ್ತೇನೆ.';

  @override
  String minutes(int n) {
    return '$n ನಿಮಿಷ';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ಸರ್ವಿಂಗ್',
      one: '$n ಸರ್ವಿಂಗ್',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'ಸುಲಭ',
      '2': 'ಮಧ್ಯಮ',
      'other': 'ಸ್ವಲ್ಪ ಕಷ್ಟ',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ಕಡಿಮೆ ಇವೆ',
      one: '$n ಕಡಿಮೆ ಇದೆ',
      zero: 'ಎಲ್ಲವೂ ಇದೆ',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'ಪದಾರ್ಥಗಳು';

  @override
  String get steps => 'ವಿಧಾನ';

  @override
  String get tips => 'ಸಲಹೆಗಳು';

  @override
  String get optional => 'ಐಚ್ಛಿಕ';

  @override
  String get toTaste => 'ರುಚಿಗೆ ತಕ್ಕಷ್ಟು';

  @override
  String get addMissingToShopping => 'ಕಡಿಮೆ ಇರುವುದನ್ನು ಖರೀದಿಗೆ ಸೇರಿಸಿ';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ವಸ್ತುಗಳನ್ನು ಸೇರಿಸಲಾಗಿದೆ',
      one: '$n ವಸ್ತು ಸೇರಿಸಲಾಗಿದೆ',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'ಅಡುಗೆ ಮಾಡಿ';

  @override
  String stepOf(int i, int n) {
    return '$n ರಲ್ಲಿ ಹಂತ $i';
  }

  @override
  String get next => 'ಮುಂದೆ';

  @override
  String get back => 'ಹಿಂದೆ';

  @override
  String get done => 'ಮುಗಿಯಿತು';

  @override
  String startTimer(String t) {
    return 'ಟೈಮರ್ $t ಪ್ರಾರಂಭಿಸಿ';
  }

  @override
  String get timerDone => 'ಸಮಯ ಮುಗಿಯಿತು!';

  @override
  String get cookedTitle => 'ಸವಿಯಿರಿ!';

  @override
  String get cookedBody =>
      'ಅಡುಗೆ ಆಯಿತು. ಬಳಸಿದ ಪದಾರ್ಥಗಳನ್ನು ಸಂಗ್ರಹದಿಂದ ತೆಗೆಯಬೇಕೆ?';

  @override
  String get removeUsed => 'ತೆಗೆಯಿರಿ';

  @override
  String get keep => 'ಇರಿಸಿ';

  @override
  String get shoppingEmpty => 'ಖರೀದಿ ಪಟ್ಟಿ ಖಾಲಿಯಾಗಿದೆ.';

  @override
  String get checkout => 'ಖರೀದಿಸಿದೆ';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ಪದಾರ್ಥಗಳು ಸಂಗ್ರಹದಲ್ಲಿವೆ',
      one: '$n ಪದಾರ್ಥ ಸಂಗ್ರಹದಲ್ಲಿದೆ',
    );
    return '$_temp0';
  }

  @override
  String get language => 'ಪಾಕವಿಧಾನದ ಭಾಷೆ';

  @override
  String get noRecipes => 'ಪಾಕವಿಧಾನಗಳು ಇನ್ನೂ ಸಿದ್ಧವಾಗುತ್ತಿವೆ.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'ಜೆಕ್',
      'italian': 'ಇಟಾಲಿಯನ್',
      'vietnamese': 'ವಿಯೆಟ್ನಾಮೀಸ್',
      'asian': 'ಏಷ್ಯನ್',
      'mexmed': 'ಮೆಕ್ಸಿಕನ್ ಮತ್ತು ಮೆಡಿಟರೇನಿಯನ್',
      'quick': 'ತ್ವರಿತ',
      'family': 'ಕುಟುಂಬ',
      'other': 'ಇತರೆ',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'ತರಕಾರಿಗಳು',
      'ovoce': 'ಹಣ್ಣುಗಳು',
      'houby': 'ಅಣಬೆಗಳು',
      'cerstve_bylinky': 'ತಾಜಾ ಸೊಪ್ಪು-ಗಿಡಮೂಲಿಕೆಗಳು',
      'maso': 'ಮಾಂಸ',
      'uzeniny': 'ಸಂಸ್ಕರಿತ ಮಾಂಸ',
      'ryby': 'ಮೀನು',
      'mlecne': 'ಹಾಲಿನ ಉತ್ಪನ್ನಗಳು',
      'vejce': 'ಮೊಟ್ಟೆ',
      'rostlinne_bilkoviny': 'ತೋಫು ಮತ್ತಿತರ',
      'obiloviny': 'ಧಾನ್ಯಗಳು',
      'mouka': 'ಹಿಟ್ಟು',
      'testoviny': 'ಪಾಸ್ತಾ',
      'pecivo': 'ಬ್ರೆಡ್ ಮತ್ತು ಬೇಕರಿ',
      'lusteniny': 'ಕಾಳುಗಳು',
      'orechy_seminka': 'ಬೀಜ-ಬಾದಾಮಿ',
      'susene_plody': 'ಒಣ ಹಣ್ಣುಗಳು',
      'koreni': 'ಮಸಾಲೆಗಳು',
      'oleje_tuky': 'ಎಣ್ಣೆ ಮತ್ತು ಕೊಬ್ಬು',
      'ocet_omacky': 'ಸಾಸ್ ಮತ್ತು ವಿನೆಗರ್',
      'sladidla': 'ಸಿಹಿಕಾರಕಗಳು',
      'konzervy': 'ಡಬ್ಬಿ ಆಹಾರ',
      'napoje': 'ಪಾನೀಯಗಳು',
      'other': 'ಇತರೆ',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'ಗ್ರಾಂ',
      'kg': 'ಕೆಜಿ',
      'ml': 'ಮಿಲಿ',
      'l': 'ಲೀ',
      'dl': 'ಡೆಸಿಲೀ',
      'cl': 'ಸೆಂಟಿಲೀ',
      'ks': 'ಸಂಖ್ಯೆ',
      'lzice': 'ಚಮಚ (ದೊಡ್ಡ)',
      'lzicka': 'ಚಮಚ (ಸಣ್ಣ)',
      'hrnek': 'ಕಪ್',
      'strouzek': 'ಎಸಳು',
      'stipka': 'ಚಿಟಿಕೆ',
      'plechovka': 'ಡಬ್ಬಿ',
      'svazek': 'ಕಟ್ಟು',
      'hrst': 'ಹಿಡಿ',
      'platek': 'ಹೋಳು',
      'dkg': 'dkg',
      'balicek': 'ಪ್ಯಾಕೆಟ್',
      'stonek': 'ದಂಟು',
      'snitka': 'ಕಡ್ಡಿ',
      'kostka': 'ಕ್ಯೂಬ್',
      'hlava': 'ಗಡ್ಡೆ',
      'oz': 'ಔನ್ಸ್',
      'lb': 'ಪೌಂಡ್',
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
