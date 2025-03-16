import 'package:get/get.dart';

import '../modules/book_details/bindings/book_details_binding.dart';
import '../modules/book_details/views/book_details_view.dart';
import '../modules/categories_details/bindings/categories_details_binding.dart';
import '../modules/categories_details/views/categories_details_view.dart';
import '../modules/confirmorder/bindings/confirmorder_binding.dart';
import '../modules/confirmorder/views/confirmorder_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mainScreen/bindings/main_screen_binding.dart';
import '../modules/mainScreen/views/main_screen_view.dart';
import '../modules/mybooks/bindings/mybooks_binding.dart';
import '../modules/mybooks/views/mybooks_view.dart';
import '../modules/paywithbakong/bindings/paywithbakong_binding.dart';
import '../modules/paywithbakong/views/paywithbakong_view.dart';
import '../modules/pdf_viewers/bindings/pdf_viewers_binding.dart';
import '../modules/pdf_viewers/views/pdf_viewers_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

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
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PAYWITHBAKONG,
      page: () => const PaywithbakongView(),
      binding: PaywithbakongBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES_DETAILS,
      page: () => CategoriesDetailsView(),
      binding: CategoriesDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.PDF_VIEWERS,
      page: () => PdfViewersView(),
      binding: PdfViewersBinding(),
    ),
  ];
}
