import 'package:get/get.dart';
import 'package:obs/app/modules/cart/views/cart_view.dart';
import 'package:obs/app/modules/home/views/home_view.dart';
import 'package:obs/app/modules/users/views/users_view.dart';
import 'package:obs/app/modules/wishlist/views/wishlist_view.dart';

class MainScreenController extends GetxController {
  //TODO: Implement MainScreenController

  final count = 0.obs;

  var isSelectIndex = 0.obs;

  final List pages = [
    HomeView(),
    WishlistView(),
    CartView(),
    UsersView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
