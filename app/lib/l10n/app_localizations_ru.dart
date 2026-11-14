// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Что приготовить';

  @override
  String get tabPantry => 'Кладовая';

  @override
  String get tabShopping => 'Покупки';

  @override
  String get groupReady => 'Можно прямо сейчас';

  @override
  String get groupMissing1 => 'Не хватает 1 продукта';

  @override
  String get groupMissing23 => 'Не хватает 2–3 продуктов';

  @override
  String get groupMore => 'Нужно докупить';

  @override
  String get emptyPantryHint =>
      'Добавьте то, что есть дома, и я подскажу, что из этого можно приготовить.';

  @override
  String get addToPantry => 'Добавить в кладовую';

  @override
  String get searchIngredient => 'Что у вас есть? (например, яйца, рис)';

  @override
  String get pantryEmpty => 'Кладовая пуста. Добавьте первый продукт.';

  @override
  String get pantryStaplesNote =>
      'Я считаю, что дома у вас есть соль, перец, масло и другие базовые продукты.';

  @override
  String minutes(int n) {
    return '$n мин';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Порций: $n',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'просто',
      '2': 'нетрудно',
      'other': 'сложнее',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'не хватает: $n',
      zero: 'всё есть',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ингредиенты';

  @override
  String get steps => 'Приготовление';

  @override
  String get tips => 'Советы';

  @override
  String get optional => 'по желанию';

  @override
  String get toTaste => 'по вкусу';

  @override
  String get addMissingToShopping => 'Добавить недостающее в покупки';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Добавлено позиций: $n',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Готовить';

  @override
  String stepOf(int i, int n) {
    return 'Шаг $i из $n';
  }

  @override
  String get next => 'Далее';

  @override
  String get back => 'Назад';

  @override
  String get done => 'Готово';

  @override
  String startTimer(String t) {
    return 'Запустить таймер $t';
  }

  @override
  String get timerDone => 'Время вышло!';

  @override
  String get cookedTitle => 'Приятного аппетита!';

  @override
  String get cookedBody =>
      'Готово. Убрать использованные продукты из кладовой?';

  @override
  String get removeUsed => 'Убрать';

  @override
  String get keep => 'Оставить';

  @override
  String get shoppingEmpty => 'Список покупок пуст.';

  @override
  String get checkout => 'Куплено';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Продуктов в кладовой: $n',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Язык рецептов';

  @override
  String get noRecipes => 'Рецепты ещё готовятся.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Чешская',
      'italian': 'Итальянская',
      'vietnamese': 'Вьетнамская',
      'asian': 'Азиатская',
      'mexmed': 'Мексиканская и средиземноморская',
      'quick': 'Быстрые блюда',
      'family': 'Семейная',
      'other': 'Другое',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Овощи',
      'ovoce': 'Фрукты',
      'houby': 'Грибы',
      'cerstve_bylinky': 'Свежая зелень',
      'maso': 'Мясо',
      'uzeniny': 'Колбасные изделия',
      'ryby': 'Рыба',
      'mlecne': 'Молочные продукты',
      'vejce': 'Яйца',
      'rostlinne_bilkoviny': 'Тофу и аналоги',
      'obiloviny': 'Крупы',
      'mouka': 'Мука',
      'testoviny': 'Макароны',
      'pecivo': 'Хлеб и выпечка',
      'lusteniny': 'Бобовые',
      'orechy_seminka': 'Орехи и семена',
      'susene_plody': 'Сухофрукты',
      'koreni': 'Специи',
      'oleje_tuky': 'Масла и жиры',
      'ocet_omacky': 'Соусы и уксус',
      'sladidla': 'Подсластители',
      'konzervy': 'Консервы',
      'napoje': 'Напитки',
      'other': 'Другое',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'г',
      'kg': 'кг',
      'ml': 'мл',
      'l': 'л',
      'dl': 'дл',
      'cl': 'сл',
      'ks': 'шт.',
      'lzice': 'ст. л.',
      'lzicka': 'ч. л.',
      'hrnek': 'стакан',
      'strouzek': 'зубчик',
      'stipka': 'щепотка',
      'plechovka': 'банка',
      'svazek': 'пучок',
      'hrst': 'горсть',
      'platek': 'ломтик',
      'dkg': 'даг',
      'balicek': 'пачка',
      'stonek': 'стебель',
      'snitka': 'веточка',
      'kostka': 'кубик',
      'hlava': 'головка',
      'oz': 'унц.',
      'lb': 'фунт',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Кухни';

  @override
  String get restorePurchases => 'Восстановить покупки';

  @override
  String get restoreStarted => 'Восстанавливаем покупки…';

  @override
  String get storeUnavailable =>
      'Магазин сейчас недоступен. Попробуй позже, когда будешь в сети.';

  @override
  String get storeLoading => 'Загружаем цены…';

  @override
  String get unlockedLabel => 'Разблокировано';

  @override
  String buy(String price) {
    return 'Купить · $price';
  }

  @override
  String get notForSale => 'Пока недоступно';

  @override
  String get purchasePending => 'Ожидание подтверждения…';

  @override
  String purchaseFailed(String msg) {
    return 'Покупка не удалась: $msg';
  }

  @override
  String get allPacksTitle => 'Все кухни';

  @override
  String get allPacksBody =>
      'Открывает все наборы сразу, выгоднее, чем по одному.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n рецепта',
      many: '$n рецептов',
      few: '$n рецепта',
      one: '$n рецепт',
      zero: 'рецепты готовятся',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Рецепт из набора «$pack»';
  }

  @override
  String get lockedBody =>
      'Ингредиенты видны сразу; шаги и режим готовки откроются вместе с набором.';

  @override
  String get unlock => 'Разблокировать';

  @override
  String get settings => 'Настройки';

  @override
  String get statsToggle => 'Анонимная статистика';

  @override
  String get statsToggleBody =>
      'Помогает улучшать приложение. Без идентификаторов и без того, что вы вводите.';
}
