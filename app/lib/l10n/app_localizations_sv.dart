// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Vad ska jag laga';

  @override
  String get tabPantry => 'Skafferi';

  @override
  String get tabShopping => 'Inköp';

  @override
  String get groupReady => 'Kan lagas nu';

  @override
  String get groupMissing1 => '1 sak saknas';

  @override
  String get groupMissing23 => '2–3 saker saknas';

  @override
  String get groupMore => 'Behöver handlas';

  @override
  String get emptyPantryHint =>
      'Lägg till det du har hemma så visar jag vad du kan laga.';

  @override
  String get addToPantry => 'Lägg till i skafferiet';

  @override
  String get searchIngredient => 'Vad har du? (t.ex. ägg, ris)';

  @override
  String get pantryEmpty =>
      'Ditt skafferi är tomt. Lägg till den första ingrediensen.';

  @override
  String get pantryStaplesNote =>
      'Jag utgår från att du har salt, peppar, olja och andra basvaror hemma.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n portioner',
      one: '$n portion',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'enkelt',
      '2': 'överkomligt',
      'other': 'svårare',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n saknas',
      zero: 'du har allt',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingredienser';

  @override
  String get steps => 'Gör så här';

  @override
  String get tips => 'Tips';

  @override
  String get optional => 'valfritt';

  @override
  String get toTaste => 'efter smak';

  @override
  String get addMissingToShopping => 'Lägg till det som saknas i inköpslistan';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n varor tillagda',
      one: '$n vara tillagd',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Laga mat';

  @override
  String stepOf(int i, int n) {
    return 'Steg $i av $n';
  }

  @override
  String get next => 'Nästa';

  @override
  String get back => 'Tillbaka';

  @override
  String get done => 'Klart';

  @override
  String startTimer(String t) {
    return 'Starta timer $t';
  }

  @override
  String get timerDone => 'Tiden är ute!';

  @override
  String get cookedTitle => 'Smaklig måltid!';

  @override
  String get cookedBody =>
      'Maten är klar. Ta bort de använda ingredienserna från skafferiet?';

  @override
  String get removeUsed => 'Ta bort';

  @override
  String get keep => 'Behåll';

  @override
  String get shoppingEmpty => 'Din inköpslista är tom.';

  @override
  String get checkout => 'Köpt';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingredienser finns i skafferiet',
      one: '$n ingrediens finns i skafferiet',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Receptspråk';

  @override
  String get noRecipes => 'Recepten förbereds fortfarande.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Tjeckiskt',
      'italian': 'Italienskt',
      'vietnamese': 'Vietnamesiskt',
      'asian': 'Asiatiskt',
      'mexmed': 'Mexikanskt och medelhavs',
      'quick': 'Snabbt',
      'family': 'Familj',
      'other': 'Övrigt',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Grönsaker',
      'ovoce': 'Frukt',
      'houby': 'Svamp',
      'cerstve_bylinky': 'Färska örter',
      'maso': 'Kött',
      'uzeniny': 'Charkuterier',
      'ryby': 'Fisk',
      'mlecne': 'Mejeri',
      'vejce': 'Ägg',
      'rostlinne_bilkoviny': 'Tofu m.m.',
      'obiloviny': 'Spannmål',
      'mouka': 'Mjöl',
      'testoviny': 'Pasta',
      'pecivo': 'Bröd och bakverk',
      'lusteniny': 'Baljväxter',
      'orechy_seminka': 'Nötter och frön',
      'susene_plody': 'Torkad frukt',
      'koreni': 'Kryddor',
      'oleje_tuky': 'Oljor och fetter',
      'ocet_omacky': 'Såser och vinäger',
      'sladidla': 'Sötningsmedel',
      'konzervy': 'Konserver',
      'napoje': 'Drycker',
      'other': 'Övrigt',
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
      'ks': 'st',
      'lzice': 'msk',
      'lzicka': 'tsk',
      'hrnek': 'kopp',
      'strouzek': 'klyfta',
      'stipka': 'nypa',
      'plechovka': 'burk',
      'svazek': 'knippe',
      'hrst': 'handfull',
      'platek': 'skiva',
      'dkg': 'dkg',
      'balicek': 'paket',
      'stonek': 'stjälk',
      'snitka': 'kvist',
      'kostka': 'tärning',
      'hlava': 'huvud',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Kök';

  @override
  String get restorePurchases => 'Återställ köp';

  @override
  String get restoreStarted => 'Återställer köp…';

  @override
  String get storeUnavailable =>
      'Butiken är inte tillgänglig just nu. Försök igen senare när du är online.';

  @override
  String get storeLoading => 'Laddar priser…';

  @override
  String get unlockedLabel => 'Upplåst';

  @override
  String buy(String price) {
    return 'Köp · $price';
  }

  @override
  String get notForSale => 'Inte tillgänglig än';

  @override
  String get purchasePending => 'Väntar på bekräftelse…';

  @override
  String purchaseFailed(String msg) {
    return 'Köpet misslyckades: $msg';
  }

  @override
  String get allPacksTitle => 'Alla kök';

  @override
  String get allPacksBody =>
      'Låser upp alla paket på en gång, billigare än ett i taget.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n recept',
      one: '$n recept',
      zero: 'recept på väg',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Recept från paketet $pack';
  }

  @override
  String get lockedBody =>
      'Du ser ingredienserna; stegen och matlagningsläget låses upp med paketet.';

  @override
  String get unlock => 'Lås upp';

  @override
  String get settings => 'Inställningar';

  @override
  String get statsToggle => 'Anonym statistik';

  @override
  String get statsToggleBody =>
      'Hjälper till att förbättra appen. Inga identifierare, inget av det du skriver.';
}
