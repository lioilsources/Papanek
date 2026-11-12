// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'ทำอะไรดี';

  @override
  String get tabPantry => 'คลังวัตถุดิบ';

  @override
  String get tabShopping => 'ซื้อของ';

  @override
  String get groupReady => 'ทำได้เลย';

  @override
  String get groupMissing1 => 'ขาด 1 อย่าง';

  @override
  String get groupMissing23 => 'ขาด 2–3 อย่าง';

  @override
  String get groupMore => 'ต้องซื้อเพิ่ม';

  @override
  String get emptyPantryHint =>
      'เพิ่มของที่มีอยู่ที่บ้าน แล้วฉันจะบอกว่าทำอะไรได้บ้าง';

  @override
  String get addToPantry => 'เพิ่มลงคลัง';

  @override
  String get searchIngredient => 'ที่บ้านมีอะไรบ้าง (เช่น ไข่ ข้าว)';

  @override
  String get pantryEmpty => 'คลังว่างเปล่า เพิ่มวัตถุดิบอย่างแรกเลย';

  @override
  String get pantryStaplesNote =>
      'ฉันถือว่าที่บ้านมีเกลือ พริกไทย น้ำมัน และของใช้พื้นฐานอื่น ๆ อยู่แล้ว';

  @override
  String minutes(int n) {
    return '$n นาที';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ที่',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'ง่าย',
      '2': 'พอทำได้',
      'other': 'ยากขึ้น',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ขาด $n',
      zero: 'มีครบแล้ว',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'วัตถุดิบ';

  @override
  String get steps => 'วิธีทำ';

  @override
  String get tips => 'เคล็ดลับ';

  @override
  String get optional => 'ไม่บังคับ';

  @override
  String get toTaste => 'ตามชอบ';

  @override
  String get addMissingToShopping => 'เพิ่มของที่ขาดลงรายการซื้อ';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'เพิ่ม $n รายการแล้ว',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'เริ่มทำอาหาร';

  @override
  String stepOf(int i, int n) {
    return 'ขั้นตอนที่ $i จาก $n';
  }

  @override
  String get next => 'ถัดไป';

  @override
  String get back => 'ย้อนกลับ';

  @override
  String get done => 'เสร็จแล้ว';

  @override
  String startTimer(String t) {
    return 'เริ่มจับเวลา $t';
  }

  @override
  String get timerDone => 'หมดเวลาแล้ว!';

  @override
  String get cookedTitle => 'ทานให้อร่อยนะ!';

  @override
  String get cookedBody => 'ทำเสร็จแล้ว ลบวัตถุดิบที่ใช้แล้วออกจากคลังไหม';

  @override
  String get removeUsed => 'ลบ';

  @override
  String get keep => 'เก็บไว้';

  @override
  String get shoppingEmpty => 'รายการซื้อของว่างเปล่า';

  @override
  String get checkout => 'ซื้อแล้ว';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'มีวัตถุดิบในคลัง $n อย่าง',
    );
    return '$_temp0';
  }

  @override
  String get language => 'ภาษาของสูตร';

  @override
  String get noRecipes => 'กำลังเตรียมสูตรอาหารอยู่';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'เช็ก',
      'italian': 'อิตาลี',
      'vietnamese': 'เวียดนาม',
      'asian': 'เอเชีย',
      'mexmed': 'เม็กซิกันและเมดิเตอร์เรเนียน',
      'quick': 'ด่วน',
      'family': 'ครอบครัว',
      'other': 'อื่น ๆ',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'ผัก',
      'ovoce': 'ผลไม้',
      'houby': 'เห็ด',
      'cerstve_bylinky': 'สมุนไพรสด',
      'maso': 'เนื้อสัตว์',
      'uzeniny': 'เนื้อแปรรูป',
      'ryby': 'ปลา',
      'mlecne': 'ผลิตภัณฑ์นม',
      'vejce': 'ไข่',
      'rostlinne_bilkoviny': 'เต้าหู้และอื่น ๆ',
      'obiloviny': 'ธัญพืช',
      'mouka': 'แป้ง',
      'testoviny': 'พาสต้า',
      'pecivo': 'ขนมปังและเบเกอรี่',
      'lusteniny': 'ถั่วเมล็ดแห้ง',
      'orechy_seminka': 'ถั่วและเมล็ดพืช',
      'susene_plody': 'ผลไม้แห้ง',
      'koreni': 'เครื่องเทศ',
      'oleje_tuky': 'น้ำมันและไขมัน',
      'ocet_omacky': 'ซอสและน้ำส้มสายชู',
      'sladidla': 'สารให้ความหวาน',
      'konzervy': 'อาหารกระป๋อง',
      'napoje': 'เครื่องดื่ม',
      'other': 'อื่น ๆ',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'ก.',
      'kg': 'กก.',
      'ml': 'มล.',
      'l': 'ล.',
      'dl': 'ดล.',
      'cl': 'ซล.',
      'ks': 'ชิ้น',
      'lzice': 'ช้อนโต๊ะ',
      'lzicka': 'ช้อนชา',
      'hrnek': 'ถ้วย',
      'strouzek': 'กลีบ',
      'stipka': 'หยิบมือ',
      'plechovka': 'กระป๋อง',
      'svazek': 'กำ',
      'hrst': 'กำมือ',
      'platek': 'แผ่น',
      'dkg': 'dkg',
      'balicek': 'ห่อ',
      'stonek': 'ก้าน',
      'snitka': 'ก้านเล็ก',
      'kostka': 'ก้อน',
      'hlava': 'หัว',
      'oz': 'ออนซ์',
      'lb': 'ปอนด์',
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
