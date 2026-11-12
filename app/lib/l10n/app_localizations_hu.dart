// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Mit főzzek';

  @override
  String get tabPantry => 'Éléskamra';

  @override
  String get tabShopping => 'Bevásárlás';

  @override
  String get groupReady => 'Azonnal elkészíthető';

  @override
  String get groupMissing1 => '1 dolog hiányzik';

  @override
  String get groupMissing23 => '2–3 dolog hiányzik';

  @override
  String get groupMore => 'Vásárolni kell';

  @override
  String get emptyPantryHint =>
      'Add hozzá, amid otthon van, és megmutatom, mit főzhetsz belőle.';

  @override
  String get addToPantry => 'Hozzáadás az éléskamrához';

  @override
  String get searchIngredient => 'Mid van? (pl. tojás, rizs)';

  @override
  String get pantryEmpty => 'Az éléskamra üres. Add hozzá az első hozzávalót.';

  @override
  String get pantryStaplesNote =>
      'Feltételezem, hogy van otthon sód, borsod, olajad és más alapanyagod.';

  @override
  String minutes(int n) {
    return '$n perc';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n adag',
      one: '$n adag',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'könnyű',
      '2': 'megvalósítható',
      'other': 'nehezebb',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n hiányzik',
      one: '$n hiányzik',
      zero: 'mindened megvan',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Hozzávalók';

  @override
  String get steps => 'Elkészítés';

  @override
  String get tips => 'Tippek';

  @override
  String get optional => 'elhagyható';

  @override
  String get toTaste => 'ízlés szerint';

  @override
  String get addMissingToShopping => 'Hiányzók a bevásárlólistára';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n tétel hozzáadva',
      one: '$n tétel hozzáadva',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Főzés';

  @override
  String stepOf(int i, int n) {
    return '$i. lépés / $n';
  }

  @override
  String get next => 'Tovább';

  @override
  String get back => 'Vissza';

  @override
  String get done => 'Kész';

  @override
  String startTimer(String t) {
    return 'Időzítő indítása: $t';
  }

  @override
  String get timerDone => 'Lejárt az idő!';

  @override
  String get cookedTitle => 'Jó étvágyat!';

  @override
  String get cookedBody =>
      'Elkészült. Eltávolítod a felhasznált hozzávalókat az éléskamrából?';

  @override
  String get removeUsed => 'Eltávolítás';

  @override
  String get keep => 'Megtartás';

  @override
  String get shoppingEmpty => 'A bevásárlólista üres.';

  @override
  String get checkout => 'Megvettem';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n hozzávaló az éléskamrában van',
      one: '$n hozzávaló az éléskamrában van',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Receptek nyelve';

  @override
  String get noRecipes => 'A receptek még készülnek.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Cseh',
      'italian': 'Olasz',
      'vietnamese': 'Vietnami',
      'asian': 'Ázsiai',
      'mexmed': 'Mexikói és mediterrán',
      'quick': 'Gyors',
      'family': 'Családi',
      'other': 'Egyéb',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Zöldségek',
      'ovoce': 'Gyümölcsök',
      'houby': 'Gombák',
      'cerstve_bylinky': 'Friss fűszernövények',
      'maso': 'Hús',
      'uzeniny': 'Felvágottak',
      'ryby': 'Hal',
      'mlecne': 'Tejtermékek',
      'vejce': 'Tojás',
      'rostlinne_bilkoviny': 'Tofu és hasonlók',
      'obiloviny': 'Gabonafélék',
      'mouka': 'Liszt',
      'testoviny': 'Tészta',
      'pecivo': 'Pékáru',
      'lusteniny': 'Hüvelyesek',
      'orechy_seminka': 'Magvak és diófélék',
      'susene_plody': 'Szárított gyümölcsök',
      'koreni': 'Fűszerek',
      'oleje_tuky': 'Olajok és zsírok',
      'ocet_omacky': 'Szószok és ecet',
      'sladidla': 'Édesítőszerek',
      'konzervy': 'Konzervek',
      'napoje': 'Italok',
      'other': 'Egyéb',
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
      'ks': 'db',
      'lzice': 'ek',
      'lzicka': 'tk',
      'hrnek': 'bögre',
      'strouzek': 'gerezd',
      'stipka': 'csipet',
      'plechovka': 'doboz',
      'svazek': 'csokor',
      'hrst': 'marék',
      'platek': 'szelet',
      'dkg': 'dkg',
      'balicek': 'csomag',
      'stonek': 'szár',
      'snitka': 'szál',
      'kostka': 'kocka',
      'hlava': 'fej',
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
