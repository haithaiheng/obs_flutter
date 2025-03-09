import 'package:get/get.dart';

import '../modules/book_details/bindings/book_details_binding.dart';
import '../modules/book_details/views/book_details_view.dart';
import '../modules/confirmorder/bindings/confirmorder_binding.dart';
import '../modules/confirmorder/views/confirmorder_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mainScreen/bindings/main_screen_binding.dart';
import '../modules/mainScreen/views/main_screen_view.dart';
import '../modules/mybooks/bindings/mybooks_binding.dart';
import '../modules/mybooks/views/mybooks_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DETAILS,
      page: () => BookDetailsView(),
      binding: BookDetailsBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_SCREEN,
      page: () => MainScreenView(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: _Paths.MYBOOKS,
      page: () => const MybooksView(),
      binding: MybooksBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRMORDER,
      page: () => const ConfirmorderView(),
      binding: ConfirmorderBinding(),
    ),
  ];
}
