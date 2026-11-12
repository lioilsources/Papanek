// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Ne pişirsem';

  @override
  String get tabPantry => 'Kiler';

  @override
  String get tabShopping => 'Alışveriş';

  @override
  String get groupReady => 'Hemen yapılabilir';

  @override
  String get groupMissing1 => '1 şey eksik';

  @override
  String get groupMissing23 => '2–3 şey eksik';

  @override
  String get groupMore => 'Alışveriş gerekli';

  @override
  String get emptyPantryHint =>
      'Evde olanları ekle, ne pişirebileceğini göstereyim.';

  @override
  String get addToPantry => 'Kilere ekle';

  @override
  String get searchIngredient => 'Evde ne var? (örn. yumurta, pirinç)';

  @override
  String get pantryEmpty => 'Kilerin boş. İlk malzemeni ekle.';

  @override
  String get pantryStaplesNote =>
      'Evde tuz, karabiber, yağ ve diğer temel malzemelerin olduğunu varsayıyorum.';

  @override
  String minutes(int n) {
    return '$n dk';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n porsiyon',
      one: '$n porsiyon',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'kolay',
      '2': 'orta',
      'other': 'daha zor',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n eksik',
      zero: 'hepsi var',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Malzemeler';

  @override
  String get steps => 'Yapılışı';

  @override
  String get tips => 'İpuçları';

  @override
  String get optional => 'isteğe bağlı';

  @override
  String get toTaste => 'damak tadına göre';

  @override
  String get addMissingToShopping => 'Eksikleri alışverişe ekle';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ürün eklendi',
      one: '$n ürün eklendi',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Pişir';

  @override
  String stepOf(int i, int n) {
    return 'Adım $i / $n';
  }

  @override
  String get next => 'İleri';

  @override
  String get back => 'Geri';

  @override
  String get done => 'Bitti';

  @override
  String startTimer(String t) {
    return 'Zamanlayıcıyı başlat $t';
  }

  @override
  String get timerDone => 'Süre doldu!';

  @override
  String get cookedTitle => 'Afiyet olsun!';

  @override
  String get cookedBody =>
      'Yemek hazır. Kullanılan malzemeler kilerden çıkarılsın mı?';

  @override
  String get removeUsed => 'Çıkar';

  @override
  String get keep => 'Kalsın';

  @override
  String get shoppingEmpty => 'Alışveriş listen boş.';

  @override
  String get checkout => 'Satın alındı';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n malzeme kilerde',
      one: '$n malzeme kilerde',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Tarif dili';

  @override
  String get noRecipes => 'Tarifler hâlâ hazırlanıyor.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Çek',
      'italian': 'İtalyan',
      'vietnamese': 'Vietnam',
      'asian': 'Asya',
      'mexmed': 'Meksika ve Akdeniz',
      'quick': 'Hızlı',
      'family': 'Aile',
      'other': 'Diğer',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Sebzeler',
      'ovoce': 'Meyveler',
      'houby': 'Mantarlar',
      'cerstve_bylinky': 'Taze otlar',
      'maso': 'Et',
      'uzeniny': 'Şarküteri',
      'ryby': 'Balık',
      'mlecne': 'Süt ürünleri',
      'vejce': 'Yumurta',
      'rostlinne_bilkoviny': 'Tofu ve benzerleri',
      'obiloviny': 'Tahıllar',
      'mouka': 'Un',
      'testoviny': 'Makarna',
      'pecivo': 'Ekmek ve unlu mamuller',
      'lusteniny': 'Baklagiller',
      'orechy_seminka': 'Kuruyemiş ve tohumlar',
      'susene_plody': 'Kuru meyve',
      'koreni': 'Baharatlar',
      'oleje_tuky': 'Yağlar',
      'ocet_omacky': 'Soslar ve sirke',
      'sladidla': 'Tatlandırıcılar',
      'konzervy': 'Konserveler',
      'napoje': 'İçecekler',
      'other': 'Diğer',
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
      'ks': 'adet',
      'lzice': 'yemek kaşığı',
      'lzicka': 'tatlı kaşığı',
      'hrnek': 'su bardağı',
      'strouzek': 'diş',
      'stipka': 'tutam',
      'plechovka': 'kutu',
      'svazek': 'demet',
      'hrst': 'avuç',
      'platek': 'dilim',
      'dkg': 'dag',
      'balicek': 'paket',
      'stonek': 'sap',
      'snitka': 'dal',
      'kostka': 'küp',
      'hlava': 'baş',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Mutfaklar';

  @override
  String get restorePurchases => 'Satın alımları geri yükle';

  @override
  String get restoreStarted => 'Satın alımlar geri yükleniyor…';

  @override
  String get storeUnavailable =>
      'Mağaza şu anda kullanılamıyor. Çevrimiçi olduğunda tekrar dene.';

  @override
  String get storeLoading => 'Fiyatlar yükleniyor…';

  @override
  String get unlockedLabel => 'Kilidi açıldı';

  @override
  String buy(String price) {
    return 'Satın al · $price';
  }

  @override
  String get notForSale => 'Henüz satışta değil';

  @override
  String get purchasePending => 'Onay bekleniyor…';

  @override
  String purchaseFailed(String msg) {
    return 'Satın alma başarısız: $msg';
  }

  @override
  String get allPacksTitle => 'Tüm mutfaklar';

  @override
  String get allPacksBody =>
      'Tüm paketlerin kilidini tek seferde açar, tek tek almaktan daha ucuz.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n tarif',
      one: '$n tarif',
      zero: 'tarifler hazırlanıyor',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return '$pack paketinden tarif';
  }

  @override
  String get lockedBody =>
      'Malzemeleri görebilirsin; adımlar ve pişirme modu paketle açılır.';

  @override
  String get unlock => 'Kilidi aç';
}
