// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => '做什么菜';

  @override
  String get tabPantry => '食材库';

  @override
  String get tabShopping => '购物';

  @override
  String get groupReady => '现在就能做';

  @override
  String get groupMissing1 => '缺 1 样';

  @override
  String get groupMissing23 => '缺 2–3 样';

  @override
  String get groupMore => '需要采购';

  @override
  String get emptyPantryHint => '添加你家里有的食材，我来告诉你能做什么菜。';

  @override
  String get addToPantry => '加入食材库';

  @override
  String get searchIngredient => '家里有什么？（例如：鸡蛋、大米）';

  @override
  String get pantryEmpty => '食材库是空的。添加第一样食材吧。';

  @override
  String get pantryStaplesNote => '我默认你家里有盐、胡椒、油等基本调料。';

  @override
  String minutes(int n) {
    return '$n 分钟';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n 人份',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': '简单',
      '2': '适中',
      'other': '较难',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '缺 $n 样',
      zero: '食材齐全',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => '食材';

  @override
  String get steps => '做法';

  @override
  String get tips => '小贴士';

  @override
  String get optional => '可选';

  @override
  String get toTaste => '适量';

  @override
  String get addMissingToShopping => '把缺少的加入购物清单';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '已添加 $n 项',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => '开始烹饪';

  @override
  String stepOf(int i, int n) {
    return '第 $i 步，共 $n 步';
  }

  @override
  String get next => '下一步';

  @override
  String get back => '返回';

  @override
  String get done => '完成';

  @override
  String startTimer(String t) {
    return '开始计时 $t';
  }

  @override
  String get timerDone => '时间到！';

  @override
  String get cookedTitle => '祝你好胃口！';

  @override
  String get cookedBody => '做好了。要从食材库中移除用掉的食材吗？';

  @override
  String get removeUsed => '移除';

  @override
  String get keep => '保留';

  @override
  String get shoppingEmpty => '购物清单是空的。';

  @override
  String get checkout => '已购买';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '已有 $n 样食材放入食材库',
    );
    return '$_temp0';
  }

  @override
  String get language => '菜谱语言';

  @override
  String get noRecipes => '菜谱还在准备中。';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': '捷克菜',
      'italian': '意大利菜',
      'vietnamese': '越南菜',
      'asian': '亚洲菜',
      'mexmed': '墨西哥与地中海菜',
      'quick': '快手菜',
      'family': '家常菜',
      'other': '其他',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': '蔬菜',
      'ovoce': '水果',
      'houby': '蘑菇',
      'cerstve_bylinky': '新鲜香草',
      'maso': '肉类',
      'uzeniny': '肉制品',
      'ryby': '鱼类',
      'mlecne': '乳制品',
      'vejce': '蛋类',
      'rostlinne_bilkoviny': '豆腐等',
      'obiloviny': '谷物',
      'mouka': '面粉',
      'testoviny': '意面',
      'pecivo': '面包糕点',
      'lusteniny': '豆类',
      'orechy_seminka': '坚果和种子',
      'susene_plody': '果干',
      'koreni': '香料',
      'oleje_tuky': '油脂',
      'ocet_omacky': '酱料和醋',
      'sladidla': '甜味剂',
      'konzervy': '罐头',
      'napoje': '饮料',
      'other': '其他',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': '克',
      'kg': '千克',
      'ml': '毫升',
      'l': '升',
      'dl': '分升',
      'cl': '厘升',
      'ks': '个',
      'lzice': '汤匙',
      'lzicka': '茶匙',
      'hrnek': '杯',
      'strouzek': '瓣',
      'stipka': '撮',
      'plechovka': '罐',
      'svazek': '把',
      'hrst': '小把',
      'platek': '片',
      'dkg': 'dkg',
      'balicek': '包',
      'stonek': '根',
      'snitka': '枝',
      'kostka': '块',
      'hlava': '颗',
      'oz': '盎司',
      'lb': '磅',
      'other': '',
    });
    return '$_temp0';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => '做什么菜';

  @override
  String get tabPantry => '食材库';

  @override
  String get tabShopping => '购物';

  @override
  String get groupReady => '现在就能做';

  @override
  String get groupMissing1 => '缺 1 样';

  @override
  String get groupMissing23 => '缺 2–3 样';

  @override
  String get groupMore => '需要采购';

  @override
  String get emptyPantryHint => '添加你家里有的食材，我来告诉你能做什么菜。';

  @override
  String get addToPantry => '加入食材库';

  @override
  String get searchIngredient => '家里有什么？（例如：鸡蛋、大米）';

  @override
  String get pantryEmpty => '食材库是空的。添加第一样食材吧。';

  @override
  String get pantryStaplesNote => '我默认你家里有盐、胡椒、油等基本调料。';

  @override
  String minutes(int n) {
    return '$n 分钟';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n 人份',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': '简单',
      '2': '适中',
      'other': '较难',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '缺 $n 样',
      zero: '食材齐全',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => '食材';

  @override
  String get steps => '做法';

  @override
  String get tips => '小贴士';

  @override
  String get optional => '可选';

  @override
  String get toTaste => '适量';

  @override
  String get addMissingToShopping => '把缺少的加入购物清单';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '已添加 $n 项',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => '开始烹饪';

  @override
  String stepOf(int i, int n) {
    return '第 $i 步，共 $n 步';
  }

  @override
  String get next => '下一步';

  @override
  String get back => '返回';

  @override
  String get done => '完成';

  @override
  String startTimer(String t) {
    return '开始计时 $t';
  }

  @override
  String get timerDone => '时间到！';

  @override
  String get cookedTitle => '祝你好胃口！';

  @override
  String get cookedBody => '做好了。要从食材库中移除用掉的食材吗？';

  @override
  String get removeUsed => '移除';

  @override
  String get keep => '保留';

  @override
  String get shoppingEmpty => '购物清单是空的。';

  @override
  String get checkout => '已购买';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '已有 $n 样食材放入食材库',
    );
    return '$_temp0';
  }

  @override
  String get language => '菜谱语言';

  @override
  String get noRecipes => '菜谱还在准备中。';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': '捷克菜',
      'italian': '意大利菜',
      'vietnamese': '越南菜',
      'asian': '亚洲菜',
      'mexmed': '墨西哥与地中海菜',
      'quick': '快手菜',
      'family': '家常菜',
      'other': '其他',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': '蔬菜',
      'ovoce': '水果',
      'houby': '蘑菇',
      'cerstve_bylinky': '新鲜香草',
      'maso': '肉类',
      'uzeniny': '肉制品',
      'ryby': '鱼类',
      'mlecne': '乳制品',
      'vejce': '蛋类',
      'rostlinne_bilkoviny': '豆腐等',
      'obiloviny': '谷物',
      'mouka': '面粉',
      'testoviny': '意面',
      'pecivo': '面包糕点',
      'lusteniny': '豆类',
      'orechy_seminka': '坚果和种子',
      'susene_plody': '果干',
      'koreni': '香料',
      'oleje_tuky': '油脂',
      'ocet_omacky': '酱料和醋',
      'sladidla': '甜味剂',
      'konzervy': '罐头',
      'napoje': '饮料',
      'other': '其他',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': '克',
      'kg': '千克',
      'ml': '毫升',
      'l': '升',
      'dl': '分升',
      'cl': '厘升',
      'ks': '个',
      'lzice': '汤匙',
      'lzicka': '茶匙',
      'hrnek': '杯',
      'strouzek': '瓣',
      'stipka': '撮',
      'plechovka': '罐',
      'svazek': '把',
      'hrst': '小把',
      'platek': '片',
      'dkg': 'dkg',
      'balicek': '包',
      'stonek': '根',
      'snitka': '枝',
      'kostka': '块',
      'hlava': '颗',
      'oz': '盎司',
      'lb': '磅',
      'other': '',
    });
    return '$_temp0';
  }
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => '煮什麼';

  @override
  String get tabPantry => '食材庫';

  @override
  String get tabShopping => '購物';

  @override
  String get groupReady => '現在就能做';

  @override
  String get groupMissing1 => '缺 1 樣';

  @override
  String get groupMissing23 => '缺 2–3 樣';

  @override
  String get groupMore => '需要採購';

  @override
  String get emptyPantryHint => '加入你家裡有的食材，我來告訴你能做什麼菜。';

  @override
  String get addToPantry => '加入食材庫';

  @override
  String get searchIngredient => '家裡有什麼？（例如：雞蛋、白米）';

  @override
  String get pantryEmpty => '食材庫是空的。加入第一樣食材吧。';

  @override
  String get pantryStaplesNote => '我預設你家裡有鹽、胡椒、油等基本調味料。';

  @override
  String minutes(int n) {
    return '$n 分鐘';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n 人份',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': '簡單',
      '2': '適中',
      'other': '較難',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '缺 $n 樣',
      zero: '食材齊全',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => '食材';

  @override
  String get steps => '作法';

  @override
  String get tips => '小秘訣';

  @override
  String get optional => '可選';

  @override
  String get toTaste => '適量';

  @override
  String get addMissingToShopping => '把缺少的加入購物清單';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '已新增 $n 項',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => '開始烹飪';

  @override
  String stepOf(int i, int n) {
    return '第 $i 步，共 $n 步';
  }

  @override
  String get next => '下一步';

  @override
  String get back => '返回';

  @override
  String get done => '完成';

  @override
  String startTimer(String t) {
    return '開始計時 $t';
  }

  @override
  String get timerDone => '時間到！';

  @override
  String get cookedTitle => '祝你好胃口！';

  @override
  String get cookedBody => '煮好了。要從食材庫中移除用掉的食材嗎？';

  @override
  String get removeUsed => '移除';

  @override
  String get keep => '保留';

  @override
  String get shoppingEmpty => '購物清單是空的。';

  @override
  String get checkout => '已購買';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '已有 $n 樣食材放入食材庫',
    );
    return '$_temp0';
  }

  @override
  String get language => '食譜語言';

  @override
  String get noRecipes => '食譜還在準備中。';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': '捷克菜',
      'italian': '義大利菜',
      'vietnamese': '越南菜',
      'asian': '亞洲菜',
      'mexmed': '墨西哥與地中海菜',
      'quick': '快手菜',
      'family': '家常菜',
      'other': '其他',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': '蔬菜',
      'ovoce': '水果',
      'houby': '菇類',
      'cerstve_bylinky': '新鮮香草',
      'maso': '肉類',
      'uzeniny': '肉製品',
      'ryby': '魚類',
      'mlecne': '乳製品',
      'vejce': '蛋類',
      'rostlinne_bilkoviny': '豆腐等',
      'obiloviny': '穀物',
      'mouka': '麵粉',
      'testoviny': '義大利麵',
      'pecivo': '麵包糕點',
      'lusteniny': '豆類',
      'orechy_seminka': '堅果和種子',
      'susene_plody': '果乾',
      'koreni': '香料',
      'oleje_tuky': '油脂',
      'ocet_omacky': '醬料和醋',
      'sladidla': '甜味劑',
      'konzervy': '罐頭',
      'napoje': '飲料',
      'other': '其他',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': '克',
      'kg': '公斤',
      'ml': '毫升',
      'l': '公升',
      'dl': 'dl',
      'cl': 'cl',
      'ks': '個',
      'lzice': '湯匙',
      'lzicka': '茶匙',
      'hrnek': '杯',
      'strouzek': '瓣',
      'stipka': '撮',
      'plechovka': '罐',
      'svazek': '把',
      'hrst': '小把',
      'platek': '片',
      'dkg': 'dkg',
      'balicek': '包',
      'stonek': '根',
      'snitka': '枝',
      'kostka': '塊',
      'hlava': '顆',
      'oz': '盎司',
      'lb': '磅',
      'other': '',
    });
    return '$_temp0';
  }
}
