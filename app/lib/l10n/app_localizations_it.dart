// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Cosa cucino';

  @override
  String get tabPantry => 'Dispensa';

  @override
  String get tabShopping => 'Spesa';

  @override
  String get groupReady => 'Pronto da cucinare';

  @override
  String get groupMissing1 => 'Manca 1 ingrediente';

  @override
  String get groupMissing23 => 'Mancano 2–3 ingredienti';

  @override
  String get groupMore => 'Serve la spesa';

  @override
  String get emptyPantryHint =>
      'Aggiungi quello che hai in casa e ti mostro cosa puoi cucinare.';

  @override
  String get addToPantry => 'Aggiungi alla dispensa';

  @override
  String get searchIngredient => 'Cosa hai in casa? (es. uova, riso)';

  @override
  String get pantryEmpty =>
      'La dispensa è vuota. Aggiungi il primo ingrediente.';

  @override
  String get pantryStaplesNote =>
      'Do per scontato che tu abbia sale, pepe, olio e altri ingredienti di base.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n porzioni',
      one: '$n porzione',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'facile',
      '2': 'alla portata',
      'other': 'più impegnativo',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'mancano $n',
      one: 'manca $n',
      zero: 'hai tutto',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingredienti';

  @override
  String get steps => 'Preparazione';

  @override
  String get tips => 'Consigli';

  @override
  String get optional => 'facoltativo';

  @override
  String get toTaste => 'q.b.';

  @override
  String get addMissingToShopping => 'Aggiungi il mancante alla spesa';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Aggiunti $n articoli',
      one: 'Aggiunto $n articolo',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Cucina';

  @override
  String stepOf(int i, int n) {
    return 'Passo $i di $n';
  }

  @override
  String get next => 'Avanti';

  @override
  String get back => 'Indietro';

  @override
  String get done => 'Fatto';

  @override
  String startTimer(String t) {
    return 'Avvia timer $t';
  }

  @override
  String get timerDone => 'Tempo scaduto!';

  @override
  String get cookedTitle => 'Buon appetito!';

  @override
  String get cookedBody =>
      'Tutto cucinato. Togliere dalla dispensa gli ingredienti usati?';

  @override
  String get removeUsed => 'Togli';

  @override
  String get keep => 'Tieni';

  @override
  String get shoppingEmpty => 'La lista della spesa è vuota.';

  @override
  String get checkout => 'Comprato';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingredienti sono nella dispensa',
      one: '$n ingrediente è nella dispensa',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Lingua delle ricette';

  @override
  String get noRecipes => 'Le ricette sono ancora in preparazione.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Ceca',
      'italian': 'Italiana',
      'vietnamese': 'Vietnamita',
      'asian': 'Asiatica',
      'mexmed': 'Messicana e mediterranea',
      'quick': 'Veloce',
      'family': 'Per la famiglia',
      'other': 'Altro',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Verdure',
      'ovoce': 'Frutta',
      'houby': 'Funghi',
      'cerstve_bylinky': 'Erbe aromatiche fresche',
      'maso': 'Carne',
      'uzeniny': 'Salumi',
      'ryby': 'Pesce',
      'mlecne': 'Latticini',
      'vejce': 'Uova',
      'rostlinne_bilkoviny': 'Tofu e simili',
      'obiloviny': 'Cereali',
      'mouka': 'Farina',
      'testoviny': 'Pasta',
      'pecivo': 'Pane e prodotti da forno',
      'lusteniny': 'Legumi',
      'orechy_seminka': 'Frutta secca e semi',
      'susene_plody': 'Frutta essiccata',
      'koreni': 'Spezie',
      'oleje_tuky': 'Oli e grassi',
      'ocet_omacky': 'Salse e aceto',
      'sladidla': 'Dolcificanti',
      'konzervy': 'Conserve',
      'napoje': 'Bevande',
      'other': 'Altro',
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
      'ks': 'pz',
      'lzice': 'cucchiaio',
      'lzicka': 'cucchiaino',
      'hrnek': 'tazza',
      'strouzek': 'spicchio',
      'stipka': 'pizzico',
      'plechovka': 'lattina',
      'svazek': 'mazzo',
      'hrst': 'manciata',
      'platek': 'fetta',
      'dkg': 'dag',
      'balicek': 'confezione',
      'stonek': 'gambo',
      'snitka': 'rametto',
      'kostka': 'cubetto',
      'hlava': 'testa',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }
}
