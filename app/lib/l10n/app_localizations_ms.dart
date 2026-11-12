// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Masak apa';

  @override
  String get tabPantry => 'Stor dapur';

  @override
  String get tabShopping => 'Membeli-belah';

  @override
  String get groupReady => 'Boleh dimasak sekarang';

  @override
  String get groupMissing1 => 'Kurang 1 bahan';

  @override
  String get groupMissing23 => 'Kurang 2–3 bahan';

  @override
  String get groupMore => 'Perlu membeli-belah';

  @override
  String get emptyPantryHint =>
      'Tambah apa yang ada di rumah dan saya akan tunjukkan apa yang boleh dimasak.';

  @override
  String get addToPantry => 'Tambah ke stor';

  @override
  String get searchIngredient => 'Apa yang anda ada? (cth. telur, nasi)';

  @override
  String get pantryEmpty => 'Stor anda kosong. Tambah bahan pertama.';

  @override
  String get pantryStaplesNote =>
      'Saya anggap anda ada garam, lada, minyak dan bahan asas lain.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n hidangan',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'mudah',
      '2': 'sederhana',
      'other': 'lebih sukar',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'kurang $n',
      zero: 'semua ada',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Bahan-bahan';

  @override
  String get steps => 'Langkah';

  @override
  String get tips => 'Petua';

  @override
  String get optional => 'pilihan';

  @override
  String get toTaste => 'secukup rasa';

  @override
  String get addMissingToShopping => 'Tambah yang kurang ke senarai beli-belah';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n item ditambah',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Masak';

  @override
  String stepOf(int i, int n) {
    return 'Langkah $i daripada $n';
  }

  @override
  String get next => 'Seterusnya';

  @override
  String get back => 'Kembali';

  @override
  String get done => 'Selesai';

  @override
  String startTimer(String t) {
    return 'Mulakan pemasa $t';
  }

  @override
  String get timerDone => 'Masa tamat!';

  @override
  String get cookedTitle => 'Selamat menjamu selera!';

  @override
  String get cookedBody =>
      'Siap dimasak. Buang bahan yang telah digunakan daripada stor?';

  @override
  String get removeUsed => 'Buang';

  @override
  String get keep => 'Simpan';

  @override
  String get shoppingEmpty => 'Senarai beli-belah anda kosong.';

  @override
  String get checkout => 'Sudah dibeli';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n bahan ada dalam stor',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Bahasa resipi';

  @override
  String get noRecipes => 'Resipi masih disediakan.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Czech',
      'italian': 'Itali',
      'vietnamese': 'Vietnam',
      'asian': 'Asia',
      'mexmed': 'Mexico & Mediterranean',
      'quick': 'Pantas',
      'family': 'Keluarga',
      'other': 'Lain-lain',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Sayur-sayuran',
      'ovoce': 'Buah-buahan',
      'houby': 'Cendawan',
      'cerstve_bylinky': 'Herba segar',
      'maso': 'Daging',
      'uzeniny': 'Daging proses',
      'ryby': 'Ikan',
      'mlecne': 'Produk tenusu',
      'vejce': 'Telur',
      'rostlinne_bilkoviny': 'Tauhu & seumpamanya',
      'obiloviny': 'Bijirin',
      'mouka': 'Tepung',
      'testoviny': 'Pasta',
      'pecivo': 'Roti & pastri',
      'lusteniny': 'Kekacang',
      'orechy_seminka': 'Kacang & biji',
      'susene_plody': 'Buah kering',
      'koreni': 'Rempah',
      'oleje_tuky': 'Minyak & lemak',
      'ocet_omacky': 'Sos & cuka',
      'sladidla': 'Pemanis',
      'konzervy': 'Makanan dalam tin',
      'napoje': 'Minuman',
      'other': 'Lain-lain',
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
      'ks': 'biji',
      'lzice': 'sudu besar',
      'lzicka': 'sudu teh',
      'hrnek': 'cawan',
      'strouzek': 'ulas',
      'stipka': 'secubit',
      'plechovka': 'tin',
      'svazek': 'ikat',
      'hrst': 'segenggam',
      'platek': 'keping',
      'dkg': 'dkg',
      'balicek': 'bungkus',
      'stonek': 'batang',
      'snitka': 'tangkai',
      'kostka': 'kiub',
      'hlava': 'kepala',
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
