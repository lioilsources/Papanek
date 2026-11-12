// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Що приготувати';

  @override
  String get tabPantry => 'Комора';

  @override
  String get tabShopping => 'Покупки';

  @override
  String get groupReady => 'Можна одразу';

  @override
  String get groupMissing1 => 'Бракує 1 продукту';

  @override
  String get groupMissing23 => 'Бракує 2–3 продуктів';

  @override
  String get groupMore => 'Треба докупити';

  @override
  String get emptyPantryHint =>
      'Додайте те, що є вдома, і я підкажу, що з цього можна приготувати.';

  @override
  String get addToPantry => 'Додати до комори';

  @override
  String get searchIngredient => 'Що у вас є? (наприклад, яйця, рис)';

  @override
  String get pantryEmpty => 'Комора порожня. Додайте перший продукт.';

  @override
  String get pantryStaplesNote =>
      'Я вважаю, що вдома у вас є сіль, перець, олія та інші базові продукти.';

  @override
  String minutes(int n) {
    return '$n хв';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Порцій: $n',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'просто',
      '2': 'неважко',
      'other': 'складніше',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'бракує: $n',
      zero: 'усе є',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Інгредієнти';

  @override
  String get steps => 'Приготування';

  @override
  String get tips => 'Поради';

  @override
  String get optional => 'за бажанням';

  @override
  String get toTaste => 'за смаком';

  @override
  String get addMissingToShopping => 'Додати відсутнє до покупок';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Додано позицій: $n',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Готувати';

  @override
  String stepOf(int i, int n) {
    return 'Крок $i з $n';
  }

  @override
  String get next => 'Далі';

  @override
  String get back => 'Назад';

  @override
  String get done => 'Готово';

  @override
  String startTimer(String t) {
    return 'Запустити таймер $t';
  }

  @override
  String get timerDone => 'Час вийшов!';

  @override
  String get cookedTitle => 'Смачного!';

  @override
  String get cookedBody => 'Готово. Прибрати використані продукти з комори?';

  @override
  String get removeUsed => 'Прибрати';

  @override
  String get keep => 'Залишити';

  @override
  String get shoppingEmpty => 'Список покупок порожній.';

  @override
  String get checkout => 'Куплено';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Продуктів у коморі: $n',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Мова рецептів';

  @override
  String get noRecipes => 'Рецепти ще готуються.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Чеська',
      'italian': 'Італійська',
      'vietnamese': 'В\'єтнамська',
      'asian': 'Азійська',
      'mexmed': 'Мексиканська та середземноморська',
      'quick': 'Швидкі страви',
      'family': 'Сімейна',
      'other': 'Інше',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Овочі',
      'ovoce': 'Фрукти',
      'houby': 'Гриби',
      'cerstve_bylinky': 'Свіжа зелень',
      'maso': 'М\'ясо',
      'uzeniny': 'Ковбасні вироби',
      'ryby': 'Риба',
      'mlecne': 'Молочні продукти',
      'vejce': 'Яйця',
      'rostlinne_bilkoviny': 'Тофу та аналоги',
      'obiloviny': 'Крупи',
      'mouka': 'Борошно',
      'testoviny': 'Макарони',
      'pecivo': 'Хліб і випічка',
      'lusteniny': 'Бобові',
      'orechy_seminka': 'Горіхи та насіння',
      'susene_plody': 'Сухофрукти',
      'koreni': 'Спеції',
      'oleje_tuky': 'Олії та жири',
      'ocet_omacky': 'Соуси й оцет',
      'sladidla': 'Підсолоджувачі',
      'konzervy': 'Консерви',
      'napoje': 'Напої',
      'other': 'Інше',
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
      'hrnek': 'склянка',
      'strouzek': 'зубчик',
      'stipka': 'дрібка',
      'plechovka': 'банка',
      'svazek': 'пучок',
      'hrst': 'жменя',
      'platek': 'скибка',
      'dkg': 'даг',
      'balicek': 'пачка',
      'stonek': 'стебло',
      'snitka': 'гілочка',
      'kostka': 'кубик',
      'hlava': 'головка',
      'oz': 'унц.',
      'lb': 'фунт',
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
