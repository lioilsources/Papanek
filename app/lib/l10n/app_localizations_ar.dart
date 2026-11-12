// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'ماذا أطبخ';

  @override
  String get tabPantry => 'المخزن';

  @override
  String get tabShopping => 'التسوق';

  @override
  String get groupReady => 'جاهز للطبخ';

  @override
  String get groupMissing1 => 'ينقصك شيء واحد';

  @override
  String get groupMissing23 => 'ينقصك 2–3 أشياء';

  @override
  String get groupMore => 'يحتاج إلى تسوّق';

  @override
  String get emptyPantryHint => 'أضف ما لديك في البيت وسأريك ما يمكنك طبخه.';

  @override
  String get addToPantry => 'أضف إلى المخزن';

  @override
  String get searchIngredient => 'ماذا لديك؟ (مثل: بيض، أرز)';

  @override
  String get pantryEmpty => 'المخزن فارغ. أضف أول مكوّن.';

  @override
  String get pantryStaplesNote =>
      'أفترض أن لديك الملح والفلفل والزيت وغيرها من الأساسيات.';

  @override
  String minutes(int n) {
    return '$n د';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'عدد الحصص: $n',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'سهلة',
      '2': 'متوسطة',
      'other': 'أصعب',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ينقص: $n',
      zero: 'لديك كل شيء',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'المكوّنات';

  @override
  String get steps => 'الخطوات';

  @override
  String get tips => 'نصائح';

  @override
  String get optional => 'اختياري';

  @override
  String get toTaste => 'حسب الذوق';

  @override
  String get addMissingToShopping => 'أضف الناقص إلى التسوق';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'عدد العناصر المضافة: $n',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'ابدأ الطبخ';

  @override
  String stepOf(int i, int n) {
    return 'الخطوة $i من $n';
  }

  @override
  String get next => 'التالي';

  @override
  String get back => 'رجوع';

  @override
  String get done => 'تم';

  @override
  String startTimer(String t) {
    return 'ابدأ المؤقّت $t';
  }

  @override
  String get timerDone => 'انتهى الوقت!';

  @override
  String get cookedTitle => 'بالهناء والشفاء!';

  @override
  String get cookedBody =>
      'انتهى الطبخ. هل تريد إزالة المكوّنات المستخدمة من المخزن؟';

  @override
  String get removeUsed => 'إزالة';

  @override
  String get keep => 'إبقاء';

  @override
  String get shoppingEmpty => 'قائمة التسوق فارغة.';

  @override
  String get checkout => 'تم الشراء';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'المكوّنات في المخزن: $n',
    );
    return '$_temp0';
  }

  @override
  String get language => 'لغة الوصفات';

  @override
  String get noRecipes => 'الوصفات قيد الإعداد.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'التشيكي',
      'italian': 'الإيطالي',
      'vietnamese': 'الفيتنامي',
      'asian': 'الآسيوي',
      'mexmed': 'المكسيكي والمتوسطي',
      'quick': 'سريع',
      'family': 'عائلي',
      'other': 'أخرى',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'خضار',
      'ovoce': 'فواكه',
      'houby': 'فطر',
      'cerstve_bylinky': 'أعشاب طازجة',
      'maso': 'لحوم',
      'uzeniny': 'لحوم مصنّعة',
      'ryby': 'أسماك',
      'mlecne': 'ألبان',
      'vejce': 'بيض',
      'rostlinne_bilkoviny': 'توفو وما شابه',
      'obiloviny': 'حبوب',
      'mouka': 'دقيق',
      'testoviny': 'معكرونة',
      'pecivo': 'مخبوزات',
      'lusteniny': 'بقوليات',
      'orechy_seminka': 'مكسّرات وبذور',
      'susene_plody': 'فواكه مجففة',
      'koreni': 'توابل',
      'oleje_tuky': 'زيوت ودهون',
      'ocet_omacky': 'صلصات وخل',
      'sladidla': 'محلّيات',
      'konzervy': 'معلّبات',
      'napoje': 'مشروبات',
      'other': 'أخرى',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'غ',
      'kg': 'كغ',
      'ml': 'مل',
      'l': 'ل',
      'dl': 'دل',
      'cl': 'سل',
      'ks': 'حبة',
      'lzice': 'ملعقة كبيرة',
      'lzicka': 'ملعقة صغيرة',
      'hrnek': 'كوب',
      'strouzek': 'فص',
      'stipka': 'رشّة',
      'plechovka': 'علبة',
      'svazek': 'حزمة',
      'hrst': 'حفنة',
      'platek': 'شريحة',
      'dkg': 'ديكاغرام',
      'balicek': 'عبوة',
      'stonek': 'ساق',
      'snitka': 'غصن',
      'kostka': 'مكعّب',
      'hlava': 'رأس',
      'oz': 'أونصة',
      'lb': 'رطل',
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
