// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'ਕੀ ਪਕਾਵਾਂ';

  @override
  String get tabPantry => 'ਭੰਡਾਰ';

  @override
  String get tabShopping => 'ਖਰੀਦਦਾਰੀ';

  @override
  String get groupReady => 'ਹੁਣੇ ਬਣ ਸਕਦਾ ਹੈ';

  @override
  String get groupMissing1 => '1 ਚੀਜ਼ ਘੱਟ ਹੈ';

  @override
  String get groupMissing23 => '2–3 ਚੀਜ਼ਾਂ ਘੱਟ ਹਨ';

  @override
  String get groupMore => 'ਖਰੀਦਦਾਰੀ ਕਰਨੀ ਪਵੇਗੀ';

  @override
  String get emptyPantryHint =>
      'ਘਰ ਵਿੱਚ ਜੋ ਹੈ ਉਹ ਜੋੜੋ, ਮੈਂ ਦੱਸਾਂਗਾ ਕਿ ਤੁਸੀਂ ਕੀ ਪਕਾ ਸਕਦੇ ਹੋ।';

  @override
  String get addToPantry => 'ਭੰਡਾਰ ਵਿੱਚ ਜੋੜੋ';

  @override
  String get searchIngredient => 'ਘਰ ਵਿੱਚ ਕੀ ਹੈ? (ਜਿਵੇਂ ਆਂਡੇ, ਚੌਲ)';

  @override
  String get pantryEmpty => 'ਭੰਡਾਰ ਖਾਲੀ ਹੈ। ਪਹਿਲੀ ਸਮੱਗਰੀ ਜੋੜੋ।';

  @override
  String get pantryStaplesNote =>
      'ਮੈਂ ਮੰਨਦਾ ਹਾਂ ਕਿ ਤੁਹਾਡੇ ਕੋਲ ਲੂਣ, ਮਿਰਚ, ਤੇਲ ਤੇ ਹੋਰ ਬੁਨਿਆਦੀ ਚੀਜ਼ਾਂ ਹਨ।';

  @override
  String minutes(int n) {
    return '$n ਮਿੰਟ';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ਸਰਵਿੰਗ',
      one: '$n ਸਰਵਿੰਗ',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'ਸੌਖਾ',
      '2': 'ਦਰਮਿਆਨਾ',
      'other': 'ਥੋੜ੍ਹਾ ਔਖਾ',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ਘੱਟ ਹਨ',
      one: '$n ਘੱਟ ਹੈ',
      zero: 'ਸਭ ਕੁਝ ਹੈ',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'ਸਮੱਗਰੀ';

  @override
  String get steps => 'ਵਿਧੀ';

  @override
  String get tips => 'ਸੁਝਾਅ';

  @override
  String get optional => 'ਵਿਕਲਪਿਕ';

  @override
  String get toTaste => 'ਸੁਆਦ ਅਨੁਸਾਰ';

  @override
  String get addMissingToShopping => 'ਘੱਟ ਚੀਜ਼ਾਂ ਖਰੀਦਦਾਰੀ ਵਿੱਚ ਜੋੜੋ';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ਆਈਟਮਾਂ ਜੋੜੀਆਂ ਗਈਆਂ',
      one: '$n ਆਈਟਮ ਜੋੜੀ ਗਈ',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'ਪਕਾਓ';

  @override
  String stepOf(int i, int n) {
    return '$n ਵਿੱਚੋਂ ਕਦਮ $i';
  }

  @override
  String get next => 'ਅੱਗੇ';

  @override
  String get back => 'ਪਿੱਛੇ';

  @override
  String get done => 'ਹੋ ਗਿਆ';

  @override
  String startTimer(String t) {
    return 'ਟਾਈਮਰ $t ਸ਼ੁਰੂ ਕਰੋ';
  }

  @override
  String get timerDone => 'ਸਮਾਂ ਪੂਰਾ ਹੋਇਆ!';

  @override
  String get cookedTitle => 'ਆਨੰਦ ਮਾਣੋ!';

  @override
  String get cookedBody => 'ਖਾਣਾ ਤਿਆਰ ਹੈ। ਵਰਤੀ ਗਈ ਸਮੱਗਰੀ ਭੰਡਾਰ ਵਿੱਚੋਂ ਹਟਾਈਏ?';

  @override
  String get removeUsed => 'ਹਟਾਓ';

  @override
  String get keep => 'ਰੱਖੋ';

  @override
  String get shoppingEmpty => 'ਖਰੀਦਦਾਰੀ ਸੂਚੀ ਖਾਲੀ ਹੈ।';

  @override
  String get checkout => 'ਖਰੀਦ ਲਿਆ';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ਸਮੱਗਰੀਆਂ ਭੰਡਾਰ ਵਿੱਚ ਹਨ',
      one: '$n ਸਮੱਗਰੀ ਭੰਡਾਰ ਵਿੱਚ ਹੈ',
    );
    return '$_temp0';
  }

  @override
  String get language => 'ਰੈਸਿਪੀ ਦੀ ਭਾਸ਼ਾ';

  @override
  String get noRecipes => 'ਰੈਸਿਪੀਆਂ ਅਜੇ ਤਿਆਰ ਹੋ ਰਹੀਆਂ ਹਨ।';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'ਚੈੱਕ',
      'italian': 'ਇਤਾਲਵੀ',
      'vietnamese': 'ਵੀਅਤਨਾਮੀ',
      'asian': 'ਏਸ਼ੀਆਈ',
      'mexmed': 'ਮੈਕਸੀਕਨ ਅਤੇ ਮੈਡੀਟੇਰੇਨੀਅਨ',
      'quick': 'ਫਟਾਫਟ',
      'family': 'ਪਰਿਵਾਰਕ',
      'other': 'ਹੋਰ',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'ਸਬਜ਼ੀਆਂ',
      'ovoce': 'ਫਲ',
      'houby': 'ਖੁੰਬਾਂ',
      'cerstve_bylinky': 'ਤਾਜ਼ੀਆਂ ਜੜ੍ਹੀਆਂ-ਬੂਟੀਆਂ',
      'maso': 'ਮਾਸ',
      'uzeniny': 'ਪ੍ਰੋਸੈਸਡ ਮਾਸ',
      'ryby': 'ਮੱਛੀ',
      'mlecne': 'ਡੇਅਰੀ',
      'vejce': 'ਆਂਡੇ',
      'rostlinne_bilkoviny': 'ਟੋਫੂ ਆਦਿ',
      'obiloviny': 'ਅਨਾਜ',
      'mouka': 'ਆਟਾ',
      'testoviny': 'ਪਾਸਤਾ',
      'pecivo': 'ਬਰੈੱਡ ਅਤੇ ਬੇਕਰੀ',
      'lusteniny': 'ਦਾਲਾਂ',
      'orechy_seminka': 'ਮੇਵੇ ਅਤੇ ਬੀਜ',
      'susene_plody': 'ਸੁੱਕੇ ਫਲ',
      'koreni': 'ਮਸਾਲੇ',
      'oleje_tuky': 'ਤੇਲ ਅਤੇ ਚਰਬੀ',
      'ocet_omacky': 'ਸੌਸ ਅਤੇ ਸਿਰਕਾ',
      'sladidla': 'ਮਿੱਠਾ ਕਰਨ ਵਾਲੇ',
      'konzervy': 'ਡੱਬਾਬੰਦ',
      'napoje': 'ਪੀਣ ਵਾਲੇ ਪਦਾਰਥ',
      'other': 'ਹੋਰ',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'ਗ੍ਰਾ',
      'kg': 'ਕਿਲੋ',
      'ml': 'ਮਿ.ਲੀ.',
      'l': 'ਲੀ.',
      'dl': 'ਡੈਸੀ.ਲੀ.',
      'cl': 'ਸੈਂਟੀ.ਲੀ.',
      'ks': 'ਨਗ',
      'lzice': 'ਵੱਡਾ ਚਮਚ',
      'lzicka': 'ਛੋਟਾ ਚਮਚ',
      'hrnek': 'ਕੱਪ',
      'strouzek': 'ਕਲੀ',
      'stipka': 'ਚੁਟਕੀ',
      'plechovka': 'ਡੱਬਾ',
      'svazek': 'ਗੁੱਛਾ',
      'hrst': 'ਮੁੱਠੀ',
      'platek': 'ਟੁਕੜਾ',
      'dkg': 'dkg',
      'balicek': 'ਪੈਕੇਟ',
      'stonek': 'ਡੰਡੀ',
      'snitka': 'ਟਹਿਣੀ',
      'kostka': 'ਕਿਊਬ',
      'hlava': 'ਗੰਢ',
      'oz': 'ਔਂਸ',
      'lb': 'ਪਾਊਂਡ',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'ਰਸੋਈਆਂ';

  @override
  String get restorePurchases => 'ਖਰੀਦਾਂ ਮੁੜ ਬਹਾਲ ਕਰੋ';

  @override
  String get restoreStarted => 'ਖਰੀਦਾਂ ਮੁੜ ਬਹਾਲ ਹੋ ਰਹੀਆਂ ਹਨ…';

  @override
  String get storeUnavailable =>
      'ਸਟੋਰ ਹੁਣ ਉਪਲਬਧ ਨਹੀਂ। ਆਨਲਾਈਨ ਹੋਣ \'ਤੇ ਬਾਅਦ ਵਿੱਚ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get storeLoading => 'ਕੀਮਤਾਂ ਲੋਡ ਹੋ ਰਹੀਆਂ ਹਨ…';

  @override
  String get unlockedLabel => 'ਅਨਲੌਕ';

  @override
  String buy(String price) {
    return 'ਖਰੀਦੋ · $price';
  }

  @override
  String get notForSale => 'ਹਾਲੇ ਉਪਲਬਧ ਨਹੀਂ';

  @override
  String get purchasePending => 'ਪੁਸ਼ਟੀ ਦੀ ਉਡੀਕ…';

  @override
  String purchaseFailed(String msg) {
    return 'ਖਰੀਦ ਅਸਫਲ: $msg';
  }

  @override
  String get allPacksTitle => 'ਸਾਰੀਆਂ ਰਸੋਈਆਂ';

  @override
  String get allPacksBody =>
      'ਸਾਰੇ ਪੈਕ ਇੱਕੋ ਵਾਰ ਅਨਲੌਕ ਕਰਦਾ ਹੈ, ਇੱਕ-ਇੱਕ ਲੈਣ ਨਾਲੋਂ ਸਸਤਾ।';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ਰੈਸਿਪੀਆਂ',
      one: '$n ਰੈਸਿਪੀ',
      zero: 'ਰੈਸਿਪੀਆਂ ਤਿਆਰ ਹੋ ਰਹੀਆਂ ਹਨ',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return '$pack ਪੈਕ ਦੀ ਰੈਸਿਪੀ';
  }

  @override
  String get lockedBody =>
      'ਸਮੱਗਰੀ ਦਿਸਦੀ ਹੈ; ਵਿਧੀ ਅਤੇ ਪਕਾਉਣ ਮੋਡ ਪੈਕ ਨਾਲ ਖੁੱਲ੍ਹਦੇ ਹਨ।';

  @override
  String get unlock => 'ਅਨਲੌਕ ਕਰੋ';
}
