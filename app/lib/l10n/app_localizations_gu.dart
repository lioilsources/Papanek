// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'શું રાંધું';

  @override
  String get tabPantry => 'રસોડાનો ભંડાર';

  @override
  String get tabShopping => 'ખરીદી';

  @override
  String get groupReady => 'હમણાં જ બની શકે';

  @override
  String get groupMissing1 => '1 વસ્તુ ખૂટે છે';

  @override
  String get groupMissing23 => '2–3 વસ્તુઓ ખૂટે છે';

  @override
  String get groupMore => 'ખરીદી કરવી પડશે';

  @override
  String get emptyPantryHint =>
      'ઘરમાં જે હોય તે ઉમેરો, હું બતાવીશ કે તમે શું બનાવી શકો.';

  @override
  String get addToPantry => 'ભંડારમાં ઉમેરો';

  @override
  String get searchIngredient => 'ઘરમાં શું છે? (જેમ કે ઈંડાં, ચોખા)';

  @override
  String get pantryEmpty => 'ભંડાર ખાલી છે. પહેલી સામગ્રી ઉમેરો.';

  @override
  String get pantryStaplesNote =>
      'હું માનું છું કે તમારી પાસે મીઠું, મરી, તેલ અને બીજી જરૂરી વસ્તુઓ છે.';

  @override
  String minutes(int n) {
    return '$n મિનિટ';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n સર્વિંગ',
      one: '$n સર્વિંગ',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'સરળ',
      '2': 'મધ્યમ',
      'other': 'થોડું અઘરું',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ખૂટે છે',
      one: '$n ખૂટે છે',
      zero: 'બધું છે',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'સામગ્રી';

  @override
  String get steps => 'રીત';

  @override
  String get tips => 'ટિપ્સ';

  @override
  String get optional => 'વૈકલ્પિક';

  @override
  String get toTaste => 'સ્વાદ મુજબ';

  @override
  String get addMissingToShopping => 'ખૂટતું ખરીદીમાં ઉમેરો';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n વસ્તુઓ ઉમેરાઈ',
      one: '$n વસ્તુ ઉમેરાઈ',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'રાંધો';

  @override
  String stepOf(int i, int n) {
    return '$n માંથી પગલું $i';
  }

  @override
  String get next => 'આગળ';

  @override
  String get back => 'પાછળ';

  @override
  String get done => 'પૂર્ણ';

  @override
  String startTimer(String t) {
    return 'ટાઇમર $t શરૂ કરો';
  }

  @override
  String get timerDone => 'સમય પૂરો!';

  @override
  String get cookedTitle => 'ભોજન માણો!';

  @override
  String get cookedBody =>
      'રસોઈ તૈયાર. વપરાયેલી સામગ્રી ભંડારમાંથી કાઢી નાખીએ?';

  @override
  String get removeUsed => 'કાઢી નાખો';

  @override
  String get keep => 'રાખો';

  @override
  String get shoppingEmpty => 'ખરીદીની યાદી ખાલી છે.';

  @override
  String get checkout => 'ખરીદ્યું';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n સામગ્રી ભંડારમાં છે',
      one: '$n સામગ્રી ભંડારમાં છે',
    );
    return '$_temp0';
  }

  @override
  String get language => 'રેસીપીની ભાષા';

  @override
  String get noRecipes => 'રેસીપીઓ હજી તૈયાર થઈ રહી છે.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'ચેક',
      'italian': 'ઇટાલિયન',
      'vietnamese': 'વિયેતનામી',
      'asian': 'એશિયન',
      'mexmed': 'મેક્સિકન અને ભૂમધ્યસાગરીય',
      'quick': 'ઝડપી',
      'family': 'પારિવારિક',
      'other': 'અન્ય',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'શાકભાજી',
      'ovoce': 'ફળો',
      'houby': 'મશરૂમ',
      'cerstve_bylinky': 'તાજી વનસ્પતિ',
      'maso': 'માંસ',
      'uzeniny': 'પ્રોસેસ્ડ માંસ',
      'ryby': 'માછલી',
      'mlecne': 'ડેરી',
      'vejce': 'ઈંડાં',
      'rostlinne_bilkoviny': 'ટોફુ વગેરે',
      'obiloviny': 'અનાજ',
      'mouka': 'લોટ',
      'testoviny': 'પાસ્તા',
      'pecivo': 'બ્રેડ અને બેકરી',
      'lusteniny': 'કઠોળ',
      'orechy_seminka': 'સૂકો મેવો અને બીજ',
      'susene_plody': 'સૂકાં ફળો',
      'koreni': 'મસાલા',
      'oleje_tuky': 'તેલ અને ચરબી',
      'ocet_omacky': 'સોસ અને સરકો',
      'sladidla': 'ગળપણ',
      'konzervy': 'ડબ્બાબંધ',
      'napoje': 'પીણાં',
      'other': 'અન્ય',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'ગ્રા',
      'kg': 'કિગ્રા',
      'ml': 'મિલી',
      'l': 'લિ',
      'dl': 'ડેસીલી',
      'cl': 'સેન્ટીલી',
      'ks': 'નંગ',
      'lzice': 'ટેબલસ્પૂન',
      'lzicka': 'ચમચી',
      'hrnek': 'કપ',
      'strouzek': 'કળી',
      'stipka': 'ચપટી',
      'plechovka': 'ડબ્બો',
      'svazek': 'ઝૂડી',
      'hrst': 'મુઠ્ઠી',
      'platek': 'સ્લાઇસ',
      'dkg': 'dkg',
      'balicek': 'પેકેટ',
      'stonek': 'દાંડી',
      'snitka': 'ડાળખી',
      'kostka': 'ક્યુબ',
      'hlava': 'માથું',
      'oz': 'ઔંસ',
      'lb': 'પાઉન્ડ',
      'other': '',
    });
    return '$_temp0';
  }
}
