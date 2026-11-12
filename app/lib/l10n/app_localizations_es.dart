// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Qué cocino';

  @override
  String get tabPantry => 'Despensa';

  @override
  String get tabShopping => 'Compra';

  @override
  String get groupReady => 'Listo para cocinar';

  @override
  String get groupMissing1 => 'Falta 1 cosa';

  @override
  String get groupMissing23 => 'Faltan 2–3 cosas';

  @override
  String get groupMore => 'Hay que comprar';

  @override
  String get emptyPantryHint =>
      'Añade lo que tienes en casa y te muestro qué puedes cocinar.';

  @override
  String get addToPantry => 'Añadir a la despensa';

  @override
  String get searchIngredient => '¿Qué tienes? (p. ej., huevos, arroz)';

  @override
  String get pantryEmpty =>
      'La despensa está vacía. Añade el primer ingrediente.';

  @override
  String get pantryStaplesNote =>
      'Supongo que tienes sal, pimienta, aceite y otros básicos.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n raciones',
      one: '$n ración',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'fácil',
      '2': 'asequible',
      'other': 'más difícil',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'faltan $n',
      one: 'falta $n',
      zero: 'lo tienes todo',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingredientes';

  @override
  String get steps => 'Preparación';

  @override
  String get tips => 'Consejos';

  @override
  String get optional => 'opcional';

  @override
  String get toTaste => 'al gusto';

  @override
  String get addMissingToShopping => 'Añadir lo que falta a la compra';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Se han añadido $n artículos',
      one: 'Se ha añadido $n artículo',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Cocinar';

  @override
  String stepOf(int i, int n) {
    return 'Paso $i de $n';
  }

  @override
  String get next => 'Siguiente';

  @override
  String get back => 'Atrás';

  @override
  String get done => 'Hecho';

  @override
  String startTimer(String t) {
    return 'Iniciar temporizador $t';
  }

  @override
  String get timerDone => '¡Se acabó el tiempo!';

  @override
  String get cookedTitle => '¡Buen provecho!';

  @override
  String get cookedBody =>
      'Ya está cocinado. ¿Quitar de la despensa los ingredientes usados?';

  @override
  String get removeUsed => 'Quitar';

  @override
  String get keep => 'Conservar';

  @override
  String get shoppingEmpty => 'Tu lista de la compra está vacía.';

  @override
  String get checkout => 'Comprado';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingredientes están en la despensa',
      one: '$n ingrediente está en la despensa',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Idioma de las recetas';

  @override
  String get noRecipes => 'Las recetas aún se están preparando.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Checa',
      'italian': 'Italiana',
      'vietnamese': 'Vietnamita',
      'asian': 'Asiática',
      'mexmed': 'Mexicana y mediterránea',
      'quick': 'Rápida',
      'family': 'Familiar',
      'other': 'Otros',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Verduras',
      'ovoce': 'Fruta',
      'houby': 'Setas',
      'cerstve_bylinky': 'Hierbas frescas',
      'maso': 'Carne',
      'uzeniny': 'Embutidos',
      'ryby': 'Pescado',
      'mlecne': 'Lácteos',
      'vejce': 'Huevos',
      'rostlinne_bilkoviny': 'Tofu y similares',
      'obiloviny': 'Cereales',
      'mouka': 'Harina',
      'testoviny': 'Pasta',
      'pecivo': 'Pan y bollería',
      'lusteniny': 'Legumbres',
      'orechy_seminka': 'Frutos secos y semillas',
      'susene_plody': 'Fruta desecada',
      'koreni': 'Especias',
      'oleje_tuky': 'Aceites y grasas',
      'ocet_omacky': 'Salsas y vinagre',
      'sladidla': 'Edulcorantes',
      'konzervy': 'Conservas',
      'napoje': 'Bebidas',
      'other': 'Otros',
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
      'ks': 'ud.',
      'lzice': 'cda.',
      'lzicka': 'cdta.',
      'hrnek': 'taza',
      'strouzek': 'diente',
      'stipka': 'pizca',
      'plechovka': 'lata',
      'svazek': 'manojo',
      'hrst': 'puñado',
      'platek': 'rebanada',
      'dkg': 'dag',
      'balicek': 'paquete',
      'stonek': 'tallo',
      'snitka': 'ramita',
      'kostka': 'cubito',
      'hlava': 'cabeza',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Cocinas';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get restoreStarted => 'Restaurando compras…';

  @override
  String get storeUnavailable =>
      'La tienda no está disponible ahora. Inténtalo más tarde cuando estés en línea.';

  @override
  String get storeLoading => 'Cargando precios…';

  @override
  String get unlockedLabel => 'Desbloqueado';

  @override
  String buy(String price) {
    return 'Comprar · $price';
  }

  @override
  String get notForSale => 'Aún no disponible';

  @override
  String get purchasePending => 'Esperando confirmación…';

  @override
  String purchaseFailed(String msg) {
    return 'La compra ha fallado: $msg';
  }

  @override
  String get allPacksTitle => 'Todas las cocinas';

  @override
  String get allPacksBody =>
      'Desbloquea todos los packs a la vez, más barato que uno a uno.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n recetas',
      one: '$n receta',
      zero: 'recetas en preparación',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Receta del pack $pack';
  }

  @override
  String get lockedBody =>
      'Ya ves los ingredientes; los pasos y el modo cocina se desbloquean con el pack.';

  @override
  String get unlock => 'Desbloquear';
}
