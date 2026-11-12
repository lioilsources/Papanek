// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => '뭘 만들까';

  @override
  String get tabPantry => '식재료';

  @override
  String get tabShopping => '장보기';

  @override
  String get groupReady => '바로 만들 수 있어요';

  @override
  String get groupMissing1 => '재료 1개 부족';

  @override
  String get groupMissing23 => '재료 2~3개 부족';

  @override
  String get groupMore => '장을 봐야 해요';

  @override
  String get emptyPantryHint => '집에 있는 재료를 추가하면 만들 수 있는 요리를 보여 드려요.';

  @override
  String get addToPantry => '식재료에 추가';

  @override
  String get searchIngredient => '집에 뭐가 있나요? (예: 달걀, 쌀)';

  @override
  String get pantryEmpty => '식재료가 비어 있어요. 첫 번째 재료를 추가해 보세요.';

  @override
  String get pantryStaplesNote => '소금, 후추, 기름 등 기본 재료는 집에 있다고 가정해요.';

  @override
  String minutes(int n) {
    return '$n분';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(n, locale: localeName, other: '$n인분');
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': '쉬움',
      '2': '보통',
      'other': '조금 어려움',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n개 부족',
      zero: '모두 있어요',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => '재료';

  @override
  String get steps => '조리 방법';

  @override
  String get tips => '팁';

  @override
  String get optional => '선택';

  @override
  String get toTaste => '기호에 맞게';

  @override
  String get addMissingToShopping => '부족한 재료를 장보기에 추가';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n개 항목을 추가했어요',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => '요리하기';

  @override
  String stepOf(int i, int n) {
    return '$n단계 중 $i단계';
  }

  @override
  String get next => '다음';

  @override
  String get back => '뒤로';

  @override
  String get done => '완료';

  @override
  String startTimer(String t) {
    return '타이머 $t 시작';
  }

  @override
  String get timerDone => '시간이 다 됐어요!';

  @override
  String get cookedTitle => '맛있게 드세요!';

  @override
  String get cookedBody => '요리를 마쳤어요. 사용한 재료를 식재료에서 삭제할까요?';

  @override
  String get removeUsed => '삭제';

  @override
  String get keep => '유지';

  @override
  String get shoppingEmpty => '장보기 목록이 비어 있어요.';

  @override
  String get checkout => '구매 완료';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '재료 $n개를 식재료에 추가했어요',
    );
    return '$_temp0';
  }

  @override
  String get language => '레시피 언어';

  @override
  String get noRecipes => '레시피를 준비하고 있어요.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': '체코 요리',
      'italian': '이탈리아 요리',
      'vietnamese': '베트남 요리',
      'asian': '아시아 요리',
      'mexmed': '멕시코·지중해 요리',
      'quick': '간편 요리',
      'family': '가족 요리',
      'other': '기타',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': '채소',
      'ovoce': '과일',
      'houby': '버섯',
      'cerstve_bylinky': '생허브',
      'maso': '고기',
      'uzeniny': '육가공품',
      'ryby': '생선',
      'mlecne': '유제품',
      'vejce': '달걀',
      'rostlinne_bilkoviny': '두부 등',
      'obiloviny': '곡물',
      'mouka': '밀가루',
      'testoviny': '파스타',
      'pecivo': '빵·베이커리',
      'lusteniny': '콩류',
      'orechy_seminka': '견과·씨앗',
      'susene_plody': '말린 과일',
      'koreni': '향신료',
      'oleje_tuky': '기름·지방',
      'ocet_omacky': '소스·식초',
      'sladidla': '감미료',
      'konzervy': '통조림',
      'napoje': '음료',
      'other': '기타',
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
      'ks': '개',
      'lzice': '큰술',
      'lzicka': '작은술',
      'hrnek': '컵',
      'strouzek': '쪽',
      'stipka': '꼬집',
      'plechovka': '캔',
      'svazek': '단',
      'hrst': '줌',
      'platek': '장',
      'dkg': 'dkg',
      'balicek': '팩',
      'stonek': '줄기',
      'snitka': '가지',
      'kostka': '큐브',
      'hlava': '통',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get tabShop => '요리 종류';

  @override
  String get restorePurchases => '구매 복원';

  @override
  String get restoreStarted => '구매를 복원하는 중…';

  @override
  String get storeUnavailable => '지금은 스토어를 사용할 수 없습니다. 온라인일 때 다시 시도하세요.';

  @override
  String get storeLoading => '가격 불러오는 중…';

  @override
  String get unlockedLabel => '잠금 해제됨';

  @override
  String buy(String price) {
    return '구매 · $price';
  }

  @override
  String get notForSale => '아직 구매할 수 없음';

  @override
  String get purchasePending => '확인 대기 중…';

  @override
  String purchaseFailed(String msg) {
    return '구매 실패: $msg';
  }

  @override
  String get allPacksTitle => '모든 요리 종류';

  @override
  String get allPacksBody => '모든 팩을 한 번에 잠금 해제합니다. 하나씩 사는 것보다 저렴해요.';

  @override
  String recipeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '레시피 $n개',
      zero: '레시피 준비 중',
    );
    return '$_temp0';
  }

  @override
  String lockedTitle(String pack) {
    return '$pack 팩의 레시피';
  }

  @override
  String get lockedBody => '재료는 볼 수 있어요. 조리 단계와 요리 모드는 팩과 함께 열립니다.';

  @override
  String get unlock => '잠금 해제';
}
