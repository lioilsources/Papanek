// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'എന്ത് പാചകം ചെയ്യാം';

  @override
  String get tabPantry => 'അടുക്കള ശേഖരം';

  @override
  String get tabShopping => 'ഷോപ്പിങ്';

  @override
  String get groupReady => 'ഇപ്പോൾ തയ്യാറാക്കാം';

  @override
  String get groupMissing1 => '1 സാധനം കുറവാണ്';

  @override
  String get groupMissing23 => '2–3 സാധനങ്ങൾ കുറവാണ്';

  @override
  String get groupMore => 'സാധനങ്ങൾ വാങ്ങണം';

  @override
  String get emptyPantryHint =>
      'വീട്ടിലുള്ളത് ചേർക്കൂ, എന്തൊക്കെ പാകം ചെയ്യാമെന്ന് ഞാൻ കാണിച്ചുതരാം.';

  @override
  String get addToPantry => 'ശേഖരത്തിലേക്ക് ചേർക്കുക';

  @override
  String get searchIngredient => 'വീട്ടിൽ എന്തുണ്ട്? (ഉദാ. മുട്ട, അരി)';

  @override
  String get pantryEmpty => 'ശേഖരം ശൂന്യമാണ്. ആദ്യ ചേരുവ ചേർക്കൂ.';

  @override
  String get pantryStaplesNote =>
      'ഉപ്പ്, കുരുമുളക്, എണ്ണ തുടങ്ങിയ അടിസ്ഥാന സാധനങ്ങൾ നിങ്ങളുടെ കയ്യിലുണ്ടെന്ന് ഞാൻ കരുതുന്നു.';

  @override
  String minutes(int n) {
    return '$n മിനിറ്റ്';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n സെർവിങ്',
      one: '$n സെർവിങ്',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'എളുപ്പം',
      '2': 'ഇടത്തരം',
      'other': 'അല്പം കടുപ്പം',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n കുറവ്',
      one: '$n കുറവ്',
      zero: 'എല്ലാം ഉണ്ട്',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'ചേരുവകൾ';

  @override
  String get steps => 'തയ്യാറാക്കുന്ന വിധം';

  @override
  String get tips => 'നുറുങ്ങുകൾ';

  @override
  String get optional => 'ഓപ്ഷണൽ';

  @override
  String get toTaste => 'ആവശ്യത്തിന്';

  @override
  String get addMissingToShopping => 'കുറവുള്ളവ ഷോപ്പിങ്ങിൽ ചേർക്കുക';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ഇനങ്ങൾ ചേർത്തു',
      one: '$n ഇനം ചേർത്തു',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'പാചകം തുടങ്ങാം';

  @override
  String stepOf(int i, int n) {
    return 'ഘട്ടം $i / $n';
  }

  @override
  String get next => 'അടുത്തത്';

  @override
  String get back => 'പിന്നിലേക്ക്';

  @override
  String get done => 'കഴിഞ്ഞു';

  @override
  String startTimer(String t) {
    return 'ടൈമർ $t തുടങ്ങുക';
  }

  @override
  String get timerDone => 'സമയം കഴിഞ്ഞു!';

  @override
  String get cookedTitle => 'ആസ്വദിച്ച് കഴിക്കൂ!';

  @override
  String get cookedBody =>
      'പാചകം കഴിഞ്ഞു. ഉപയോഗിച്ച ചേരുവകൾ ശേഖരത്തിൽ നിന്ന് നീക്കണോ?';

  @override
  String get removeUsed => 'നീക്കുക';

  @override
  String get keep => 'നിലനിർത്തുക';

  @override
  String get shoppingEmpty => 'ഷോപ്പിങ് പട്ടിക ശൂന്യമാണ്.';

  @override
  String get checkout => 'വാങ്ങി';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ചേരുവകൾ ശേഖരത്തിലുണ്ട്',
      one: '$n ചേരുവ ശേഖരത്തിലുണ്ട്',
    );
    return '$_temp0';
  }

  @override
  String get language => 'റെസിപ്പി ഭാഷ';

  @override
  String get noRecipes => 'റെസിപ്പികൾ ഇപ്പോഴും തയ്യാറാകുന്നു.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'ചെക്ക്',
      'italian': 'ഇറ്റാലിയൻ',
      'vietnamese': 'വിയറ്റ്നാമീസ്',
      'asian': 'ഏഷ്യൻ',
      'mexmed': 'മെക്സിക്കൻ, മെഡിറ്ററേനിയൻ',
      'quick': 'പെട്ടെന്നുള്ളത്',
      'family': 'കുടുംബത്തിന്',
      'other': 'മറ്റുള്ളവ',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'പച്ചക്കറികൾ',
      'ovoce': 'പഴങ്ങൾ',
      'houby': 'കൂണുകൾ',
      'cerstve_bylinky': 'പച്ചമരുന്നുകൾ',
      'maso': 'ഇറച്ചി',
      'uzeniny': 'സംസ്കരിച്ച ഇറച്ചി',
      'ryby': 'മത്സ്യം',
      'mlecne': 'പാൽ ഉൽപ്പന്നങ്ങൾ',
      'vejce': 'മുട്ട',
      'rostlinne_bilkoviny': 'ടോഫു മുതലായവ',
      'obiloviny': 'ധാന്യങ്ങൾ',
      'mouka': 'മാവ്',
      'testoviny': 'പാസ്ത',
      'pecivo': 'ബ്രെഡ്, ബേക്കറി',
      'lusteniny': 'പയർവർഗങ്ങൾ',
      'orechy_seminka': 'നട്സും വിത്തുകളും',
      'susene_plody': 'ഉണക്കപ്പഴങ്ങൾ',
      'koreni': 'സുഗന്ധവ്യഞ്ജനങ്ങൾ',
      'oleje_tuky': 'എണ്ണയും കൊഴുപ്പും',
      'ocet_omacky': 'സോസും വിനാഗിരിയും',
      'sladidla': 'മധുരം നൽകുന്നവ',
      'konzervy': 'ടിന്നിലടച്ചവ',
      'napoje': 'പാനീയങ്ങൾ',
      'other': 'മറ്റുള്ളവ',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'ഗ്രാം',
      'kg': 'കിലോ',
      'ml': 'മില്ലി',
      'l': 'ലിറ്റർ',
      'dl': 'ഡെസിലിറ്റർ',
      'cl': 'സെന്റിലിറ്റർ',
      'ks': 'എണ്ണം',
      'lzice': 'ടേബിൾസ്പൂൺ',
      'lzicka': 'ടീസ്പൂൺ',
      'hrnek': 'കപ്പ്',
      'strouzek': 'അല്ലി',
      'stipka': 'നുള്ള്',
      'plechovka': 'ടിൻ',
      'svazek': 'കെട്ട്',
      'hrst': 'പിടി',
      'platek': 'കഷ്ണം',
      'dkg': 'dkg',
      'balicek': 'പാക്കറ്റ്',
      'stonek': 'തണ്ട്',
      'snitka': 'ഇല',
      'kostka': 'ക്യൂബ്',
      'hlava': 'തല',
      'oz': 'ഔൺസ്',
      'lb': 'പൗണ്ട്',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'പാചകരീതികൾ';

  @override
  String get restorePurchases => 'വാങ്ങലുകൾ പുനഃസ്ഥാപിക്കുക';

  @override
  String get restoreStarted => 'വാങ്ങലുകൾ പുനഃസ്ഥാപിക്കുന്നു…';

  @override
  String get storeUnavailable =>
      'സ്റ്റോർ ഇപ്പോൾ ലഭ്യമല്ല. ഓൺലൈനിൽ ആയിരിക്കുമ്പോൾ പിന്നീട് വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get storeLoading => 'വിലകൾ ലോഡ് ചെയ്യുന്നു…';

  @override
  String get unlockedLabel => 'അൺലോക്ക് ചെയ്തു';

  @override
  String buy(String price) {
    return 'വാങ്ങുക · $price';
  }

  @override
  String get notForSale => 'ഇതുവരെ ലഭ്യമല്ല';

  @override
  String get purchasePending => 'സ്ഥിരീകരണത്തിനായി കാത്തിരിക്കുന്നു…';

  @override
  String purchaseFailed(String msg) {
    return 'വാങ്ങൽ പരാജയപ്പെട്ടു: $msg';
  }

  @override
  String get allPacksTitle => 'എല്ലാ പാചകരീതികളും';

  @override
  String get allPacksBody =>
      'എല്ലാ പാക്കുകളും ഒറ്റയടിക്ക് അൺലോക്ക് ചെയ്യുന്നു, ഓരോന്നായി വാങ്ങുന്നതിനേക്കാൾ ലാഭം.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n പാചകക്കുറിപ്പുകൾ',
      one: '$n പാചകക്കുറിപ്പ്',
      zero: 'പാചകക്കുറിപ്പുകൾ തയ്യാറാകുന്നു',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return '$pack പാക്കിലെ പാചകക്കുറിപ്പ്';
  }

  @override
  String get lockedBody =>
      'ചേരുവകൾ കാണാം; ഘട്ടങ്ങളും പാചക മോഡും പാക്കിനൊപ്പം തുറക്കും.';

  @override
  String get unlock => 'അൺലോക്ക് ചെയ്യുക';
}
