// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'ఏం వండాలి';

  @override
  String get tabPantry => 'వంటింటి నిల్వ';

  @override
  String get tabShopping => 'కొనుగోళ్లు';

  @override
  String get groupReady => 'ఇప్పుడే చేయవచ్చు';

  @override
  String get groupMissing1 => '1 వస్తువు తక్కువ';

  @override
  String get groupMissing23 => '2–3 వస్తువులు తక్కువ';

  @override
  String get groupMore => 'కొనాలి';

  @override
  String get emptyPantryHint =>
      'ఇంట్లో ఉన్నవి జోడించండి, మీరు ఏం వండవచ్చో నేను చూపిస్తాను.';

  @override
  String get addToPantry => 'నిల్వకు జోడించు';

  @override
  String get searchIngredient => 'ఇంట్లో ఏముంది? (ఉదా. గుడ్లు, బియ్యం)';

  @override
  String get pantryEmpty => 'నిల్వ ఖాళీగా ఉంది. మొదటి పదార్థాన్ని జోడించండి.';

  @override
  String get pantryStaplesNote =>
      'మీ దగ్గర ఉప్పు, మిరియాలు, నూనె వంటి ప్రాథమిక వస్తువులు ఉన్నాయని నేను అనుకుంటున్నాను.';

  @override
  String minutes(int n) {
    return '$n నిమి';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n సర్వింగులు',
      one: '$n సర్వింగ్',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'సులభం',
      '2': 'మధ్యస్థం',
      'other': 'కొంచెం కష్టం',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n తక్కువ',
      one: '$n తక్కువ',
      zero: 'అన్నీ ఉన్నాయి',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'పదార్థాలు';

  @override
  String get steps => 'తయారీ విధానం';

  @override
  String get tips => 'చిట్కాలు';

  @override
  String get optional => 'ఐచ్ఛికం';

  @override
  String get toTaste => 'రుచికి తగినంత';

  @override
  String get addMissingToShopping => 'తక్కువ ఉన్నవి కొనుగోళ్లకు జోడించు';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n వస్తువులు జోడించబడ్డాయి',
      one: '$n వస్తువు జోడించబడింది',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'వండండి';

  @override
  String stepOf(int i, int n) {
    return '$n లో $iవ దశ';
  }

  @override
  String get next => 'తర్వాత';

  @override
  String get back => 'వెనుకకు';

  @override
  String get done => 'పూర్తయింది';

  @override
  String startTimer(String t) {
    return 'టైమర్ $t ప్రారంభించు';
  }

  @override
  String get timerDone => 'సమయం ముగిసింది!';

  @override
  String get cookedTitle => 'ఆస్వాదించండి!';

  @override
  String get cookedBody =>
      'వంట పూర్తయింది. వాడిన పదార్థాలను నిల్వ నుండి తొలగించాలా?';

  @override
  String get removeUsed => 'తొలగించు';

  @override
  String get keep => 'ఉంచు';

  @override
  String get shoppingEmpty => 'కొనుగోళ్ల జాబితా ఖాళీగా ఉంది.';

  @override
  String get checkout => 'కొన్నాను';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n పదార్థాలు నిల్వలో ఉన్నాయి',
      one: '$n పదార్థం నిల్వలో ఉంది',
    );
    return '$_temp0';
  }

  @override
  String get language => 'వంటకాల భాష';

  @override
  String get noRecipes => 'వంటకాలు ఇంకా సిద్ధమవుతున్నాయి.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'చెక్',
      'italian': 'ఇటాలియన్',
      'vietnamese': 'వియత్నామీస్',
      'asian': 'ఆసియన్',
      'mexmed': 'మెక్సికన్ & మెడిటరేనియన్',
      'quick': 'త్వరితం',
      'family': 'కుటుంబం',
      'other': 'ఇతరాలు',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'కూరగాయలు',
      'ovoce': 'పండ్లు',
      'houby': 'పుట్టగొడుగులు',
      'cerstve_bylinky': 'తాజా ఆకుకూరలు-మూలికలు',
      'maso': 'మాంసం',
      'uzeniny': 'ప్రాసెస్ చేసిన మాంసం',
      'ryby': 'చేపలు',
      'mlecne': 'పాల ఉత్పత్తులు',
      'vejce': 'గుడ్లు',
      'rostlinne_bilkoviny': 'టోఫు మొదలైనవి',
      'obiloviny': 'ధాన్యాలు',
      'mouka': 'పిండి',
      'testoviny': 'పాస్తా',
      'pecivo': 'బ్రెడ్ & బేకరీ',
      'lusteniny': 'పప్పుధాన్యాలు',
      'orechy_seminka': 'గింజలు & విత్తనాలు',
      'susene_plody': 'ఎండిన పండ్లు',
      'koreni': 'మసాలాలు',
      'oleje_tuky': 'నూనెలు & కొవ్వులు',
      'ocet_omacky': 'సాస్‌లు & వెనిగర్',
      'sladidla': 'స్వీటెనర్లు',
      'konzervy': 'డబ్బా ఆహారాలు',
      'napoje': 'పానీయాలు',
      'other': 'ఇతరాలు',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'గ్రా',
      'kg': 'కేజీ',
      'ml': 'మిలీ',
      'l': 'లీ',
      'dl': 'డెసిలీ',
      'cl': 'సెంటిలీ',
      'ks': 'సంఖ్య',
      'lzice': 'టేబుల్ స్పూన్',
      'lzicka': 'టీస్పూన్',
      'hrnek': 'కప్పు',
      'strouzek': 'రెబ్బ',
      'stipka': 'చిటికెడు',
      'plechovka': 'డబ్బా',
      'svazek': 'కట్ట',
      'hrst': 'గుప్పెడు',
      'platek': 'ముక్క',
      'dkg': 'dkg',
      'balicek': 'ప్యాకెట్',
      'stonek': 'కాడ',
      'snitka': 'రెమ్మ',
      'kostka': 'క్యూబ్',
      'hlava': 'గడ్డ',
      'oz': 'ఔన్స్',
      'lb': 'పౌండ్',
      'other': '',
    });
    return '$_temp0';
  }
}
