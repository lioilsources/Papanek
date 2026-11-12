// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'काय शिजवू';

  @override
  String get tabPantry => 'साठा';

  @override
  String get tabShopping => 'खरेदी';

  @override
  String get groupReady => 'आत्ता बनवता येईल';

  @override
  String get groupMissing1 => '1 गोष्ट कमी आहे';

  @override
  String get groupMissing23 => '2–3 गोष्टी कमी आहेत';

  @override
  String get groupMore => 'खरेदी करावी लागेल';

  @override
  String get emptyPantryHint =>
      'घरात जे आहे ते जोडा, मी दाखवतो की तुम्ही काय शिजवू शकता.';

  @override
  String get addToPantry => 'साठ्यात जोडा';

  @override
  String get searchIngredient => 'घरात काय आहे? (उदा. अंडी, तांदूळ)';

  @override
  String get pantryEmpty => 'साठा रिकामा आहे. पहिले साहित्य जोडा.';

  @override
  String get pantryStaplesNote =>
      'तुमच्याकडे मीठ, मिरी, तेल आणि इतर मूलभूत वस्तू आहेत असे मी गृहीत धरतो.';

  @override
  String minutes(int n) {
    return '$n मिनिटे';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n सर्व्हिंग',
      one: '$n सर्व्हिंग',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'सोपे',
      '2': 'मध्यम',
      'other': 'थोडे अवघड',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n कमी आहेत',
      one: '$n कमी आहे',
      zero: 'सर्व काही आहे',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'साहित्य';

  @override
  String get steps => 'कृती';

  @override
  String get tips => 'टिपा';

  @override
  String get optional => 'ऐच्छिक';

  @override
  String get toTaste => 'चवीनुसार';

  @override
  String get addMissingToShopping => 'कमी असलेले खरेदीत जोडा';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n वस्तू जोडल्या',
      one: '$n वस्तू जोडली',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'शिजवा';

  @override
  String stepOf(int i, int n) {
    return '$n पैकी पायरी $i';
  }

  @override
  String get next => 'पुढे';

  @override
  String get back => 'मागे';

  @override
  String get done => 'झाले';

  @override
  String startTimer(String t) {
    return 'टायमर $t सुरू करा';
  }

  @override
  String get timerDone => 'वेळ संपली!';

  @override
  String get cookedTitle => 'आस्वाद घ्या!';

  @override
  String get cookedBody =>
      'स्वयंपाक झाला. वापरलेले साहित्य साठ्यातून काढायचे का?';

  @override
  String get removeUsed => 'काढा';

  @override
  String get keep => 'ठेवा';

  @override
  String get shoppingEmpty => 'खरेदीची यादी रिकामी आहे.';

  @override
  String get checkout => 'खरेदी झाली';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n साहित्य साठ्यात आहे',
      one: '$n साहित्य साठ्यात आहे',
    );
    return '$_temp0';
  }

  @override
  String get language => 'पाककृतीची भाषा';

  @override
  String get noRecipes => 'पाककृती अजून तयार होत आहेत.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'चेक',
      'italian': 'इटालियन',
      'vietnamese': 'व्हिएतनामी',
      'asian': 'आशियाई',
      'mexmed': 'मेक्सिकन आणि भूमध्यसागरीय',
      'quick': 'झटपट',
      'family': 'कौटुंबिक',
      'other': 'इतर',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'भाज्या',
      'ovoce': 'फळे',
      'houby': 'मशरूम',
      'cerstve_bylinky': 'ताज्या औषधी वनस्पती',
      'maso': 'मांस',
      'uzeniny': 'प्रक्रिया केलेले मांस',
      'ryby': 'मासे',
      'mlecne': 'दुग्धजन्य पदार्थ',
      'vejce': 'अंडी',
      'rostlinne_bilkoviny': 'टोफू आदी',
      'obiloviny': 'धान्ये',
      'mouka': 'पीठ',
      'testoviny': 'पास्ता',
      'pecivo': 'ब्रेड आणि बेकरी',
      'lusteniny': 'कडधान्ये',
      'orechy_seminka': 'सुकामेवा आणि बिया',
      'susene_plody': 'सुकी फळे',
      'koreni': 'मसाले',
      'oleje_tuky': 'तेल आणि चरबी',
      'ocet_omacky': 'सॉस आणि व्हिनेगर',
      'sladidla': 'गोडवा देणारे पदार्थ',
      'konzervy': 'डबाबंद पदार्थ',
      'napoje': 'पेये',
      'other': 'इतर',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'ग्रॅ',
      'kg': 'किग्रॅ',
      'ml': 'मिली',
      'l': 'लि',
      'dl': 'डेसिलि',
      'cl': 'सेंटिलि',
      'ks': 'नग',
      'lzice': 'टेबलस्पून',
      'lzicka': 'चमचा',
      'hrnek': 'कप',
      'strouzek': 'पाकळी',
      'stipka': 'चिमूटभर',
      'plechovka': 'डबा',
      'svazek': 'जुडी',
      'hrst': 'मूठ',
      'platek': 'स्लाइस',
      'dkg': 'dkg',
      'balicek': 'पाकीट',
      'stonek': 'देठ',
      'snitka': 'काडी',
      'kostka': 'क्यूब',
      'hlava': 'गड्डा',
      'oz': 'औंस',
      'lb': 'पाउंड',
      'other': '',
    });
    return '$_temp0';
  }
}
