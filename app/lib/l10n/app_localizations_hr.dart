// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Što kuhati';

  @override
  String get tabPantry => 'Smočnica';

  @override
  String get tabShopping => 'Kupnja';

  @override
  String get groupReady => 'Možeš odmah';

  @override
  String get groupMissing1 => 'Nedostaje 1 stvar';

  @override
  String get groupMissing23 => 'Nedostaju 2–3 stvari';

  @override
  String get groupMore => 'Treba kupiti';

  @override
  String get emptyPantryHint =>
      'Dodaj što imaš kod kuće, a ja ću ti pokazati što možeš skuhati.';

  @override
  String get addToPantry => 'Dodaj u smočnicu';

  @override
  String get searchIngredient => 'Što imaš? (npr. jaja, riža)';

  @override
  String get pantryEmpty => 'Smočnica je prazna. Dodaj prvi sastojak.';

  @override
  String get pantryStaplesNote =>
      'Pretpostavljam da kod kuće imaš sol, papar, ulje i druge osnovne namirnice.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Porcija: $n',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'lako',
      '2': 'izvedivo',
      'other': 'zahtjevnije',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'nedostaje: $n',
      zero: 'imaš sve',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Sastojci';

  @override
  String get steps => 'Postupak';

  @override
  String get tips => 'Savjeti';

  @override
  String get optional => 'neobavezno';

  @override
  String get toTaste => 'po ukusu';

  @override
  String get addMissingToShopping => 'Dodaj nedostajuće u kupnju';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Dodano stavki: $n',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Kuhaj';

  @override
  String stepOf(int i, int n) {
    return 'Korak $i od $n';
  }

  @override
  String get next => 'Dalje';

  @override
  String get back => 'Natrag';

  @override
  String get done => 'Gotovo';

  @override
  String startTimer(String t) {
    return 'Pokreni mjerač vremena $t';
  }

  @override
  String get timerDone => 'Vrijeme je isteklo!';

  @override
  String get cookedTitle => 'Dobar tek!';

  @override
  String get cookedBody =>
      'Skuhano je. Ukloniti upotrijebljene sastojke iz smočnice?';

  @override
  String get removeUsed => 'Ukloni';

  @override
  String get keep => 'Zadrži';

  @override
  String get shoppingEmpty => 'Popis za kupnju je prazan.';

  @override
  String get checkout => 'Kupljeno';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Sastojaka u smočnici: $n',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Jezik recepata';

  @override
  String get noRecipes => 'Recepti se još pripremaju.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Češka',
      'italian': 'Talijanska',
      'vietnamese': 'Vijetnamska',
      'asian': 'Azijska',
      'mexmed': 'Meksička i mediteranska',
      'quick': 'Brza',
      'family': 'Obiteljska',
      'other': 'Ostalo',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Povrće',
      'ovoce': 'Voće',
      'houby': 'Gljive',
      'cerstve_bylinky': 'Svježe začinsko bilje',
      'maso': 'Meso',
      'uzeniny': 'Suhomesnati proizvodi',
      'ryby': 'Riba',
      'mlecne': 'Mliječni proizvodi',
      'vejce': 'Jaja',
      'rostlinne_bilkoviny': 'Tofu i slično',
      'obiloviny': 'Žitarice',
      'mouka': 'Brašno',
      'testoviny': 'Tjestenina',
      'pecivo': 'Kruh i pekarski proizvodi',
      'lusteniny': 'Mahunarke',
      'orechy_seminka': 'Orašasti plodovi i sjemenke',
      'susene_plody': 'Sušeno voće',
      'koreni': 'Začini',
      'oleje_tuky': 'Ulja i masti',
      'ocet_omacky': 'Umaci i ocat',
      'sladidla': 'Zaslađivači',
      'konzervy': 'Konzerve',
      'napoje': 'Pića',
      'other': 'Ostalo',
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
      'ks': 'kom',
      'lzice': 'žlica',
      'lzicka': 'žličica',
      'hrnek': 'šalica',
      'strouzek': 'režanj',
      'stipka': 'prstohvat',
      'plechovka': 'konzerva',
      'svazek': 'vezica',
      'hrst': 'šaka',
      'platek': 'kriška',
      'dkg': 'dag',
      'balicek': 'paketić',
      'stonek': 'stabljika',
      'snitka': 'grančica',
      'kostka': 'kockica',
      'hlava': 'glavica',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Kuhinje';

  @override
  String get restorePurchases => 'Vrati kupnje';

  @override
  String get restoreStarted => 'Vraćanje kupnji…';

  @override
  String get storeUnavailable =>
      'Trgovina trenutačno nije dostupna. Pokušaj kasnije kad budeš na mreži.';

  @override
  String get storeLoading => 'Učitavanje cijena…';

  @override
  String get unlockedLabel => 'Otključano';

  @override
  String buy(String price) {
    return 'Kupi · $price';
  }

  @override
  String get notForSale => 'Još nije dostupno';

  @override
  String get purchasePending => 'Čeka se potvrda…';

  @override
  String purchaseFailed(String msg) {
    return 'Kupnja nije uspjela: $msg';
  }

  @override
  String get allPacksTitle => 'Sve kuhinje';

  @override
  String get allPacksBody =>
      'Otključava sve pakete odjednom, povoljnije nego jedan po jedan.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n recepata',
      few: '$n recepta',
      one: '$n recept',
      zero: 'recepti u pripremi',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Recept iz paketa $pack';
  }

  @override
  String get lockedBody =>
      'Sastojke već vidiš; koraci i način kuhanja otključavaju se s paketom.';

  @override
  String get unlock => 'Otključaj';
}
