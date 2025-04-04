import 'package:get/get.dart';
import 'package:obs/app/modules/users/bindings/users_binding.dart';
import 'package:obs/app/modules/users/views/users_view.dart';

import '../modules/book/bindings/book_binding.dart';
import '../modules/book/views/book_view.dart';
import '../modules/book_details/bindings/book_details_binding.dart';
import '../modules/book_details/views/book_details_view.dart';
import '../modules/categories_details/bindings/categories_details_binding.dart';
import '../modules/categories_details/views/categories_details_view.dart';
import '../modules/confirmorder/bindings/confirmorder_binding.dart';
import '../modules/confirmorder/views/confirmorder_view.dart';
import '../modules/forgot/bindings/forgot_binding.dart';
import '../modules/forgot/views/forgot_view.dart';
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
import '../modules/reset_passowrd/bindings/reset_passowrd_binding.dart';
import '../modules/reset_passowrd/views/reset_passowrd_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/verify/bindings/verify_binding.dart';
import '../modules/verify/views/verify_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

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
    GetPage(
      name: _Paths.BOOK,
      page: () => const BookView(),
      binding: BookBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT,
      page: () => const ForgotView(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY,
      page: () => const VerifyView(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSOWRD,
      page: () => const ResetPassowrdView(),
      binding: ResetPassowrdBinding(),
    ),
    GetPage(
      name: _Paths.USERS,
      page: () => const UsersView(),
      binding: UsersBinding(),
    ),
  ];
}
