// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'क्या पकाएँ';

  @override
  String get tabPantry => 'भंडार';

  @override
  String get tabShopping => 'ख़रीदारी';

  @override
  String get groupReady => 'अभी बन सकता है';

  @override
  String get groupMissing1 => '1 चीज़ कम है';

  @override
  String get groupMissing23 => '2–3 चीज़ें कम हैं';

  @override
  String get groupMore => 'ख़रीदारी करनी होगी';

  @override
  String get emptyPantryHint =>
      'घर में जो है वह जोड़ें, मैं बताऊँगा कि आप क्या पका सकते हैं।';

  @override
  String get addToPantry => 'भंडार में जोड़ें';

  @override
  String get searchIngredient => 'घर में क्या है? (जैसे अंडे, चावल)';

  @override
  String get pantryEmpty => 'भंडार ख़ाली है। पहली सामग्री जोड़ें।';

  @override
  String get pantryStaplesNote =>
      'मैं मानता हूँ कि आपके पास नमक, काली मिर्च, तेल और दूसरी बुनियादी चीज़ें हैं।';

  @override
  String minutes(int n) {
    return '$n मिनट';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n सर्विंग',
      one: '$n सर्विंग',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'आसान',
      '2': 'ठीक-ठाक',
      'other': 'थोड़ा कठिन',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n कम हैं',
      one: '$n कम है',
      zero: 'सब कुछ है',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'सामग्री';

  @override
  String get steps => 'विधि';

  @override
  String get tips => 'सुझाव';

  @override
  String get optional => 'वैकल्पिक';

  @override
  String get toTaste => 'स्वादानुसार';

  @override
  String get addMissingToShopping => 'जो कम है उसे ख़रीदारी में जोड़ें';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n आइटम जुड़े',
      one: '$n आइटम जुड़ा',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'पकाएँ';

  @override
  String stepOf(int i, int n) {
    return 'चरण $i/$n';
  }

  @override
  String get next => 'आगे';

  @override
  String get back => 'पीछे';

  @override
  String get done => 'पूरा हुआ';

  @override
  String startTimer(String t) {
    return 'टाइमर $t शुरू करें';
  }

  @override
  String get timerDone => 'समय पूरा हुआ!';

  @override
  String get cookedTitle => 'स्वाद लीजिए!';

  @override
  String get cookedBody =>
      'खाना तैयार है। इस्तेमाल की गई सामग्री भंडार से हटा दें?';

  @override
  String get removeUsed => 'हटाएँ';

  @override
  String get keep => 'रहने दें';

  @override
  String get shoppingEmpty => 'ख़रीदारी की सूची ख़ाली है।';

  @override
  String get checkout => 'ख़रीद लिया';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n सामग्री भंडार में हैं',
      one: '$n सामग्री भंडार में है',
    );
    return '$_temp0';
  }

  @override
  String get language => 'रेसिपी की भाषा';

  @override
  String get noRecipes => 'रेसिपी अभी तैयार हो रही हैं।';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'चेक',
      'italian': 'इतालवी',
      'vietnamese': 'वियतनामी',
      'asian': 'एशियाई',
      'mexmed': 'मैक्सिकन और भूमध्यसागरीय',
      'quick': 'झटपट',
      'family': 'पारिवारिक',
      'other': 'अन्य',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'सब्ज़ियाँ',
      'ovoce': 'फल',
      'houby': 'मशरूम',
      'cerstve_bylinky': 'ताज़ी जड़ी-बूटियाँ',
      'maso': 'मांस',
      'uzeniny': 'प्रसंस्कृत मांस',
      'ryby': 'मछली',
      'mlecne': 'डेयरी',
      'vejce': 'अंडे',
      'rostlinne_bilkoviny': 'टोफ़ू आदि',
      'obiloviny': 'अनाज',
      'mouka': 'आटा',
      'testoviny': 'पास्ता',
      'pecivo': 'ब्रेड और बेकरी',
      'lusteniny': 'दालें',
      'orechy_seminka': 'मेवे और बीज',
      'susene_plody': 'सूखे फल',
      'koreni': 'मसाले',
      'oleje_tuky': 'तेल और वसा',
      'ocet_omacky': 'सॉस और सिरका',
      'sladidla': 'मीठा करने वाले',
      'konzervy': 'डिब्बाबंद',
      'napoje': 'पेय',
      'other': 'अन्य',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'ग्रा',
      'kg': 'किग्रा',
      'ml': 'मिली',
      'l': 'ली',
      'dl': 'डेसीली',
      'cl': 'सेंटीली',
      'ks': 'नग',
      'lzice': 'बड़ा चम्मच',
      'lzicka': 'छोटा चम्मच',
      'hrnek': 'कप',
      'strouzek': 'कली',
      'stipka': 'चुटकी',
      'plechovka': 'डिब्बा',
      'svazek': 'गुच्छा',
      'hrst': 'मुट्ठी',
      'platek': 'स्लाइस',
      'dkg': 'dkg',
      'balicek': 'पैकेट',
      'stonek': 'डंठल',
      'snitka': 'टहनी',
      'kostka': 'क्यूब',
      'hlava': 'गाँठ',
      'oz': 'औंस',
      'lb': 'पाउंड',
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
