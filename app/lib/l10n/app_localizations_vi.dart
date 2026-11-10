// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Papánek';

  @override
  String get tabCook => 'Nấu gì đây';

  @override
  String get tabPantry => 'Tủ bếp';

  @override
  String get tabShopping => 'Đi chợ';

  @override
  String get groupReady => 'Làm được ngay';

  @override
  String get groupMissing1 => 'Thiếu 1 thứ';

  @override
  String get groupMissing23 => 'Thiếu 2–3 thứ';

  @override
  String get groupMore => 'Cần mua thêm';

  @override
  String get emptyPantryHint =>
      'Thêm những gì bạn có ở nhà, mình sẽ gợi ý món bạn có thể nấu.';

  @override
  String get addToPantry => 'Thêm vào tủ bếp';

  @override
  String get searchIngredient => 'Bạn có gì? (vd: trứng, gạo)';

  @override
  String get pantryEmpty => 'Tủ bếp đang trống. Hãy thêm nguyên liệu đầu tiên.';

  @override
  String get pantryStaplesNote =>
      'Mình coi như bạn đã có muối, tiêu, dầu ăn và các nguyên liệu cơ bản khác.';

  @override
  String minutes(int n) {
    return '$n phút';
  }

  @override
  String servings(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n phần',
    );
    return '$_temp0';
  }

  @override
  String difficulty(String n) {
    String _temp0 = intl.Intl.selectLogic(n, {
      '1': 'dễ',
      '2': 'vừa sức',
      'other': 'khó hơn',
    });
    return '$_temp0';
  }

  @override
  String missingCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'thiếu $n',
      zero: 'đã đủ cả',
    );
    return '$_temp0';
  }

  @override
  String get ingredients => 'Nguyên liệu';

  @override
  String get steps => 'Cách làm';

  @override
  String get tips => 'Mẹo';

  @override
  String get optional => 'tùy chọn';

  @override
  String get toTaste => 'tùy khẩu vị';

  @override
  String get addMissingToShopping => 'Thêm đồ còn thiếu vào danh sách mua';

  @override
  String addedToShopping(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Đã thêm $n mục',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Nấu';

  @override
  String stepOf(int i, int n) {
    return 'Bước $i/$n';
  }

  @override
  String get next => 'Tiếp';

  @override
  String get back => 'Quay lại';

  @override
  String get done => 'Xong';

  @override
  String startTimer(String t) {
    return 'Bắt đầu hẹn giờ $t';
  }

  @override
  String get timerDone => 'Hết giờ!';

  @override
  String get cookedTitle => 'Chúc ngon miệng!';

  @override
  String get cookedBody =>
      'Nấu xong rồi. Xóa các nguyên liệu đã dùng khỏi tủ bếp?';

  @override
  String get removeUsed => 'Xóa';

  @override
  String get keep => 'Giữ lại';

  @override
  String get shoppingEmpty => 'Danh sách mua sắm đang trống.';

  @override
  String get checkout => 'Đã mua';

  @override
  String checkedOut(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n nguyên liệu đã vào tủ bếp',
    );
    return '$_temp0';
  }

  @override
  String get language => 'Ngôn ngữ công thức';

  @override
  String get noRecipes => 'Công thức vẫn đang được chuẩn bị.';

  @override
  String cuisine(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'czech': 'Séc',
      'italian': 'Ý',
      'vietnamese': 'Việt Nam',
      'asian': 'Châu Á',
      'mexmed': 'Mexico & Địa Trung Hải',
      'quick': 'Nhanh gọn',
      'family': 'Gia đình',
      'other': 'Khác',
    });
    return '$_temp0';
  }

  @override
  String category(String c) {
    String _temp0 = intl.Intl.selectLogic(c, {
      'zelenina': 'Rau củ',
      'ovoce': 'Trái cây',
      'houby': 'Nấm',
      'cerstve_bylinky': 'Rau thơm tươi',
      'maso': 'Thịt',
      'uzeniny': 'Thịt chế biến',
      'ryby': 'Cá',
      'mlecne': 'Sữa và chế phẩm',
      'vejce': 'Trứng',
      'rostlinne_bilkoviny': 'Đậu phụ và tương tự',
      'obiloviny': 'Ngũ cốc',
      'mouka': 'Bột',
      'testoviny': 'Mì ống',
      'pecivo': 'Bánh mì & bánh ngọt',
      'lusteniny': 'Đậu hạt',
      'orechy_seminka': 'Hạt & hạt giống',
      'susene_plody': 'Trái cây sấy',
      'koreni': 'Gia vị',
      'oleje_tuky': 'Dầu & mỡ',
      'ocet_omacky': 'Nước sốt & giấm',
      'sladidla': 'Chất tạo ngọt',
      'konzervy': 'Đồ hộp',
      'napoje': 'Đồ uống',
      'other': 'Khác',
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
      'ks': 'cái',
      'lzice': 'muỗng canh',
      'lzicka': 'muỗng cà phê',
      'hrnek': 'cốc',
      'strouzek': 'tép',
      'stipka': 'nhúm',
      'plechovka': 'lon',
      'svazek': 'bó',
      'hrst': 'nắm',
      'platek': 'lát',
      'dkg': 'dkg',
      'balicek': 'gói',
      'stonek': 'cọng',
      'snitka': 'nhánh',
      'kostka': 'viên',
      'hlava': 'củ',
      'oz': 'oz',
      'lb': 'lb',
      'other': '',
    });
    return '$_temp0';
  }
}
