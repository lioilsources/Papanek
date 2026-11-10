// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'কী রাঁধব';

  @override
  String get tabPantry => 'ভাঁড়ার';

  @override
  String get tabShopping => 'কেনাকাটা';

  @override
  String get groupReady => 'এখনই রান্না করা যায়';

  @override
  String get groupMissing1 => '১টি জিনিস কম';

  @override
  String get groupMissing23 => '২–৩টি জিনিস কম';

  @override
  String get groupMore => 'কেনাকাটা দরকার';

  @override
  String get emptyPantryHint =>
      'বাড়িতে যা আছে তা যোগ করুন, আমি দেখাব কী রান্না করতে পারবেন।';

  @override
  String get addToPantry => 'ভাঁড়ারে যোগ করুন';

  @override
  String get searchIngredient => 'বাড়িতে কী আছে? (যেমন ডিম, চাল)';

  @override
  String get pantryEmpty => 'ভাঁড়ার খালি। প্রথম উপকরণটি যোগ করুন।';

  @override
  String get pantryStaplesNote =>
      'ধরে নিচ্ছি আপনার কাছে লবণ, গোলমরিচ, তেল ও অন্যান্য মৌলিক উপকরণ আছে।';

  @override
  String minutes(int n) {
    return '$n মি.';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n জনের পরিবেশন',
      one: '$n জনের পরিবেশন',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'সহজ',
      '2': 'মাঝারি',
      'other': 'কঠিন',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nটি কম',
      one: '$nটি কম',
      zero: 'সবকিছু আছে',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'উপকরণ';

  @override
  String get steps => 'প্রণালী';

  @override
  String get tips => 'পরামর্শ';

  @override
  String get optional => 'ঐচ্ছিক';

  @override
  String get toTaste => 'স্বাদমতো';

  @override
  String get addMissingToShopping => 'যা নেই তা কেনাকাটায় যোগ করুন';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nটি আইটেম যোগ হয়েছে',
      one: '$nটি আইটেম যোগ হয়েছে',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'রান্না শুরু';

  @override
  String stepOf(int i, int n) {
    return 'ধাপ $i/$n';
  }

  @override
  String get next => 'পরবর্তী';

  @override
  String get back => 'পেছনে';

  @override
  String get done => 'শেষ';

  @override
  String startTimer(String t) {
    return 'টাইমার চালু করুন $t';
  }

  @override
  String get timerDone => 'সময় শেষ!';

  @override
  String get cookedTitle => 'ভালো লাগুক!';

  @override
  String get cookedBody =>
      'রান্না শেষ। ব্যবহৃত উপকরণ ভাঁড়ার থেকে সরিয়ে ফেলবেন?';

  @override
  String get removeUsed => 'সরান';

  @override
  String get keep => 'রাখুন';

  @override
  String get shoppingEmpty => 'কেনাকাটার তালিকা খালি।';

  @override
  String get checkout => 'কেনা হয়েছে';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nটি উপকরণ ভাঁড়ারে আছে',
      one: '$nটি উপকরণ ভাঁড়ারে আছে',
    );
    return '$_temp0';
  }

  @override
  String get language => 'রেসিপির ভাষা';

  @override
  String get noRecipes => 'রেসিপি এখনও তৈরি হচ্ছে।';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'চেক',
      'italian': 'ইতালীয়',
      'vietnamese': 'ভিয়েতনামী',
      'asian': 'এশীয়',
      'mexmed': 'মেক্সিকান ও ভূমধ্যসাগরীয়',
      'quick': 'দ্রুত',
      'family': 'পারিবারিক',
      'other': 'অন্যান্য',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'সবজি',
      'ovoce': 'ফল',
      'houby': 'মাশরুম',
      'cerstve_bylinky': 'তাজা ভেষজ',
      'maso': 'মাংস',
      'uzeniny': 'প্রক্রিয়াজাত মাংস',
      'ryby': 'মাছ',
      'mlecne': 'দুগ্ধজাত',
      'vejce': 'ডিম',
      'rostlinne_bilkoviny': 'টোফু ইত্যাদি',
      'obiloviny': 'শস্য',
      'mouka': 'ময়দা',
      'testoviny': 'পাস্তা',
      'pecivo': 'রুটি-পেস্ট্রি',
      'lusteniny': 'ডাল-মটর',
      'orechy_seminka': 'বাদাম ও বীজ',
      'susene_plody': 'শুকনো ফল',
      'koreni': 'মসলা',
      'oleje_tuky': 'তেল ও চর্বি',
      'ocet_omacky': 'সস ও ভিনেগার',
      'sladidla': 'মিষ্টি',
      'konzervy': 'টিনজাত',
      'napoje': 'পানীয়',
      'other': 'অন্যান্য',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'গ্রা',
      'kg': 'কেজি',
      'ml': 'মিলি',
      'l': 'লি',
      'dl': 'ডেসিলি',
      'cl': 'সেন্টিলি',
      'ks': 'টি',
      'lzice': 'টেবিল চামচ',
      'lzicka': 'চা চামচ',
      'hrnek': 'কাপ',
      'strouzek': 'কোয়া',
      'stipka': 'চিমটি',
      'plechovka': 'কৌটা',
      'svazek': 'আঁটি',
      'hrst': 'মুঠো',
      'platek': 'টুকরো',
      'dkg': 'ডেকাগ্রাম',
      'balicek': 'প্যাকেট',
      'stonek': 'ডাঁটা',
      'snitka': 'ডাল',
      'kostka': 'কিউব',
      'hlava': 'মাথা',
      'oz': 'আউন্স',
      'lb': 'পাউন্ড',
      'other': '',
    });
    return '$_temp0';
  }
}
