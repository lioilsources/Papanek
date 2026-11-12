// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Mitä laitan';

  @override
  String get tabPantry => 'Ruokakomero';

  @override
  String get tabShopping => 'Ostokset';

  @override
  String get groupReady => 'Valmis tehtäväksi';

  @override
  String get groupMissing1 => 'Puuttuu 1 asia';

  @override
  String get groupMissing23 => 'Puuttuu 2–3 asiaa';

  @override
  String get groupMore => 'Vaatii ostoksia';

  @override
  String get emptyPantryHint =>
      'Lisää, mitä sinulla on kotona, niin näytän, mitä voit valmistaa.';

  @override
  String get addToPantry => 'Lisää komeroon';

  @override
  String get searchIngredient => 'Mitä sinulla on? (esim. kananmunia, riisiä)';

  @override
  String get pantryEmpty =>
      'Ruokakomerosi on tyhjä. Lisää ensimmäinen raaka-aine.';

  @override
  String get pantryStaplesNote =>
      'Oletan, että sinulla on suolaa, pippuria, öljyä ja muita perustarvikkeita.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n annosta',
      one: '$n annos',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'helppo',
      '2': 'kohtalainen',
      'other': 'vaativampi',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'puuttuu $n',
      one: 'puuttuu $n',
      zero: 'kaikki on',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ainekset';

  @override
  String get steps => 'Valmistus';

  @override
  String get tips => 'Vinkit';

  @override
  String get optional => 'valinnainen';

  @override
  String get toTaste => 'maun mukaan';

  @override
  String get addMissingToShopping => 'Lisää puuttuvat ostoslistalle';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n tuotetta lisätty',
      one: '$n tuote lisätty',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Laita ruokaa';

  @override
  String stepOf(int i, int n) {
    return 'Vaihe $i/$n';
  }

  @override
  String get next => 'Seuraava';

  @override
  String get back => 'Takaisin';

  @override
  String get done => 'Valmis';

  @override
  String startTimer(String t) {
    return 'Käynnistä ajastin $t';
  }

  @override
  String get timerDone => 'Aika loppui!';

  @override
  String get cookedTitle => 'Hyvää ruokahalua!';

  @override
  String get cookedBody =>
      'Ruoka on valmis. Poistetaanko käytetyt ainekset komerosta?';

  @override
  String get removeUsed => 'Poista';

  @override
  String get keep => 'Säilytä';

  @override
  String get shoppingEmpty => 'Ostoslistasi on tyhjä.';

  @override
  String get checkout => 'Ostettu';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n raaka-ainetta on komerossa',
      one: '$n raaka-aine on komerossa',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Reseptien kieli';

  @override
  String get noRecipes => 'Reseptejä valmistellaan vielä.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Tšekkiläinen',
      'italian': 'Italialainen',
      'vietnamese': 'Vietnamilainen',
      'asian': 'Aasialainen',
      'mexmed': 'Meksikolainen ja Välimeren',
      'quick': 'Nopea',
      'family': 'Perheruoka',
      'other': 'Muut',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Vihannekset',
      'ovoce': 'Hedelmät',
      'houby': 'Sienet',
      'cerstve_bylinky': 'Tuoreet yrtit',
      'maso': 'Liha',
      'uzeniny': 'Leikkeleet',
      'ryby': 'Kala',
      'mlecne': 'Maitotuotteet',
      'vejce': 'Munat',
      'rostlinne_bilkoviny': 'Tofu ym.',
      'obiloviny': 'Viljat',
      'mouka': 'Jauhot',
      'testoviny': 'Pasta',
      'pecivo': 'Leipä ja leivonnaiset',
      'lusteniny': 'Palkokasvit',
      'orechy_seminka': 'Pähkinät ja siemenet',
      'susene_plody': 'Kuivatut hedelmät',
      'koreni': 'Mausteet',
      'oleje_tuky': 'Öljyt ja rasvat',
      'ocet_omacky': 'Kastikkeet ja etikka',
      'sladidla': 'Makeuttajat',
      'konzervy': 'Säilykkeet',
      'napoje': 'Juomat',
      'other': 'Muut',
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
      'ks': 'kpl',
      'lzice': 'rkl',
      'lzicka': 'tl',
      'hrnek': 'kuppi',
      'strouzek': 'kynsi',
      'stipka': 'ripaus',
      'plechovka': 'purkki',
      'svazek': 'nippu',
      'hrst': 'kourallinen',
      'platek': 'viipale',
      'dkg': 'dkg',
      'balicek': 'paketti',
      'stonek': 'varsi',
      'snitka': 'oksa',
      'kostka': 'kuutio',
      'hlava': 'kerä',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Keittiöt';

  @override
  String get restorePurchases => 'Palauta ostokset';

  @override
  String get restoreStarted => 'Palautetaan ostoksia…';

  @override
  String get storeUnavailable =>
      'Kauppa ei ole nyt käytettävissä. Yritä myöhemmin uudelleen, kun olet verkossa.';

  @override
  String get storeLoading => 'Ladataan hintoja…';

  @override
  String get unlockedLabel => 'Avattu';

  @override
  String buy(String price) {
    return 'Osta · $price';
  }

  @override
  String get notForSale => 'Ei vielä saatavilla';

  @override
  String get purchasePending => 'Odotetaan vahvistusta…';

  @override
  String purchaseFailed(String msg) {
    return 'Osto epäonnistui: $msg';
  }

  @override
  String get allPacksTitle => 'Kaikki keittiöt';

  @override
  String get allPacksBody =>
      'Avaa kaikki paketit kerralla, edullisemmin kuin yksitellen.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n reseptiä',
      one: '$n resepti',
      zero: 'reseptejä tulossa',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Resepti paketista $pack';
  }

  @override
  String get lockedBody =>
      'Näet ainekset; vaiheet ja kokkaustila avautuvat paketin myötä.';

  @override
  String get unlock => 'Avaa';
}
