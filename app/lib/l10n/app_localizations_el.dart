// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Τι να μαγειρέψω';

  @override
  String get tabPantry => 'Αποθήκη';

  @override
  String get tabShopping => 'Ψώνια';

  @override
  String get groupReady => 'Έτοιμο για μαγείρεμα';

  @override
  String get groupMissing1 => 'Λείπει 1 υλικό';

  @override
  String get groupMissing23 => 'Λείπουν 2–3 υλικά';

  @override
  String get groupMore => 'Θέλει ψώνια';

  @override
  String get emptyPantryHint =>
      'Πρόσθεσε ό,τι έχεις στο σπίτι και θα σου δείξω τι μπορείς να μαγειρέψεις.';

  @override
  String get addToPantry => 'Προσθήκη στην αποθήκη';

  @override
  String get searchIngredient => 'Τι έχεις; (π.χ. αυγά, ρύζι)';

  @override
  String get pantryEmpty => 'Η αποθήκη είναι άδεια. Πρόσθεσε το πρώτο υλικό.';

  @override
  String get pantryStaplesNote =>
      'Υποθέτω ότι έχεις αλάτι, πιπέρι, λάδι και άλλα βασικά.';

  @override
  String minutes(int n) {
    return '$n λεπτά';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n μερίδες',
      one: '$n μερίδα',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'εύκολο',
      '2': 'μέτριο',
      'other': 'πιο δύσκολο',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'λείπουν $n',
      one: 'λείπει $n',
      zero: 'έχεις τα πάντα',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Υλικά';

  @override
  String get steps => 'Εκτέλεση';

  @override
  String get tips => 'Συμβουλές';

  @override
  String get optional => 'προαιρετικό';

  @override
  String get toTaste => 'κατά βούληση';

  @override
  String get addMissingToShopping => 'Προσθήκη των ελλειπόντων στα ψώνια';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Προστέθηκαν $n είδη',
      one: 'Προστέθηκε $n είδος',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Μαγείρεμα';

  @override
  String stepOf(int i, int n) {
    return 'Βήμα $i από $n';
  }

  @override
  String get next => 'Επόμενο';

  @override
  String get back => 'Πίσω';

  @override
  String get done => 'Τέλος';

  @override
  String startTimer(String t) {
    return 'Εκκίνηση χρονομέτρου $t';
  }

  @override
  String get timerDone => 'Ο χρόνος τελείωσε!';

  @override
  String get cookedTitle => 'Καλή όρεξη!';

  @override
  String get cookedBody =>
      'Το φαγητό είναι έτοιμο. Να αφαιρεθούν τα υλικά που χρησιμοποιήθηκαν από την αποθήκη;';

  @override
  String get removeUsed => 'Αφαίρεση';

  @override
  String get keep => 'Να μείνουν';

  @override
  String get shoppingEmpty => 'Η λίστα αγορών είναι άδεια.';

  @override
  String get checkout => 'Αγοράστηκαν';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n υλικά είναι στην αποθήκη',
      one: '$n υλικό είναι στην αποθήκη',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Γλώσσα συνταγών';

  @override
  String get noRecipes => 'Οι συνταγές ετοιμάζονται ακόμη.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Τσέχικη',
      'italian': 'Ιταλική',
      'vietnamese': 'Βιετναμέζικη',
      'asian': 'Ασιατική',
      'mexmed': 'Μεξικάνικη και μεσογειακή',
      'quick': 'Γρήγορη',
      'family': 'Οικογενειακή',
      'other': 'Άλλα',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Λαχανικά',
      'ovoce': 'Φρούτα',
      'houby': 'Μανιτάρια',
      'cerstve_bylinky': 'Φρέσκα μυρωδικά',
      'maso': 'Κρέας',
      'uzeniny': 'Αλλαντικά',
      'ryby': 'Ψάρια',
      'mlecne': 'Γαλακτοκομικά',
      'vejce': 'Αυγά',
      'rostlinne_bilkoviny': 'Τόφου και συναφή',
      'obiloviny': 'Δημητριακά',
      'mouka': 'Αλεύρι',
      'testoviny': 'Ζυμαρικά',
      'pecivo': 'Ψωμί και αρτοσκευάσματα',
      'lusteniny': 'Όσπρια',
      'orechy_seminka': 'Ξηροί καρποί και σπόροι',
      'susene_plody': 'Αποξηραμένα φρούτα',
      'koreni': 'Μπαχαρικά',
      'oleje_tuky': 'Λάδια και λιπαρά',
      'ocet_omacky': 'Σάλτσες και ξίδι',
      'sladidla': 'Γλυκαντικά',
      'konzervy': 'Κονσέρβες',
      'napoje': 'Ποτά',
      'other': 'Άλλα',
    });
    return '$_temp0';
  }

  @override
  String unit(String u) {
    String _temp0 = intl.Intl.selectLogic(u, {
      'g': 'γρ.',
      'kg': 'κιλό',
      'ml': 'ml',
      'l': 'l',
      'dl': 'dl',
      'cl': 'cl',
      'ks': 'τμχ',
      'lzice': 'κ.σ.',
      'lzicka': 'κ.γ.',
      'hrnek': 'φλιτζάνι',
      'strouzek': 'σκελίδα',
      'stipka': 'πρέζα',
      'plechovka': 'κουτί',
      'svazek': 'ματσάκι',
      'hrst': 'χούφτα',
      'platek': 'φέτα',
      'dkg': 'dkg',
      'balicek': 'πακέτο',
      'stonek': 'κοτσάνι',
      'snitka': 'κλωναράκι',
      'kostka': 'κύβος',
      'hlava': 'κεφάλι',
      'oz': 'oz',
      'lb': 'lb',
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
