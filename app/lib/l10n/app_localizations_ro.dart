// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Ce gătesc';

  @override
  String get tabPantry => 'Cămară';

  @override
  String get tabShopping => 'Cumpărături';

  @override
  String get groupReady => 'Poți face acum';

  @override
  String get groupMissing1 => 'Lipsește 1 ingredient';

  @override
  String get groupMissing23 => 'Lipsesc 2–3 ingrediente';

  @override
  String get groupMore => 'Trebuie cumpărate';

  @override
  String get emptyPantryHint => 'Adaugă ce ai acasă și îți arăt ce poți găti.';

  @override
  String get addToPantry => 'Adaugă în cămară';

  @override
  String get searchIngredient => 'Ce ai acasă? (de ex. ouă, orez)';

  @override
  String get pantryEmpty => 'Cămara este goală. Adaugă primul ingredient.';

  @override
  String get pantryStaplesNote =>
      'Presupun că ai acasă sare, piper, ulei și alte produse de bază.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n de porții',
      few: '$n porții',
      one: '$n porție',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'ușor',
      '2': 'accesibil',
      'other': 'mai dificil',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'lipsesc $n',
      few: 'lipsesc $n',
      one: 'lipsește $n',
      zero: 'ai tot ce trebuie',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingrediente';

  @override
  String get steps => 'Mod de preparare';

  @override
  String get tips => 'Sfaturi';

  @override
  String get optional => 'opțional';

  @override
  String get toTaste => 'după gust';

  @override
  String get addMissingToShopping => 'Adaugă ce lipsește la cumpărături';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'S-au adăugat $n de articole',
      few: 'S-au adăugat $n articole',
      one: 'S-a adăugat $n articol',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Gătește';

  @override
  String stepOf(int i, int n) {
    return 'Pasul $i din $n';
  }

  @override
  String get next => 'Înainte';

  @override
  String get back => 'Înapoi';

  @override
  String get done => 'Gata';

  @override
  String startTimer(String t) {
    return 'Pornește cronometrul $t';
  }

  @override
  String get timerDone => 'Timpul a expirat!';

  @override
  String get cookedTitle => 'Poftă bună!';

  @override
  String get cookedBody =>
      'Gata de gătit. Scoți din cămară ingredientele folosite?';

  @override
  String get removeUsed => 'Scoate';

  @override
  String get keep => 'Păstrează';

  @override
  String get shoppingEmpty => 'Lista de cumpărături este goală.';

  @override
  String get checkout => 'Cumpărat';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n de ingrediente sunt în cămară',
      few: '$n ingrediente sunt în cămară',
      one: '$n ingredient este în cămară',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Limba rețetelor';

  @override
  String get noRecipes => 'Rețetele sunt încă în pregătire.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Cehă',
      'italian': 'Italiană',
      'vietnamese': 'Vietnameză',
      'asian': 'Asiatică',
      'mexmed': 'Mexicană și mediteraneană',
      'quick': 'Rapidă',
      'family': 'De familie',
      'other': 'Altele',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Legume',
      'ovoce': 'Fructe',
      'houby': 'Ciuperci',
      'cerstve_bylinky': 'Ierburi proaspete',
      'maso': 'Carne',
      'uzeniny': 'Mezeluri',
      'ryby': 'Pește',
      'mlecne': 'Lactate',
      'vejce': 'Ouă',
      'rostlinne_bilkoviny': 'Tofu și similare',
      'obiloviny': 'Cereale',
      'mouka': 'Făină',
      'testoviny': 'Paste',
      'pecivo': 'Pâine și panificație',
      'lusteniny': 'Leguminoase',
      'orechy_seminka': 'Nuci și semințe',
      'susene_plody': 'Fructe uscate',
      'koreni': 'Condimente',
      'oleje_tuky': 'Uleiuri și grăsimi',
      'ocet_omacky': 'Sosuri și oțet',
      'sladidla': 'Îndulcitori',
      'konzervy': 'Conserve',
      'napoje': 'Băuturi',
      'other': 'Altele',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'g',
      'kg': 'kg',
      'ml': 'ml',
      'l': 'l',
      'dl': 'dl',
      'cl': 'cl',
      'ks': 'buc.',
      'lzice': 'lingură',
      'lzicka': 'linguriță',
      'hrnek': 'cană',
      'strouzek': 'cățel',
      'stipka': 'vârf de cuțit',
      'plechovka': 'cutie',
      'svazek': 'legătură',
      'hrst': 'mână',
      'platek': 'felie',
      'dkg': 'dag',
      'balicek': 'pachet',
      'stonek': 'tulpină',
      'snitka': 'ramură',
      'kostka': 'cub',
      'hlava': 'căpățână',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Bucătării';

  @override
  String get restorePurchases => 'Restabilește achizițiile';

  @override
  String get restoreStarted => 'Se restabilesc achizițiile…';

  @override
  String get storeUnavailable =>
      'Magazinul nu este disponibil acum. Încearcă mai târziu, când ești online.';

  @override
  String get storeLoading => 'Se încarcă prețurile…';

  @override
  String get unlockedLabel => 'Deblocat';

  @override
  String buy(String price) {
    return 'Cumpără · $price';
  }

  @override
  String get notForSale => 'Încă indisponibil';

  @override
  String get purchasePending => 'Se așteaptă confirmarea…';

  @override
  String purchaseFailed(String msg) {
    return 'Achiziția a eșuat: $msg';
  }

  @override
  String get allPacksTitle => 'Toate bucătăriile';

  @override
  String get allPacksBody =>
      'Deblochează toate pachetele deodată, mai ieftin decât pe rând.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n de rețete',
      few: '$n rețete',
      one: '$n rețetă',
      zero: 'rețete în pregătire',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Rețetă din pachetul $pack';
  }

  @override
  String get lockedBody =>
      'Vezi deja ingredientele; pașii și modul de gătit se deblochează cu pachetul.';

  @override
  String get unlock => 'Deblochează';

  @override
  String get settings => 'Setări';

  @override
  String get statsToggle => 'Statistici anonime';

  @override
  String get statsToggleBody =>
      'Ajută la îmbunătățirea aplicației. Fără identificatori, nimic din ce scrii.';
}
