// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Masak apa';

  @override
  String get tabPantry => 'Persediaan';

  @override
  String get tabShopping => 'Belanja';

  @override
  String get groupReady => 'Bisa dimasak sekarang';

  @override
  String get groupMissing1 => 'Kurang 1 bahan';

  @override
  String get groupMissing23 => 'Kurang 2–3 bahan';

  @override
  String get groupMore => 'Perlu belanja';

  @override
  String get emptyPantryHint =>
      'Tambahkan bahan yang ada di rumah, lalu saya tunjukkan apa yang bisa dimasak.';

  @override
  String get addToPantry => 'Tambah ke persediaan';

  @override
  String get searchIngredient => 'Apa yang kamu punya? (mis. telur, nasi)';

  @override
  String get pantryEmpty => 'Persediaanmu kosong. Tambahkan bahan pertama.';

  @override
  String get pantryStaplesNote =>
      'Saya anggap kamu punya garam, lada, minyak, dan bahan dasar lainnya.';

  @override
  String minutes(int n) {
    return '$n mnt';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n porsi',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'mudah',
      '2': 'lumayan',
      'other': 'lebih sulit',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'kurang $n',
      zero: 'semua bahan ada',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Bahan';

  @override
  String get steps => 'Langkah';

  @override
  String get tips => 'Tips';

  @override
  String get optional => 'opsional';

  @override
  String get toTaste => 'secukupnya';

  @override
  String get addMissingToShopping => 'Tambah yang kurang ke belanja';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n item ditambahkan',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Masak';

  @override
  String stepOf(int i, int n) {
    return 'Langkah $i dari $n';
  }

  @override
  String get next => 'Berikutnya';

  @override
  String get back => 'Kembali';

  @override
  String get done => 'Selesai';

  @override
  String startTimer(String t) {
    return 'Mulai timer $t';
  }

  @override
  String get timerDone => 'Waktu habis!';

  @override
  String get cookedTitle => 'Selamat makan!';

  @override
  String get cookedBody =>
      'Masakan selesai. Hapus bahan yang terpakai dari persediaan?';

  @override
  String get removeUsed => 'Hapus';

  @override
  String get keep => 'Simpan';

  @override
  String get shoppingEmpty => 'Daftar belanjamu kosong.';

  @override
  String get checkout => 'Sudah dibeli';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n bahan ada di persediaan',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Bahasa resep';

  @override
  String get noRecipes => 'Resep masih disiapkan.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Ceko',
      'italian': 'Italia',
      'vietnamese': 'Vietnam',
      'asian': 'Asia',
      'mexmed': 'Meksiko & Mediterania',
      'quick': 'Cepat',
      'family': 'Keluarga',
      'other': 'Lainnya',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Sayuran',
      'ovoce': 'Buah',
      'houby': 'Jamur',
      'cerstve_bylinky': 'Herba segar',
      'maso': 'Daging',
      'uzeniny': 'Daging olahan',
      'ryby': 'Ikan',
      'mlecne': 'Produk susu',
      'vejce': 'Telur',
      'rostlinne_bilkoviny': 'Tahu & sejenisnya',
      'obiloviny': 'Biji-bijian',
      'mouka': 'Tepung',
      'testoviny': 'Pasta',
      'pecivo': 'Roti & kue',
      'lusteniny': 'Kacang-kacangan',
      'orechy_seminka': 'Kacang & biji',
      'susene_plody': 'Buah kering',
      'koreni': 'Rempah',
      'oleje_tuky': 'Minyak & lemak',
      'ocet_omacky': 'Saus & cuka',
      'sladidla': 'Pemanis',
      'konzervy': 'Makanan kaleng',
      'napoje': 'Minuman',
      'other': 'Lainnya',
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
      'ks': 'buah',
      'lzice': 'sdm',
      'lzicka': 'sdt',
      'hrnek': 'cangkir',
      'strouzek': 'siung',
      'stipka': 'sejumput',
      'plechovka': 'kaleng',
      'svazek': 'ikat',
      'hrst': 'genggam',
      'platek': 'iris',
      'dkg': 'dkg',
      'balicek': 'bungkus',
      'stonek': 'batang',
      'snitka': 'tangkai',
      'kostka': 'kubus',
      'hlava': 'kepala',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }
}
