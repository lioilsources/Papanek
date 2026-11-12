// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => '何を作る？';

  @override
  String get tabPantry => '食材ストック';

  @override
  String get tabShopping => '買い物';

  @override
  String get groupReady => '今すぐ作れる';

  @override
  String get groupMissing1 => 'あと1つ足りない';

  @override
  String get groupMissing23 => 'あと2〜3つ足りない';

  @override
  String get groupMore => '買い物が必要';

  @override
  String get emptyPantryHint => '家にあるものを追加すると、作れる料理を提案します。';

  @override
  String get addToPantry => 'ストックに追加';

  @override
  String get searchIngredient => '家に何がある？（例：卵、米）';

  @override
  String get pantryEmpty => 'ストックは空です。最初の食材を追加しましょう。';

  @override
  String get pantryStaplesNote => '塩、こしょう、油などの基本の調味料は家にあるものとして扱います。';

  @override
  String minutes(int n) {
    return '$n分';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n人分');
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'かんたん',
      '2': 'ふつう',
      'other': 'やや難しい',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n個足りません',
      zero: '全部そろっています',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => '材料';

  @override
  String get steps => '作り方';

  @override
  String get tips => 'コツ';

  @override
  String get optional => 'お好みで';

  @override
  String get toTaste => '適量';

  @override
  String get addMissingToShopping => '足りないものを買い物リストへ';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n件を追加しました',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => '調理開始';

  @override
  String stepOf(int i, int n) {
    return 'ステップ $i／$n';
  }

  @override
  String get next => '次へ';

  @override
  String get back => '戻る';

  @override
  String get done => '完了';

  @override
  String startTimer(String t) {
    return 'タイマー $t を開始';
  }

  @override
  String get timerDone => '時間です！';

  @override
  String get cookedTitle => 'いただきます！';

  @override
  String get cookedBody => '調理が終わりました。使った食材をストックから削除しますか？';

  @override
  String get removeUsed => '削除';

  @override
  String get keep => '残す';

  @override
  String get shoppingEmpty => '買い物リストは空です。';

  @override
  String get checkout => '購入済み';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n個の食材をストックに追加しました',
    );
    return '$_temp0';
  }

  @override
  String get language => 'レシピの言語';

  @override
  String get noRecipes => 'レシピは準備中です。';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'チェコ料理',
      'italian': 'イタリア料理',
      'vietnamese': 'ベトナム料理',
      'asian': 'アジア料理',
      'mexmed': 'メキシコ・地中海料理',
      'quick': '時短',
      'family': '家庭料理',
      'other': 'その他',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': '野菜',
      'ovoce': '果物',
      'houby': 'きのこ',
      'cerstve_bylinky': '生ハーブ',
      'maso': '肉',
      'uzeniny': '加工肉',
      'ryby': '魚',
      'mlecne': '乳製品',
      'vejce': '卵',
      'rostlinne_bilkoviny': '豆腐など',
      'obiloviny': '穀物',
      'mouka': '小麦粉',
      'testoviny': 'パスタ',
      'pecivo': 'パン・ベーカリー',
      'lusteniny': '豆類',
      'orechy_seminka': 'ナッツ・種子',
      'susene_plody': 'ドライフルーツ',
      'koreni': 'スパイス',
      'oleje_tuky': '油・脂',
      'ocet_omacky': 'ソース・酢',
      'sladidla': '甘味料',
      'konzervy': '缶詰',
      'napoje': '飲み物',
      'other': 'その他',
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
      'ks': '個',
      'lzice': '大さじ',
      'lzicka': '小さじ',
      'hrnek': 'カップ',
      'strouzek': 'かけ',
      'stipka': 'ひとつまみ',
      'plechovka': '缶',
      'svazek': '束',
      'hrst': 'ひとつかみ',
      'platek': '枚',
      'dkg': 'dkg',
      'balicek': 'パック',
      'stonek': '本',
      'snitka': '枝',
      'kostka': 'キューブ',
      'hlava': '玉',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => '料理ジャンル';

  @override
  String get restorePurchases => '購入を復元';

  @override
  String get restoreStarted => '購入を復元しています…';

  @override
  String get storeUnavailable => 'ストアは現在利用できません。オンラインのときにもう一度お試しください。';

  @override
  String get storeLoading => '価格を読み込んでいます…';

  @override
  String get unlockedLabel => '解放済み';

  @override
  String buy(String price) {
    return '購入 · $price';
  }

  @override
  String get notForSale => 'まだ購入できません';

  @override
  String get purchasePending => '確認待ち…';

  @override
  String purchaseFailed(String msg) {
    return '購入できませんでした: $msg';
  }

  @override
  String get allPacksTitle => 'すべての料理ジャンル';

  @override
  String get allPacksBody => 'すべてのパックをまとめて解放。ひとつずつ買うよりお得です。';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n件のレシピ',
      zero: 'レシピ準備中',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return '「$pack」パックのレシピ';
  }

  @override
  String get lockedBody => '材料は見られます。手順と調理モードはパックで解放されます。';

  @override
  String get unlock => '解放する';
}
