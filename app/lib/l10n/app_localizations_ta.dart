// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'என்ன சமைக்கலாம்';

  @override
  String get tabPantry => 'சமையலறை இருப்பு';

  @override
  String get tabShopping => 'பொருட்கள் வாங்க';

  @override
  String get groupReady => 'இப்போதே சமைக்கலாம்';

  @override
  String get groupMissing1 => '1 பொருள் குறைவு';

  @override
  String get groupMissing23 => '2–3 பொருட்கள் குறைவு';

  @override
  String get groupMore => 'வாங்க வேண்டும்';

  @override
  String get emptyPantryHint =>
      'வீட்டில் இருப்பதைச் சேருங்கள், நீங்கள் என்ன சமைக்கலாம் என்று காட்டுகிறேன்.';

  @override
  String get addToPantry => 'இருப்பில் சேர்';

  @override
  String get searchIngredient =>
      'வீட்டில் என்ன இருக்கிறது? (எ.கா. முட்டை, அரிசி)';

  @override
  String get pantryEmpty => 'இருப்பு காலியாக உள்ளது. முதல் பொருளைச் சேருங்கள்.';

  @override
  String get pantryStaplesNote =>
      'உப்பு, மிளகு, எண்ணெய் போன்ற அடிப்படைப் பொருட்கள் உங்களிடம் இருப்பதாக நான் கருதுகிறேன்.';

  @override
  String minutes(int n) {
    return '$n நிமிடம்';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n பரிமாறல்',
      one: '$n பரிமாறல்',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'எளிது',
      '2': 'நடுத்தரம்',
      'other': 'சற்று கடினம்',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n குறைவு',
      one: '$n குறைவு',
      zero: 'எல்லாம் உள்ளது',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'தேவையான பொருட்கள்';

  @override
  String get steps => 'செய்முறை';

  @override
  String get tips => 'குறிப்புகள்';

  @override
  String get optional => 'விருப்பம்';

  @override
  String get toTaste => 'தேவைக்கேற்ப';

  @override
  String get addMissingToShopping => 'குறைவானவற்றை வாங்கும் பட்டியலில் சேர்';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n பொருட்கள் சேர்க்கப்பட்டன',
      one: '$n பொருள் சேர்க்கப்பட்டது',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'சமை';

  @override
  String stepOf(int i, int n) {
    return 'படி $i / $n';
  }

  @override
  String get next => 'அடுத்து';

  @override
  String get back => 'பின்';

  @override
  String get done => 'முடிந்தது';

  @override
  String startTimer(String t) {
    return 'டைமர் $t தொடங்கு';
  }

  @override
  String get timerDone => 'நேரம் முடிந்தது!';

  @override
  String get cookedTitle => 'சுவைத்து மகிழுங்கள்!';

  @override
  String get cookedBody =>
      'சமையல் முடிந்தது. பயன்படுத்திய பொருட்களை இருப்பிலிருந்து நீக்கலாமா?';

  @override
  String get removeUsed => 'நீக்கு';

  @override
  String get keep => 'வை';

  @override
  String get shoppingEmpty => 'வாங்கும் பட்டியல் காலியாக உள்ளது.';

  @override
  String get checkout => 'வாங்கியாச்சு';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n பொருட்கள் இருப்பில் உள்ளன',
      one: '$n பொருள் இருப்பில் உள்ளது',
    );
    return '$_temp0';
  }

  @override
  String get language => 'சமையல் குறிப்பின் மொழி';

  @override
  String get noRecipes => 'சமையல் குறிப்புகள் இன்னும் தயாராகின்றன.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'செக்',
      'italian': 'இத்தாலியன்',
      'vietnamese': 'வியட்நாமிய',
      'asian': 'ஆசிய',
      'mexmed': 'மெக்சிகன் மற்றும் மத்தியதரைக்கடல்',
      'quick': 'விரைவு',
      'family': 'குடும்பம்',
      'other': 'மற்றவை',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'காய்கறிகள்',
      'ovoce': 'பழங்கள்',
      'houby': 'காளான்',
      'cerstve_bylinky': 'புதிய மூலிகைகள்',
      'maso': 'இறைச்சி',
      'uzeniny': 'பதப்படுத்திய இறைச்சி',
      'ryby': 'மீன்',
      'mlecne': 'பால் பொருட்கள்',
      'vejce': 'முட்டை',
      'rostlinne_bilkoviny': 'டோஃபு போன்றவை',
      'obiloviny': 'தானியங்கள்',
      'mouka': 'மாவு',
      'testoviny': 'பாஸ்தா',
      'pecivo': 'ரொட்டி, பேக்கரி',
      'lusteniny': 'பருப்பு வகைகள்',
      'orechy_seminka': 'கொட்டைகள், விதைகள்',
      'susene_plody': 'உலர் பழங்கள்',
      'koreni': 'மசாலா',
      'oleje_tuky': 'எண்ணெய், கொழுப்பு',
      'ocet_omacky': 'சாஸ், வினிகர்',
      'sladidla': 'இனிப்பூட்டிகள்',
      'konzervy': 'டின் உணவுகள்',
      'napoje': 'பானங்கள்',
      'other': 'மற்றவை',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'கி',
      'kg': 'கிகி',
      'ml': 'மிலி',
      'l': 'லி',
      'dl': 'டெசிலி',
      'cl': 'சென்டிலி',
      'ks': 'எண்',
      'lzice': 'மேசைக்கரண்டி',
      'lzicka': 'தேக்கரண்டி',
      'hrnek': 'கப்',
      'strouzek': 'பல்',
      'stipka': 'சிட்டிகை',
      'plechovka': 'டின்',
      'svazek': 'கட்டு',
      'hrst': 'கைப்பிடி',
      'platek': 'துண்டு',
      'dkg': 'dkg',
      'balicek': 'பாக்கெட்',
      'stonek': 'தண்டு',
      'snitka': 'கொத்து',
      'kostka': 'கனசதுரம்',
      'hlava': 'தலை',
      'oz': 'அவுன்ஸ்',
      'lb': 'பவுண்டு',
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
