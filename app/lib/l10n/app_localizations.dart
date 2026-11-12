import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('ml'),
    Locale('mr'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('or'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('pt', 'PT'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sv'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In cs, this message translates to:
  /// **'Papánek'**
  String get appTitle;

  /// No description provided for @tabCook.
  ///
  /// In cs, this message translates to:
  /// **'Co uvařím'**
  String get tabCook;

  /// No description provided for @tabPantry.
  ///
  /// In cs, this message translates to:
  /// **'Spíž'**
  String get tabPantry;

  /// No description provided for @tabShopping.
  ///
  /// In cs, this message translates to:
  /// **'Nákup'**
  String get tabShopping;

  /// No description provided for @groupReady.
  ///
  /// In cs, this message translates to:
  /// **'Můžeš hned'**
  String get groupReady;

  /// No description provided for @groupMissing1.
  ///
  /// In cs, this message translates to:
  /// **'Chybí 1 věc'**
  String get groupMissing1;

  /// No description provided for @groupMissing23.
  ///
  /// In cs, this message translates to:
  /// **'Chybí 2–3 věci'**
  String get groupMissing23;

  /// No description provided for @groupMore.
  ///
  /// In cs, this message translates to:
  /// **'Na nákup'**
  String get groupMore;

  /// No description provided for @emptyPantryHint.
  ///
  /// In cs, this message translates to:
  /// **'Přidej do spíže, co máš doma, a ukážu ti, co z toho uvaříš.'**
  String get emptyPantryHint;

  /// No description provided for @addToPantry.
  ///
  /// In cs, this message translates to:
  /// **'Přidat do spíže'**
  String get addToPantry;

  /// No description provided for @searchIngredient.
  ///
  /// In cs, this message translates to:
  /// **'Co máš doma? (např. vejce, rýže)'**
  String get searchIngredient;

  /// No description provided for @pantryEmpty.
  ///
  /// In cs, this message translates to:
  /// **'Spíž je prázdná. Přidej první surovinu.'**
  String get pantryEmpty;

  /// No description provided for @pantryStaplesNote.
  ///
  /// In cs, this message translates to:
  /// **'Sůl, pepř, olej a další základy počítám, že doma máš.'**
  String get pantryStaplesNote;

  /// No description provided for @minutes.
  ///
  /// In cs, this message translates to:
  /// **'{n} min'**
  String minutes(int n);

  /// No description provided for @servings.
  ///
  /// In cs, this message translates to:
  /// **'{n, plural, one{{n} porce} few{{n} porce} other{{n} porcí}}'**
  String servings(int n);

  /// No description provided for @difficulty.
  ///
  /// In cs, this message translates to:
  /// **'{n, select, 1{snadné} 2{zvládnutelné} other{náročnější}}'**
  String difficulty(String n);

  /// No description provided for @missingCount.
  ///
  /// In cs, this message translates to:
  /// **'{n, plural, =0{máš všechno} one{chybí {n}} few{chybí {n}} other{chybí {n}}}'**
  String missingCount(int n);

  /// No description provided for @ingredients.
  ///
  /// In cs, this message translates to:
  /// **'Suroviny'**
  String get ingredients;

  /// No description provided for @steps.
  ///
  /// In cs, this message translates to:
  /// **'Postup'**
  String get steps;

  /// No description provided for @tips.
  ///
  /// In cs, this message translates to:
  /// **'Rady'**
  String get tips;

  /// No description provided for @optional.
  ///
  /// In cs, this message translates to:
  /// **'nepovinné'**
  String get optional;

  /// No description provided for @toTaste.
  ///
  /// In cs, this message translates to:
  /// **'podle chuti'**
  String get toTaste;

  /// No description provided for @addMissingToShopping.
  ///
  /// In cs, this message translates to:
  /// **'Chybějící na nákup'**
  String get addMissingToShopping;

  /// No description provided for @addedToShopping.
  ///
  /// In cs, this message translates to:
  /// **'{n, plural, one{Přidána {n} položka} few{Přidány {n} položky} other{Přidáno {n} položek}}'**
  String addedToShopping(int n);

  /// No description provided for @startCooking.
  ///
  /// In cs, this message translates to:
  /// **'Vařit'**
  String get startCooking;

  /// No description provided for @stepOf.
  ///
  /// In cs, this message translates to:
  /// **'Krok {i} z {n}'**
  String stepOf(int i, int n);

  /// No description provided for @next.
  ///
  /// In cs, this message translates to:
  /// **'Další'**
  String get next;

  /// No description provided for @back.
  ///
  /// In cs, this message translates to:
  /// **'Zpět'**
  String get back;

  /// No description provided for @done.
  ///
  /// In cs, this message translates to:
  /// **'Hotovo'**
  String get done;

  /// No description provided for @startTimer.
  ///
  /// In cs, this message translates to:
  /// **'Spustit časovač {t}'**
  String startTimer(String t);

  /// No description provided for @timerDone.
  ///
  /// In cs, this message translates to:
  /// **'Čas vypršel!'**
  String get timerDone;

  /// No description provided for @cookedTitle.
  ///
  /// In cs, this message translates to:
  /// **'Dobrou chuť!'**
  String get cookedTitle;

  /// No description provided for @cookedBody.
  ///
  /// In cs, this message translates to:
  /// **'Uvařeno. Odebrat použité suroviny ze spíže?'**
  String get cookedBody;

  /// No description provided for @removeUsed.
  ///
  /// In cs, this message translates to:
  /// **'Odebrat'**
  String get removeUsed;

  /// No description provided for @keep.
  ///
  /// In cs, this message translates to:
  /// **'Nechat'**
  String get keep;

  /// No description provided for @shoppingEmpty.
  ///
  /// In cs, this message translates to:
  /// **'Nákupní seznam je prázdný.'**
  String get shoppingEmpty;

  /// No description provided for @checkout.
  ///
  /// In cs, this message translates to:
  /// **'Nakoupeno'**
  String get checkout;

  /// No description provided for @checkedOut.
  ///
  /// In cs, this message translates to:
  /// **'{n, plural, one{{n} surovina je ve spíži} few{{n} suroviny jsou ve spíži} other{{n} surovin je ve spíži}}'**
  String checkedOut(int n);

  /// No description provided for @language.
  ///
  /// In cs, this message translates to:
  /// **'Jazyk receptů'**
  String get language;

  /// No description provided for @noRecipes.
  ///
  /// In cs, this message translates to:
  /// **'Recepty se ještě připravují.'**
  String get noRecipes;

  /// No description provided for @cuisine.
  ///
  /// In cs, this message translates to:
  /// **'{c, select, czech{Česká} italian{Italská} vietnamese{Vietnamská} asian{Asijská} mexmed{Mexická a středomořská} quick{Rychlovka} family{Rodinná} other{Ostatní}}'**
  String cuisine(String c);

  /// No description provided for @category.
  ///
  /// In cs, this message translates to:
  /// **'{c, select, zelenina{Zelenina} ovoce{Ovoce} houby{Houby} cerstve_bylinky{Bylinky} maso{Maso} uzeniny{Uzeniny} ryby{Ryby} mlecne{Mléčné} vejce{Vejce} rostlinne_bilkoviny{Tofu a spol.} obiloviny{Obiloviny} mouka{Mouka} testoviny{Těstoviny} pecivo{Pečivo} lusteniny{Luštěniny} orechy_seminka{Ořechy a semínka} susene_plody{Sušené ovoce} koreni{Koření} oleje_tuky{Oleje a tuky} ocet_omacky{Omáčky a ocet} sladidla{Sladidla} konzervy{Konzervy} napoje{Nápoje} other{Ostatní}}'**
  String category(String c);

  /// No description provided for @unit.
  ///
  /// In cs, this message translates to:
  /// **'{u, select, g{g} kg{kg} ml{ml} l{l} dl{dl} cl{cl} ks{ks} lzice{lžíce} lzicka{lžička} hrnek{hrnek} strouzek{stroužek} stipka{špetka} plechovka{plechovka} svazek{svazek} hrst{hrst} platek{plátek} dkg{dkg} balicek{balíček} stonek{stonek} snitka{snítka} kostka{kostka} hlava{hlávka} oz{oz} lb{lb} other{}}'**
  String unit(String u);

  /// No description provided for @tabShop.
  ///
  /// In cs, this message translates to:
  /// **'Kuchyně'**
  String get tabShop;

  /// No description provided for @restorePurchases.
  ///
  /// In cs, this message translates to:
  /// **'Obnovit nákupy'**
  String get restorePurchases;

  /// No description provided for @restoreStarted.
  ///
  /// In cs, this message translates to:
  /// **'Obnovuji nákupy…'**
  String get restoreStarted;

  /// No description provided for @storeUnavailable.
  ///
  /// In cs, this message translates to:
  /// **'Obchod teď není dostupný. Zkus to později, až budeš online.'**
  String get storeUnavailable;

  /// No description provided for @storeLoading.
  ///
  /// In cs, this message translates to:
  /// **'Načítám ceny…'**
  String get storeLoading;

  /// No description provided for @unlockedLabel.
  ///
  /// In cs, this message translates to:
  /// **'Odemčeno'**
  String get unlockedLabel;

  /// No description provided for @buy.
  ///
  /// In cs, this message translates to:
  /// **'Koupit · {price}'**
  String buy(String price);

  /// No description provided for @notForSale.
  ///
  /// In cs, this message translates to:
  /// **'Zatím nejde koupit'**
  String get notForSale;

  /// No description provided for @purchasePending.
  ///
  /// In cs, this message translates to:
  /// **'Čeká na potvrzení…'**
  String get purchasePending;

  /// No description provided for @purchaseFailed.
  ///
  /// In cs, this message translates to:
  /// **'Nákup se nepovedl: {msg}'**
  String purchaseFailed(String msg);

  /// No description provided for @allPacksTitle.
  ///
  /// In cs, this message translates to:
  /// **'Všechny kuchyně'**
  String get allPacksTitle;

  /// No description provided for @allPacksBody.
  ///
  /// In cs, this message translates to:
  /// **'Odemkne všechny balíčky najednou, výhodněji než po jednom.'**
  String get allPacksBody;

  /// No description provided for @recipeCount.
  ///
  /// In cs, this message translates to:
  /// **'{n, plural, =0{recepty se připravují} one{{n} recept} few{{n} recepty} other{{n} receptů}}'**
  String recipeCount(int n);

  /// No description provided for @lockedTitle.
  ///
  /// In cs, this message translates to:
  /// **'Recept z balíčku {pack}'**
  String lockedTitle(String pack);

  /// No description provided for @lockedBody.
  ///
  /// In cs, this message translates to:
  /// **'Suroviny vidíš, postup a režim vaření se ukážou po odemčení balíčku.'**
  String get lockedBody;

  /// No description provided for @unlock.
  ///
  /// In cs, this message translates to:
  /// **'Odemknout'**
  String get unlock;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fi',
    'fr',
    'gu',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'kn',
    'ko',
    'ml',
    'mr',
    'ms',
    'nb',
    'nl',
    'or',
    'pa',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sl',
    'sv',
    'ta',
    'te',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'or':
      return AppLocalizationsOr();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sv':
      return AppLocalizationsSv();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
