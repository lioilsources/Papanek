// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'କଣ ରାନ୍ଧିବି';

  @override
  String get tabPantry => 'ଭଣ୍ଡାର';

  @override
  String get tabShopping => 'କିଣାକିଣି';

  @override
  String get groupReady => 'ବର୍ତ୍ତମାନ ରାନ୍ଧିହେବ';

  @override
  String get groupMissing1 => '୧ଟି ଜିନିଷ କମ୍ ଅଛି';

  @override
  String get groupMissing23 => '୨–୩ଟି ଜିନିଷ କମ୍ ଅଛି';

  @override
  String get groupMore => 'କିଣିବାକୁ ପଡ଼ିବ';

  @override
  String get emptyPantryHint =>
      'ଘରେ ଥିବା ଜିନିଷ ଯୋଡ଼ନ୍ତୁ, ମୁଁ ଦେଖାଇବି ଆପଣ କଣ ରାନ୍ଧିପାରିବେ।';

  @override
  String get addToPantry => 'ଭଣ୍ଡାରରେ ଯୋଡ଼ନ୍ତୁ';

  @override
  String get searchIngredient => 'ଘରେ କଣ ଅଛି? (ଯେପରି ଅଣ୍ଡା, ଚାଉଳ)';

  @override
  String get pantryEmpty => 'ଭଣ୍ଡାର ଖାଲି ଅଛି। ପ୍ରଥମ ସାମଗ୍ରୀ ଯୋଡ଼ନ୍ତୁ।';

  @override
  String get pantryStaplesNote =>
      'ମୁଁ ଧରିନେଉଛି ଆପଣଙ୍କ ପାଖରେ ଲୁଣ, ଗୋଲମରିଚ, ତେଲ ଓ ଅନ୍ୟ ମୌଳିକ ଜିନିଷ ଅଛି।';

  @override
  String minutes(int n) {
    return '$n ମିନିଟ୍';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ପରିବେଷଣ',
      one: '$n ପରିବେଷଣ',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'ସହଜ',
      '2': 'ମଧ୍ୟମ',
      'other': 'ଟିକେ କଠିନ',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nଟି କମ୍',
      one: '$nଟି କମ୍',
      zero: 'ସବୁ ଅଛି',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'ସାମଗ୍ରୀ';

  @override
  String get steps => 'ପ୍ରସ୍ତୁତି ବିଧି';

  @override
  String get tips => 'ପରାମର୍ଶ';

  @override
  String get optional => 'ବୈକଳ୍ପିକ';

  @override
  String get toTaste => 'ସ୍ୱାଦ ଅନୁସାରେ';

  @override
  String get addMissingToShopping => 'କମ୍ ଥିବା ଜିନିଷ କିଣାକିଣିରେ ଯୋଡ଼ନ୍ତୁ';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nଟି ଆଇଟମ୍ ଯୋଡ଼ାଗଲା',
      one: '$nଟି ଆଇଟମ୍ ଯୋଡ଼ାଗଲା',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'ରାନ୍ଧନ୍ତୁ';

  @override
  String stepOf(int i, int n) {
    return '$nରୁ ପଦକ୍ଷେପ $i';
  }

  @override
  String get next => 'ପରବର୍ତ୍ତୀ';

  @override
  String get back => 'ପଛକୁ';

  @override
  String get done => 'ସମାପ୍ତ';

  @override
  String startTimer(String t) {
    return 'ଟାଇମର୍ $t ଆରମ୍ଭ କରନ୍ତୁ';
  }

  @override
  String get timerDone => 'ସମୟ ସରିଲା!';

  @override
  String get cookedTitle => 'ଭଲରେ ଖାଆନ୍ତୁ!';

  @override
  String get cookedBody => 'ରନ୍ଧା ସରିଲା। ବ୍ୟବହୃତ ସାମଗ୍ରୀ ଭଣ୍ଡାରରୁ ହଟାଇବେ କି?';

  @override
  String get removeUsed => 'ହଟାନ୍ତୁ';

  @override
  String get keep => 'ରଖନ୍ତୁ';

  @override
  String get shoppingEmpty => 'କିଣାକିଣି ତାଲିକା ଖାଲି ଅଛି।';

  @override
  String get checkout => 'କିଣାହେଲା';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nଟି ସାମଗ୍ରୀ ଭଣ୍ଡାରରେ ଅଛି',
      one: '$nଟି ସାମଗ୍ରୀ ଭଣ୍ଡାରରେ ଅଛି',
    );
    return '$_temp0';
  }

  @override
  String get language => 'ରେସିପି ଭାଷା';

  @override
  String get noRecipes => 'ରେସିପି ଏଯାବତ୍ ପ୍ରସ୍ତୁତ ହେଉଛି।';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'ଚେକ୍',
      'italian': 'ଇଟାଲୀୟ',
      'vietnamese': 'ଭିଏତନାମୀ',
      'asian': 'ଏସୀୟ',
      'mexmed': 'ମେକ୍ସିକାନ୍ ଓ ଭୂମଧ୍ୟସାଗରୀୟ',
      'quick': 'ଶୀଘ୍ର',
      'family': 'ପାରିବାରିକ',
      'other': 'ଅନ୍ୟାନ୍ୟ',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'ପନିପରିବା',
      'ovoce': 'ଫଳ',
      'houby': 'ମଶରୁମ୍',
      'cerstve_bylinky': 'ତାଜା ଔଷଧୀୟ ଗୁଳ୍ମ',
      'maso': 'ମାଂସ',
      'uzeniny': 'ପ୍ରକ୍ରିୟାକୃତ ମାଂସ',
      'ryby': 'ମାଛ',
      'mlecne': 'ଦୁଗ୍ଧଜାତ',
      'vejce': 'ଅଣ୍ଡା',
      'rostlinne_bilkoviny': 'ଟୋଫୁ ଇତ୍ୟାଦି',
      'obiloviny': 'ଶସ୍ୟ',
      'mouka': 'ମଇଦା',
      'testoviny': 'ପାସ୍ତା',
      'pecivo': 'ରୁଟି ଓ ବେକେରି',
      'lusteniny': 'ଡାଲି',
      'orechy_seminka': 'ବାଦାମ ଓ ବିହନ',
      'susene_plody': 'ଶୁଖିଲା ଫଳ',
      'koreni': 'ମସଲା',
      'oleje_tuky': 'ତେଲ ଓ ଚର୍ବି',
      'ocet_omacky': 'ସସ୍ ଓ ଭିନେଗାର',
      'sladidla': 'ମିଠା ଦ୍ରବ୍ୟ',
      'konzervy': 'ଡବାବନ୍ଦ',
      'napoje': 'ପାନୀୟ',
      'other': 'ଅନ୍ୟାନ୍ୟ',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'ଗ୍ରା',
      'kg': 'କେଜି',
      'ml': 'ମିଲି',
      'l': 'ଲି',
      'dl': 'ଡେସିଲି',
      'cl': 'ସେଣ୍ଟିଲି',
      'ks': 'ଟି',
      'lzice': 'ବଡ଼ ଚାମଚ',
      'lzicka': 'ଛୋଟ ଚାମଚ',
      'hrnek': 'କପ୍',
      'strouzek': 'କୋଷ',
      'stipka': 'ଚିମୁଟା',
      'plechovka': 'ଡବା',
      'svazek': 'ଗୁଚ୍ଛ',
      'hrst': 'ମୁଠାଏ',
      'platek': 'ଖଣ୍ଡ',
      'dkg': 'dkg',
      'balicek': 'ପ୍ୟାକେଟ୍',
      'stonek': 'ଡଙ୍ଗା',
      'snitka': 'ଡାଳ',
      'kostka': 'କ୍ୟୁବ୍',
      'hlava': 'ମୁଣ୍ଡ',
      'oz': 'ଆଉନ୍ସ',
      'lb': 'ପାଉଣ୍ଡ',
      'other': '',
    });
    return '$_temp0';
  }
}
