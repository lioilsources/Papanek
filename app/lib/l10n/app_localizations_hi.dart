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
  String get tabShop => 'व्यंजन';

  @override
  String get restorePurchases => 'खरीदारी बहाल करें';

  @override
  String get restoreStarted => 'खरीदारी बहाल हो रही है…';

  @override
  String get storeUnavailable =>
      'स्टोर अभी उपलब्ध नहीं है। ऑनलाइन होने पर बाद में फिर कोशिश करें।';

  @override
  String get storeLoading => 'कीमतें लोड हो रही हैं…';

  @override
  String get unlockedLabel => 'अनलॉक';

  @override
  String buy(String price) {
    return 'खरीदें · $price';
  }

  @override
  String get notForSale => 'अभी उपलब्ध नहीं';

  @override
  String get purchasePending => 'पुष्टि का इंतज़ार…';

  @override
  String purchaseFailed(String msg) {
    return 'खरीदारी विफल: $msg';
  }

  @override
  String get allPacksTitle => 'सभी व्यंजन';

  @override
  String get allPacksBody =>
      'सभी पैक एक साथ अनलॉक करता है, एक-एक लेने से सस्ता।';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n रेसिपी',
      one: '$n रेसिपी',
      zero: 'रेसिपी तैयार हो रही हैं',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return '$pack पैक की रेसिपी';
  }

  @override
  String get lockedBody =>
      'सामग्री दिख रही है; विधि और कुकिंग मोड पैक के साथ खुलते हैं।';

  @override
  String get unlock => 'अनलॉक करें';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get statsToggle => 'अनाम आँकड़े';

  @override
  String get statsToggleBody =>
      'ऐप को बेहतर बनाने में मदद करते हैं। कोई पहचानकर्ता नहीं, आप जो लिखते हैं उसमें से कुछ नहीं।';
}
