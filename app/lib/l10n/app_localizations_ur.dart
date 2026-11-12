// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'کیا پکاؤں';

  @override
  String get tabPantry => 'ذخیرہ';

  @override
  String get tabShopping => 'خریداری';

  @override
  String get groupReady => 'ابھی بن سکتا ہے';

  @override
  String get groupMissing1 => '1 چیز کم ہے';

  @override
  String get groupMissing23 => '2–3 چیزیں کم ہیں';

  @override
  String get groupMore => 'خریداری کرنا ہوگی';

  @override
  String get emptyPantryHint =>
      'گھر میں جو کچھ ہے وہ شامل کریں، میں بتاؤں گا کہ آپ کیا پکا سکتے ہیں۔';

  @override
  String get addToPantry => 'ذخیرے میں شامل کریں';

  @override
  String get searchIngredient => 'گھر میں کیا ہے؟ (مثلاً انڈے، چاول)';

  @override
  String get pantryEmpty => 'ذخیرہ خالی ہے۔ پہلا جزو شامل کریں۔';

  @override
  String get pantryStaplesNote =>
      'میں فرض کرتا ہوں کہ آپ کے پاس نمک، کالی مرچ، تیل اور دوسری بنیادی چیزیں موجود ہیں۔';

  @override
  String minutes(int n) {
    return '$n منٹ';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n سرونگز',
      one: '$n سرونگ',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'آسان',
      '2': 'درمیانہ',
      'other': 'قدرے مشکل',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n کم ہیں',
      one: '$n کم ہے',
      zero: 'سب کچھ موجود ہے',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'اجزا';

  @override
  String get steps => 'ترکیب';

  @override
  String get tips => 'مشورے';

  @override
  String get optional => 'اختیاری';

  @override
  String get toTaste => 'حسبِ ذائقہ';

  @override
  String get addMissingToShopping => 'کم چیزیں خریداری میں شامل کریں';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n چیزیں شامل کی گئیں',
      one: '$n چیز شامل کی گئی',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'پکائیں';

  @override
  String stepOf(int i, int n) {
    return 'مرحلہ $i از $n';
  }

  @override
  String get next => 'آگے';

  @override
  String get back => 'پیچھے';

  @override
  String get done => 'مکمل';

  @override
  String startTimer(String t) {
    return 'ٹائمر $t شروع کریں';
  }

  @override
  String get timerDone => 'وقت ختم!';

  @override
  String get cookedTitle => 'نوشِ جان!';

  @override
  String get cookedBody => 'کھانا تیار ہے۔ استعمال شدہ اجزا ذخیرے سے ہٹا دیں؟';

  @override
  String get removeUsed => 'ہٹائیں';

  @override
  String get keep => 'رکھیں';

  @override
  String get shoppingEmpty => 'خریداری کی فہرست خالی ہے۔';

  @override
  String get checkout => 'خرید لیا';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n اجزا ذخیرے میں ہیں',
      one: '$n جزو ذخیرے میں ہے',
    );
    return '$_temp0';
  }

  @override
  String get language => 'ترکیبوں کی زبان';

  @override
  String get noRecipes => 'ترکیبیں ابھی تیار ہو رہی ہیں۔';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'چیک',
      'italian': 'اطالوی',
      'vietnamese': 'ویتنامی',
      'asian': 'ایشیائی',
      'mexmed': 'میکسیکن اور بحیرۂ روم',
      'quick': 'فوری',
      'family': 'خاندانی',
      'other': 'دیگر',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'سبزیاں',
      'ovoce': 'پھل',
      'houby': 'کھمبیاں',
      'cerstve_bylinky': 'تازہ جڑی بوٹیاں',
      'maso': 'گوشت',
      'uzeniny': 'پروسیس شدہ گوشت',
      'ryby': 'مچھلی',
      'mlecne': 'ڈیری',
      'vejce': 'انڈے',
      'rostlinne_bilkoviny': 'ٹوفو وغیرہ',
      'obiloviny': 'اناج',
      'mouka': 'آٹا',
      'testoviny': 'پاستا',
      'pecivo': 'روٹی اور بیکری',
      'lusteniny': 'دالیں',
      'orechy_seminka': 'گری دار میوے اور بیج',
      'susene_plody': 'خشک میوے',
      'koreni': 'مصالحے',
      'oleje_tuky': 'تیل اور چکنائی',
      'ocet_omacky': 'ساس اور سرکہ',
      'sladidla': 'میٹھا کرنے والی اشیا',
      'konzervy': 'ڈبہ بند',
      'napoje': 'مشروبات',
      'other': 'دیگر',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'گرام',
      'kg': 'کلو',
      'ml': 'ملی',
      'l': 'لیٹر',
      'dl': 'ڈیسی',
      'cl': 'سینٹی',
      'ks': 'عدد',
      'lzice': 'کھانے کا چمچ',
      'lzicka': 'چائے کا چمچ',
      'hrnek': 'کپ',
      'strouzek': 'جوا',
      'stipka': 'چٹکی',
      'plechovka': 'ڈبہ',
      'svazek': 'گٹھی',
      'hrst': 'مٹھی',
      'platek': 'قاش',
      'dkg': 'dkg',
      'balicek': 'پیکٹ',
      'stonek': 'ڈنڈی',
      'snitka': 'ٹہنی',
      'kostka': 'کیوب',
      'hlava': 'گانٹھ',
      'oz': 'اونس',
      'lb': 'پاؤنڈ',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'کھانے';

  @override
  String get restorePurchases => 'خریداریاں بحال کریں';

  @override
  String get restoreStarted => 'خریداریاں بحال ہو رہی ہیں…';

  @override
  String get storeUnavailable =>
      'اسٹور ابھی دستیاب نہیں۔ آن لائن ہونے پر بعد میں دوبارہ کوشش کریں۔';

  @override
  String get storeLoading => 'قیمتیں لوڈ ہو رہی ہیں…';

  @override
  String get unlockedLabel => 'کھل گیا';

  @override
  String buy(String price) {
    return 'خریدیں · $price';
  }

  @override
  String get notForSale => 'ابھی دستیاب نہیں';

  @override
  String get purchasePending => 'تصدیق کا انتظار…';

  @override
  String purchaseFailed(String msg) {
    return 'خریداری ناکام: $msg';
  }

  @override
  String get allPacksTitle => 'تمام کھانے';

  @override
  String get allPacksBody =>
      'سبھی پیک ایک ساتھ کھولتا ہے، الگ الگ لینے سے سستا۔';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ترکیبیں',
      one: '$n ترکیب',
      zero: 'ترکیبیں تیار ہو رہی ہیں',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return '$pack پیک کی ترکیب';
  }

  @override
  String get lockedBody =>
      'اجزاء نظر آ رہے ہیں؛ طریقہ اور کھانا پکانے کا موڈ پیک کے ساتھ کھلتا ہے۔';

  @override
  String get unlock => 'کھولیں';
}
