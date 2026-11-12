// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'מה לבשל';

  @override
  String get tabPantry => 'מזווה';

  @override
  String get tabShopping => 'קניות';

  @override
  String get groupReady => 'אפשר לבשל עכשיו';

  @override
  String get groupMissing1 => 'חסר דבר אחד';

  @override
  String get groupMissing23 => 'חסרים 2–3 דברים';

  @override
  String get groupMore => 'צריך לקנות';

  @override
  String get emptyPantryHint =>
      'הוסיפו מה שיש לכם בבית ואראה לכם מה אפשר לבשל.';

  @override
  String get addToPantry => 'הוספה למזווה';

  @override
  String get searchIngredient => 'מה יש לכם? (למשל ביצים, אורז)';

  @override
  String get pantryEmpty => 'המזווה ריק. הוסיפו את המצרך הראשון.';

  @override
  String get pantryStaplesNote =>
      'אני מניח שיש לכם בבית מלח, פלפל, שמן ועוד מצרכי יסוד.';

  @override
  String minutes(int n) {
    return '$n דק׳';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n מנות',
      two: 'שתי מנות',
      one: 'מנה אחת',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'קל',
      '2': 'סביר',
      'other': 'מאתגר יותר',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'חסרים $n',
      two: 'חסרים $n',
      one: 'חסר $n',
      zero: 'יש לכם הכול',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'מצרכים';

  @override
  String get steps => 'אופן ההכנה';

  @override
  String get tips => 'טיפים';

  @override
  String get optional => 'לא חובה';

  @override
  String get toTaste => 'לפי הטעם';

  @override
  String get addMissingToShopping => 'הוספת החסרים לקניות';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'נוספו $n פריטים',
      two: 'נוספו שני פריטים',
      one: 'נוסף פריט אחד',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'מתחילים לבשל';

  @override
  String stepOf(int i, int n) {
    return 'שלב $i מתוך $n';
  }

  @override
  String get next => 'הבא';

  @override
  String get back => 'חזרה';

  @override
  String get done => 'סיום';

  @override
  String startTimer(String t) {
    return 'הפעלת טיימר $t';
  }

  @override
  String get timerDone => 'הזמן נגמר!';

  @override
  String get cookedTitle => 'בתיאבון!';

  @override
  String get cookedBody => 'הבישול הסתיים. להסיר את המצרכים שנוצלו מהמזווה?';

  @override
  String get removeUsed => 'הסרה';

  @override
  String get keep => 'להשאיר';

  @override
  String get shoppingEmpty => 'רשימת הקניות ריקה.';

  @override
  String get checkout => 'נקנה';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n מצרכים במזווה',
      two: 'שני מצרכים במזווה',
      one: 'מצרך אחד במזווה',
    );
    return '$_temp0';
  }

  @override
  String get language => 'שפת המתכונים';

  @override
  String get noRecipes => 'המתכונים עדיין בהכנה.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'צ׳כי',
      'italian': 'איטלקי',
      'vietnamese': 'וייטנאמי',
      'asian': 'אסייתי',
      'mexmed': 'מקסיקני וים־תיכוני',
      'quick': 'מהיר',
      'family': 'משפחתי',
      'other': 'אחר',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'ירקות',
      'ovoce': 'פירות',
      'houby': 'פטריות',
      'cerstve_bylinky': 'עשבי תיבול טריים',
      'maso': 'בשר',
      'uzeniny': 'נקניקים',
      'ryby': 'דגים',
      'mlecne': 'מוצרי חלב',
      'vejce': 'ביצים',
      'rostlinne_bilkoviny': 'טופו ודומיו',
      'obiloviny': 'דגנים',
      'mouka': 'קמח',
      'testoviny': 'פסטה',
      'pecivo': 'לחם ומאפים',
      'lusteniny': 'קטניות',
      'orechy_seminka': 'אגוזים וזרעים',
      'susene_plody': 'פירות יבשים',
      'koreni': 'תבלינים',
      'oleje_tuky': 'שמנים ושומנים',
      'ocet_omacky': 'רטבים וחומץ',
      'sladidla': 'ממתיקים',
      'konzervy': 'שימורים',
      'napoje': 'משקאות',
      'other': 'אחר',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'ג׳',
      'kg': 'ק״ג',
      'ml': 'מ״ל',
      'l': 'ל׳',
      'dl': 'ד״ל',
      'cl': 'ס״ל',
      'ks': 'יח׳',
      'lzice': 'כף',
      'lzicka': 'כפית',
      'hrnek': 'כוס',
      'strouzek': 'שן',
      'stipka': 'קורט',
      'plechovka': 'קופסה',
      'svazek': 'צרור',
      'hrst': 'חופן',
      'platek': 'פרוסה',
      'dkg': 'dkg',
      'balicek': 'חבילה',
      'stonek': 'גבעול',
      'snitka': 'ענף',
      'kostka': 'קובייה',
      'hlava': 'ראש',
      'oz': 'אונקיה',
      'lb': 'פאונד',
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
