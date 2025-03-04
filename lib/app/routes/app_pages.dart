import 'package:get/get.dart';

import '../modules/book_details/bindings/book_details_binding.dart';
import '../modules/book_details/views/book_details_view.dart';
import '../modules/buttomnavigationbaritems/bindings/buttomnavigationbaritems_binding.dart';
import '../modules/buttomnavigationbaritems/views/buttomnavigationbaritems_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
      name: _Paths.BUTTOMNAVIGATIONBARITEMS,
      page: () => ButtomnavigationbaritemsView(),
      binding: ButtomnavigationbaritemsBinding(),
    ),
  ];
}
