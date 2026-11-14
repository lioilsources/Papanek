// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'O que cozinhar';

  @override
  String get tabPantry => 'Despensa';

  @override
  String get tabShopping => 'Compras';

  @override
  String get groupReady => 'Dá para fazer agora';

  @override
  String get groupMissing1 => 'Falta 1 item';

  @override
  String get groupMissing23 => 'Faltam 2–3 itens';

  @override
  String get groupMore => 'Precisa comprar';

  @override
  String get emptyPantryHint =>
      'Adicione o que você tem em casa e eu mostro o que dá para cozinhar.';

  @override
  String get addToPantry => 'Adicionar à despensa';

  @override
  String get searchIngredient => 'O que você tem? (ex.: ovos, arroz)';

  @override
  String get pantryEmpty =>
      'A despensa está vazia. Adicione o primeiro ingrediente.';

  @override
  String get pantryStaplesNote =>
      'Presumo que você tenha sal, pimenta, óleo e outros itens básicos.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n porções',
      one: '$n porção',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'fácil',
      '2': 'razoável',
      'other': 'mais difícil',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'faltam $n',
      one: 'falta $n',
      zero: 'você tem tudo',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingredientes';

  @override
  String get steps => 'Modo de preparo';

  @override
  String get tips => 'Dicas';

  @override
  String get optional => 'opcional';

  @override
  String get toTaste => 'a gosto';

  @override
  String get addMissingToShopping => 'Adicionar o que falta às compras';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n itens adicionados',
      one: '$n item adicionado',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Cozinhar';

  @override
  String stepOf(int i, int n) {
    return 'Passo $i de $n';
  }

  @override
  String get next => 'Próximo';

  @override
  String get back => 'Voltar';

  @override
  String get done => 'Concluir';

  @override
  String startTimer(String t) {
    return 'Iniciar timer $t';
  }

  @override
  String get timerDone => 'Acabou o tempo!';

  @override
  String get cookedTitle => 'Bom apetite!';

  @override
  String get cookedBody =>
      'Tudo pronto. Remover da despensa os ingredientes usados?';

  @override
  String get removeUsed => 'Remover';

  @override
  String get keep => 'Manter';

  @override
  String get shoppingEmpty => 'Sua lista de compras está vazia.';

  @override
  String get checkout => 'Comprado';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingredientes estão na despensa',
      one: '$n ingrediente está na despensa',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Idioma das receitas';

  @override
  String get noRecipes => 'As receitas ainda estão sendo preparadas.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Tcheca',
      'italian': 'Italiana',
      'vietnamese': 'Vietnamita',
      'asian': 'Asiática',
      'mexmed': 'Mexicana e mediterrânea',
      'quick': 'Rápida',
      'family': 'Em família',
      'other': 'Outras',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Legumes e verduras',
      'ovoce': 'Frutas',
      'houby': 'Cogumelos',
      'cerstve_bylinky': 'Ervas frescas',
      'maso': 'Carnes',
      'uzeniny': 'Frios e embutidos',
      'ryby': 'Peixes',
      'mlecne': 'Laticínios',
      'vejce': 'Ovos',
      'rostlinne_bilkoviny': 'Tofu e afins',
      'obiloviny': 'Grãos',
      'mouka': 'Farinha',
      'testoviny': 'Massas',
      'pecivo': 'Pães e padaria',
      'lusteniny': 'Leguminosas',
      'orechy_seminka': 'Castanhas e sementes',
      'susene_plody': 'Frutas secas',
      'koreni': 'Temperos',
      'oleje_tuky': 'Óleos e gorduras',
      'ocet_omacky': 'Molhos e vinagre',
      'sladidla': 'Adoçantes',
      'konzervy': 'Enlatados',
      'napoje': 'Bebidas',
      'other': 'Outros',
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
      'ks': 'un.',
      'lzice': 'colher de sopa',
      'lzicka': 'colher de chá',
      'hrnek': 'xícara',
      'strouzek': 'dente',
      'stipka': 'pitada',
      'plechovka': 'lata',
      'svazek': 'maço',
      'hrst': 'punhado',
      'platek': 'fatia',
      'dkg': 'dag',
      'balicek': 'pacote',
      'stonek': 'talo',
      'snitka': 'ramo',
      'kostka': 'cubo',
      'hlava': 'cabeça',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Cozinhas';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get restoreStarted => 'Restaurando compras…';

  @override
  String get storeUnavailable =>
      'A loja não está disponível agora. Tente de novo mais tarde quando estiver online.';

  @override
  String get storeLoading => 'Carregando preços…';

  @override
  String get unlockedLabel => 'Desbloqueado';

  @override
  String buy(String price) {
    return 'Comprar · $price';
  }

  @override
  String get notForSale => 'Ainda não disponível';

  @override
  String get purchasePending => 'Aguardando confirmação…';

  @override
  String purchaseFailed(String msg) {
    return 'A compra falhou: $msg';
  }

  @override
  String get allPacksTitle => 'Todas as cozinhas';

  @override
  String get allPacksBody =>
      'Desbloqueia todos os pacotes de uma vez, mais barato que um por um.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n receitas',
      one: '$n receita',
      zero: 'receitas em preparação',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Receita do pacote $pack';
  }

  @override
  String get lockedBody =>
      'Você já vê os ingredientes; o passo a passo e o modo cozinhar são liberados com o pacote.';

  @override
  String get unlock => 'Desbloquear';

  @override
  String get settings => 'Definições';

  @override
  String get statsToggle => 'Estatísticas anónimas';

  @override
  String get statsToggleBody =>
      'Ajudam a melhorar a app. Sem identificadores, nada do que escreves.';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'O que cozinhar';

  @override
  String get tabPantry => 'Despensa';

  @override
  String get tabShopping => 'Compras';

  @override
  String get groupReady => 'Dá para fazer agora';

  @override
  String get groupMissing1 => 'Falta 1 item';

  @override
  String get groupMissing23 => 'Faltam 2–3 itens';

  @override
  String get groupMore => 'Precisa comprar';

  @override
  String get emptyPantryHint =>
      'Adicione o que você tem em casa e eu mostro o que dá para cozinhar.';

  @override
  String get addToPantry => 'Adicionar à despensa';

  @override
  String get searchIngredient => 'O que você tem? (ex.: ovos, arroz)';

  @override
  String get pantryEmpty =>
      'A despensa está vazia. Adicione o primeiro ingrediente.';

  @override
  String get pantryStaplesNote =>
      'Presumo que você tenha sal, pimenta, óleo e outros itens básicos.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n porções',
      one: '$n porção',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'fácil',
      '2': 'razoável',
      'other': 'mais difícil',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'faltam $n',
      one: 'falta $n',
      zero: 'você tem tudo',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingredientes';

  @override
  String get steps => 'Modo de preparo';

  @override
  String get tips => 'Dicas';

  @override
  String get optional => 'opcional';

  @override
  String get toTaste => 'a gosto';

  @override
  String get addMissingToShopping => 'Adicionar o que falta às compras';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n itens adicionados',
      one: '$n item adicionado',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Cozinhar';

  @override
  String stepOf(int i, int n) {
    return 'Passo $i de $n';
  }

  @override
  String get next => 'Próximo';

  @override
  String get back => 'Voltar';

  @override
  String get done => 'Concluir';

  @override
  String startTimer(String t) {
    return 'Iniciar timer $t';
  }

  @override
  String get timerDone => 'Acabou o tempo!';

  @override
  String get cookedTitle => 'Bom apetite!';

  @override
  String get cookedBody =>
      'Tudo pronto. Remover da despensa os ingredientes usados?';

  @override
  String get removeUsed => 'Remover';

  @override
  String get keep => 'Manter';

  @override
  String get shoppingEmpty => 'Sua lista de compras está vazia.';

  @override
  String get checkout => 'Comprado';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingredientes estão na despensa',
      one: '$n ingrediente está na despensa',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Idioma das receitas';

  @override
  String get noRecipes => 'As receitas ainda estão sendo preparadas.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Tcheca',
      'italian': 'Italiana',
      'vietnamese': 'Vietnamita',
      'asian': 'Asiática',
      'mexmed': 'Mexicana e mediterrânea',
      'quick': 'Rápida',
      'family': 'Em família',
      'other': 'Outras',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Legumes e verduras',
      'ovoce': 'Frutas',
      'houby': 'Cogumelos',
      'cerstve_bylinky': 'Ervas frescas',
      'maso': 'Carnes',
      'uzeniny': 'Frios e embutidos',
      'ryby': 'Peixes',
      'mlecne': 'Laticínios',
      'vejce': 'Ovos',
      'rostlinne_bilkoviny': 'Tofu e afins',
      'obiloviny': 'Grãos',
      'mouka': 'Farinha',
      'testoviny': 'Massas',
      'pecivo': 'Pães e padaria',
      'lusteniny': 'Leguminosas',
      'orechy_seminka': 'Castanhas e sementes',
      'susene_plody': 'Frutas secas',
      'koreni': 'Temperos',
      'oleje_tuky': 'Óleos e gorduras',
      'ocet_omacky': 'Molhos e vinagre',
      'sladidla': 'Adoçantes',
      'konzervy': 'Enlatados',
      'napoje': 'Bebidas',
      'other': 'Outros',
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
      'ks': 'un.',
      'lzice': 'colher de sopa',
      'lzicka': 'colher de chá',
      'hrnek': 'xícara',
      'strouzek': 'dente',
      'stipka': 'pitada',
      'plechovka': 'lata',
      'svazek': 'maço',
      'hrst': 'punhado',
      'platek': 'fatia',
      'dkg': 'dag',
      'balicek': 'pacote',
      'stonek': 'talo',
      'snitka': 'ramo',
      'kostka': 'cubo',
      'hlava': 'cabeça',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Cozinhas';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get restoreStarted => 'Restaurando compras…';

  @override
  String get storeUnavailable =>
      'A loja não está disponível agora. Tente de novo mais tarde quando estiver online.';

  @override
  String get storeLoading => 'Carregando preços…';

  @override
  String get unlockedLabel => 'Desbloqueado';

  @override
  String buy(String price) {
    return 'Comprar · $price';
  }

  @override
  String get notForSale => 'Ainda não disponível';

  @override
  String get purchasePending => 'Aguardando confirmação…';

  @override
  String purchaseFailed(String msg) {
    return 'A compra falhou: $msg';
  }

  @override
  String get allPacksTitle => 'Todas as cozinhas';

  @override
  String get allPacksBody =>
      'Desbloqueia todos os pacotes de uma vez, mais barato que um por um.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n receitas',
      one: '$n receita',
      zero: 'receitas em preparação',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Receita do pacote $pack';
  }

  @override
  String get lockedBody =>
      'Você já vê os ingredientes; o passo a passo e o modo cozinhar são liberados com o pacote.';

  @override
  String get unlock => 'Desbloquear';

  @override
  String get settings => 'Configurações';

  @override
  String get statsToggle => 'Estatísticas anônimas';

  @override
  String get statsToggleBody =>
      'Ajudam a melhorar o app. Sem identificadores, nada do que você digita.';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'O que cozinhar';

  @override
  String get tabPantry => 'Despensa';

  @override
  String get tabShopping => 'Compras';

  @override
  String get groupReady => 'Pode fazer já';

  @override
  String get groupMissing1 => 'Falta 1 item';

  @override
  String get groupMissing23 => 'Faltam 2–3 itens';

  @override
  String get groupMore => 'É preciso comprar';

  @override
  String get emptyPantryHint =>
      'Adicione o que tem em casa e eu mostro-lhe o que pode cozinhar.';

  @override
  String get addToPantry => 'Adicionar à despensa';

  @override
  String get searchIngredient => 'O que tem em casa? (p. ex., ovos, arroz)';

  @override
  String get pantryEmpty =>
      'A despensa está vazia. Adicione o primeiro ingrediente.';

  @override
  String get pantryStaplesNote =>
      'Presumo que tem sal, pimenta, azeite e outros produtos básicos.';

  @override
  String minutes(int n) {
    return '$n min';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n doses',
      one: '$n dose',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'fácil',
      '2': 'razoável',
      'other': 'mais difícil',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'faltam $n',
      one: 'falta $n',
      zero: 'tem tudo',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Ingredientes';

  @override
  String get steps => 'Preparação';

  @override
  String get tips => 'Dicas';

  @override
  String get optional => 'opcional';

  @override
  String get toTaste => 'a gosto';

  @override
  String get addMissingToShopping => 'Adicionar o que falta às compras';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n artigos adicionados',
      one: '$n artigo adicionado',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Cozinhar';

  @override
  String stepOf(int i, int n) {
    return 'Passo $i de $n';
  }

  @override
  String get next => 'Seguinte';

  @override
  String get back => 'Voltar';

  @override
  String get done => 'Concluir';

  @override
  String startTimer(String t) {
    return 'Iniciar temporizador $t';
  }

  @override
  String get timerDone => 'O tempo acabou!';

  @override
  String get cookedTitle => 'Bom apetite!';

  @override
  String get cookedBody =>
      'Está tudo cozinhado. Remover da despensa os ingredientes utilizados?';

  @override
  String get removeUsed => 'Remover';

  @override
  String get keep => 'Manter';

  @override
  String get shoppingEmpty => 'A sua lista de compras está vazia.';

  @override
  String get checkout => 'Comprado';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ingredientes estão na despensa',
      one: '$n ingrediente está na despensa',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Idioma das receitas';

  @override
  String get noRecipes => 'As receitas ainda estão a ser preparadas.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Checa',
      'italian': 'Italiana',
      'vietnamese': 'Vietnamita',
      'asian': 'Asiática',
      'mexmed': 'Mexicana e mediterrânica',
      'quick': 'Rápida',
      'family': 'Familiar',
      'other': 'Outras',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Legumes e hortaliças',
      'ovoce': 'Fruta',
      'houby': 'Cogumelos',
      'cerstve_bylinky': 'Ervas frescas',
      'maso': 'Carne',
      'uzeniny': 'Charcutaria',
      'ryby': 'Peixe',
      'mlecne': 'Lacticínios',
      'vejce': 'Ovos',
      'rostlinne_bilkoviny': 'Tofu e afins',
      'obiloviny': 'Cereais',
      'mouka': 'Farinha',
      'testoviny': 'Massas',
      'pecivo': 'Pão e pastelaria',
      'lusteniny': 'Leguminosas',
      'orechy_seminka': 'Frutos secos e sementes',
      'susene_plody': 'Fruta seca',
      'koreni': 'Especiarias',
      'oleje_tuky': 'Óleos e gorduras',
      'ocet_omacky': 'Molhos e vinagre',
      'sladidla': 'Adoçantes',
      'konzervy': 'Conservas',
      'napoje': 'Bebidas',
      'other': 'Outros',
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
      'ks': 'un.',
      'lzice': 'colher de sopa',
      'lzicka': 'colher de chá',
      'hrnek': 'chávena',
      'strouzek': 'dente',
      'stipka': 'pitada',
      'plechovka': 'lata',
      'svazek': 'molho',
      'hrst': 'punhado',
      'platek': 'fatia',
      'dkg': 'dag',
      'balicek': 'pacote',
      'stonek': 'talo',
      'snitka': 'raminho',
      'kostka': 'cubo',
      'hlava': 'cabeça',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => 'Cozinhas';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get restoreStarted => 'A restaurar compras…';

  @override
  String get storeUnavailable =>
      'A loja não está disponível agora. Tenta novamente mais tarde quando estiveres online.';

  @override
  String get storeLoading => 'A carregar preços…';

  @override
  String get unlockedLabel => 'Desbloqueado';

  @override
  String buy(String price) {
    return 'Comprar · $price';
  }

  @override
  String get notForSale => 'Ainda não disponível';

  @override
  String get purchasePending => 'A aguardar confirmação…';

  @override
  String purchaseFailed(String msg) {
    return 'A compra falhou: $msg';
  }

  @override
  String get allPacksTitle => 'Todas as cozinhas';

  @override
  String get allPacksBody =>
      'Desbloqueia todos os pacotes de uma vez, mais barato do que um a um.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n receitas',
      one: '$n receita',
      zero: 'receitas em preparação',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return 'Receita do pacote $pack';
  }

  @override
  String get lockedBody =>
      'Já vês os ingredientes; os passos e o modo cozinhar desbloqueiam-se com o pacote.';

  @override
  String get unlock => 'Desbloquear';

  @override
  String get settings => 'Definições';

  @override
  String get statsToggle => 'Estatísticas anónimas';

  @override
  String get statsToggleBody =>
      'Ajudam a melhorar a app. Sem identificadores, nada do que escreves.';
}
