// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Co ugotuję';

  @override
  String get tabPantry => 'Spiżarnia';

  @override
  String get tabShopping => 'Zakupy';

  @override
  String get groupReady => 'Możesz od razu';

  @override
  String get groupMissing1 => 'Brakuje 1 rzeczy';

  @override
  String get groupMissing23 => 'Brakuje 2–3 rzeczy';

  @override
  String get groupMore => 'Trzeba kupić';

  @override
  String get emptyPantryHint =>
      'Dodaj, co masz w domu, a pokażę ci, co możesz ugotować.';

  @override
  String get addToPantry => 'Dodaj do spiżarni';

  @override
  String get searchIngredient => 'Co masz w domu? (np. jajka, ryż)';

  @override
  String get pantryEmpty => 'Spiżarnia jest pusta. Dodaj pierwszy składnik.';

  @override
  String get pantryStaplesNote =>
      'Zakładam, że masz w domu sól, pieprz, olej i inne podstawy.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Porcje: $n',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'łatwe',
      '2': 'do ogarnięcia',
      'other': 'trudniejsze',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'brakuje: $n',
      zero: 'masz wszystko',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Składniki';

  @override
  String get steps => 'Przygotowanie';

  @override
  String get tips => 'Wskazówki';

  @override
  String get optional => 'opcjonalnie';

  @override
  String get toTaste => 'do smaku';

  @override
  String get addMissingToShopping => 'Dodaj brakujące do zakupów';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Dodane pozycje: $n',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Gotuj';

  @override
  String stepOf(int i, int n) {
    return 'Krok $i z $n';
  }

  @override
  String get next => 'Dalej';

  @override
  String get back => 'Wstecz';

  @override
  String get done => 'Gotowe';

  @override
  String startTimer(String t) {
    return 'Włącz minutnik $t';
  }

  @override
  String get timerDone => 'Czas minął!';

  @override
  String get cookedTitle => 'Smacznego!';

  @override
  String get cookedBody => 'Ugotowane. Usunąć zużyte składniki ze spiżarni?';

  @override
  String get removeUsed => 'Usuń';

  @override
  String get keep => 'Zostaw';

  @override
  String get shoppingEmpty => 'Lista zakupów jest pusta.';

  @override
  String get checkout => 'Kupione';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Składniki w spiżarni: $n',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Język przepisów';

  @override
  String get noRecipes => 'Przepisy są jeszcze w przygotowaniu.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Czeska',
      'italian': 'Włoska',
      'vietnamese': 'Wietnamska',
      'asian': 'Azjatycka',
      'mexmed': 'Meksykańska i śródziemnomorska',
      'quick': 'Szybka',
      'family': 'Rodzinna',
      'other': 'Inne',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Warzywa',
      'ovoce': 'Owoce',
      'houby': 'Grzyby',
      'cerstve_bylinky': 'Świeże zioła',
      'maso': 'Mięso',
      'uzeniny': 'Wędliny',
      'ryby': 'Ryby',
      'mlecne': 'Nabiał',
      'vejce': 'Jajka',
      'rostlinne_bilkoviny': 'Tofu i podobne',
      'obiloviny': 'Zboża',
      'mouka': 'Mąka',
      'testoviny': 'Makarony',
      'pecivo': 'Pieczywo',
      'lusteniny': 'Rośliny strączkowe',
      'orechy_seminka': 'Orzechy i nasiona',
      'susene_plody': 'Suszone owoce',
      'koreni': 'Przyprawy',
      'oleje_tuky': 'Oleje i tłuszcze',
      'ocet_omacky': 'Sosy i ocet',
      'sladidla': 'Słodziki',
      'konzervy': 'Konserwy',
      'napoje': 'Napoje',
      'other': 'Inne',
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
      'ks': 'szt.',
      'lzice': 'łyżka',
      'lzicka': 'łyżeczka',
      'hrnek': 'szklanka',
      'strouzek': 'ząbek',
      'stipka': 'szczypta',
      'plechovka': 'puszka',
      'svazek': 'pęczek',
      'hrst': 'garść',
      'platek': 'plasterek',
      'dkg': 'dag',
      'balicek': 'opakowanie',
      'stonek': 'łodyga',
      'snitka': 'gałązka',
      'kostka': 'kostka',
      'hlava': 'główka',
      'oz': 'oz',
      'lb': 'lb',
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
