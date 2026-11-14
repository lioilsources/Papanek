// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Wat kook ik';

  @override
  String get tabPantry => 'Voorraad';

  @override
  String get tabShopping => 'Boodschappen';

  @override
  String get groupReady => 'Direct te maken';

  @override
  String get groupMissing1 => '1 ding ontbreekt';

  @override
  String get groupMissing23 => '2–3 dingen ontbreken';

  @override
  String get groupMore => 'Boodschappen nodig';

  @override
  String get emptyPantryHint =>
      'Voeg toe wat je in huis hebt en ik laat zien wat je kunt koken.';

  @override
  String get addToPantry => 'Toevoegen aan voorraad';

  @override
  String get searchIngredient => 'Wat heb je in huis? (bijv. eieren, rijst)';

  @override
  String get pantryEmpty =>
      'Je voorraad is leeg. Voeg het eerste ingrediënt toe.';

  @override
  String get pantryStaplesNote =>
      'Ik ga ervan uit dat je zout, peper, olie en andere basisproducten in huis hebt.';

  @override
  String minutes(int n) {
    return '$n min.';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n porties',
      one: '$n portie',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'makkelijk',
      '2': 'haalbaar',
      'other': 'lastiger',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ontbreken',
      zero: 'je hebt alles',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingrediënten';

  @override
  String get steps => 'Bereiding';

  @override
  String get tips => 'Tips';

  @override
  String get optional => 'optioneel';

  @override
  String get toTaste => 'naar smaak';

  @override
  String get addMissingToShopping => 'Ontbrekende op boodschappenlijst';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n items toegevoegd',
      one: '$n item toegevoegd',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Koken';

  @override
  String stepOf(int i, int n) {
    return 'Stap $i van $n';
  }

  @override
  String get next => 'Volgende';

  @override
  String get back => 'Terug';

  @override
  String get done => 'Klaar';

  @override
  String startTimer(String t) {
    return 'Timer $t starten';
  }

  @override
  String get timerDone => 'De tijd is om!';

  @override
  String get cookedTitle => 'Eet smakelijk!';

  @override
  String get cookedBody =>
      'Klaar met koken. Gebruikte ingrediënten uit de voorraad halen?';

  @override
  String get removeUsed => 'Verwijderen';

  @override
  String get keep => 'Bewaren';

  @override
  String get shoppingEmpty => 'Je boodschappenlijst is leeg.';

  @override
  String get checkout => 'Gekocht';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingrediënten zitten in je voorraad',
      one: '$n ingrediënt zit in je voorraad',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Receptentaal';

  @override
  String get noRecipes => 'De recepten zijn nog in voorbereiding.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Tsjechisch',
      'italian': 'Italiaans',
      'vietnamese': 'Vietnamees',
      'asian': 'Aziatisch',
      'mexmed': 'Mexicaans & mediterraan',
      'quick': 'Snel',
      'family': 'Gezin',
      'other': 'Overig',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Groenten',
      'ovoce': 'Fruit',
      'houby': 'Paddenstoelen',
      'cerstve_bylinky': 'Verse kruiden',
      'maso': 'Vlees',
      'uzeniny': 'Vleeswaren',
      'ryby': 'Vis',
      'mlecne': 'Zuivel',
      'vejce': 'Eieren',
      'rostlinne_bilkoviny': 'Tofu & co.',
      'obiloviny': 'Granen',
      'mouka': 'Meel',
      'testoviny': 'Pasta',
      'pecivo': 'Brood & gebak',
      'lusteniny': 'Peulvruchten',
      'orechy_seminka': 'Noten & zaden',
      'susene_plody': 'Gedroogd fruit',
      'koreni': 'Specerijen',
      'oleje_tuky': 'Oliën & vetten',
      'ocet_omacky': 'Sauzen & azijn',
      'sladidla': 'Zoetstoffen',
      'konzervy': 'Conserven',
      'napoje': 'Dranken',
      'other': 'Overig',
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
      'ks': 'st.',
      'lzice': 'el',
      'lzicka': 'tl',
      'hrnek': 'kop',
      'strouzek': 'teentje',
      'stipka': 'snufje',
      'plechovka': 'blik',
      'svazek': 'bos',
      'hrst': 'handvol',
      'platek': 'plak',
      'dkg': 'dag',
      'balicek': 'pakje',
      'stonek': 'stengel',
      'snitka': 'takje',
      'kostka': 'blokje',
      'hlava': 'krop',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Keukens';

  @override
  String get restorePurchases => 'Aankopen herstellen';

  @override
  String get restoreStarted => 'Aankopen worden hersteld…';

  @override
  String get storeUnavailable =>
      'De store is nu niet beschikbaar. Probeer het later opnieuw als je online bent.';

  @override
  String get storeLoading => 'Prijzen laden…';

  @override
  String get unlockedLabel => 'Ontgrendeld';

  @override
  String buy(String price) {
    return 'Kopen · $price';
  }

  @override
  String get notForSale => 'Nog niet beschikbaar';

  @override
  String get purchasePending => 'Wachten op bevestiging…';

  @override
  String purchaseFailed(String msg) {
    return 'Aankoop mislukt: $msg';
  }

  @override
  String get allPacksTitle => 'Alle keukens';

  @override
  String get allPacksBody =>
      'Ontgrendelt alle pakketten in één keer, voordeliger dan los.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n recepten',
      one: '$n recept',
      zero: 'recepten in voorbereiding',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Recept uit het pakket $pack';
  }

  @override
  String get lockedBody =>
      'De ingrediënten zie je al; de stappen en kookmodus ontgrendel je met het pakket.';

  @override
  String get unlock => 'Ontgrendelen';

  @override
  String get settings => 'Instellingen';

  @override
  String get statsToggle => 'Anonieme statistieken';

  @override
  String get statsToggleBody =>
      'Helpen de app te verbeteren. Geen identificatoren, niets van wat je typt.';
}
