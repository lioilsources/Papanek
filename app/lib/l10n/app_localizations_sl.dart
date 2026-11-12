// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Kaj bom skuhal';

  @override
  String get tabPantry => 'Shramba';

  @override
  String get tabShopping => 'Nakup';

  @override
  String get groupReady => 'Lahko takoj';

  @override
  String get groupMissing1 => 'Manjka 1 stvar';

  @override
  String get groupMissing23 => 'Manjkajo 2–3 stvari';

  @override
  String get groupMore => 'Treba nakupiti';

  @override
  String get emptyPantryHint =>
      'Dodaj, kar imaš doma, in pokazal ti bom, kaj lahko skuhaš.';

  @override
  String get addToPantry => 'Dodaj v shrambo';

  @override
  String get searchIngredient => 'Kaj imaš doma? (npr. jajca, riž)';

  @override
  String get pantryEmpty => 'Shramba je prazna. Dodaj prvo sestavino.';

  @override
  String get pantryStaplesNote =>
      'Predvidevam, da imaš doma sol, poper, olje in druge osnovna živila.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Porcij: $n',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'enostavno',
      '2': 'izvedljivo',
      'other': 'zahtevnejše',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'manjka: $n',
      zero: 'imaš vse',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Sestavine';

  @override
  String get steps => 'Postopek';

  @override
  String get tips => 'Nasveti';

  @override
  String get optional => 'neobvezno';

  @override
  String get toTaste => 'po okusu';

  @override
  String get addMissingToShopping => 'Dodaj manjkajoče v nakup';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Dodanih postavk: $n',
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
  String get next => 'Naprej';

  @override
  String get back => 'Nazaj';

  @override
  String get done => 'Končano';

  @override
  String startTimer(String t) {
    return 'Zaženi merilnik časa $t';
  }

  @override
  String get timerDone => 'Čas je potekel!';

  @override
  String get cookedTitle => 'Dober tek!';

  @override
  String get cookedBody =>
      'Skuhano je. Odstranim porabljene sestavine iz shrambe?';

  @override
  String get removeUsed => 'Odstrani';

  @override
  String get keep => 'Obdrži';

  @override
  String get shoppingEmpty => 'Nakupovalni seznam je prazen.';

  @override
  String get checkout => 'Kupljeno';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Sestavin v shrambi: $n',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Jezik receptov';

  @override
  String get noRecipes => 'Recepti se še pripravljajo.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Češka',
      'italian': 'Italijanska',
      'vietnamese': 'Vietnamska',
      'asian': 'Azijska',
      'mexmed': 'Mehiška in mediteranska',
      'quick': 'Hitra',
      'family': 'Družinska',
      'other': 'Drugo',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Zelenjava',
      'ovoce': 'Sadje',
      'houby': 'Gobe',
      'cerstve_bylinky': 'Sveža zelišča',
      'maso': 'Meso',
      'uzeniny': 'Mesni izdelki',
      'ryby': 'Ribe',
      'mlecne': 'Mlečni izdelki',
      'vejce': 'Jajca',
      'rostlinne_bilkoviny': 'Tofu in podobno',
      'obiloviny': 'Žita',
      'mouka': 'Moka',
      'testoviny': 'Testenine',
      'pecivo': 'Kruh in pekovsko pecivo',
      'lusteniny': 'Stročnice',
      'orechy_seminka': 'Oreški in semena',
      'susene_plody': 'Suho sadje',
      'koreni': 'Začimbe',
      'oleje_tuky': 'Olja in maščobe',
      'ocet_omacky': 'Omake in kis',
      'sladidla': 'Sladila',
      'konzervy': 'Konzerve',
      'napoje': 'Pijače',
      'other': 'Drugo',
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
      'ks': 'kos',
      'lzice': 'žlica',
      'lzicka': 'žlička',
      'hrnek': 'skodelica',
      'strouzek': 'stroček',
      'stipka': 'ščepec',
      'plechovka': 'pločevinka',
      'svazek': 'šop',
      'hrst': 'pest',
      'platek': 'rezina',
      'dkg': 'dag',
      'balicek': 'paket',
      'stonek': 'steblo',
      'snitka': 'vejica',
      'kostka': 'kocka',
      'hlava': 'glava',
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
