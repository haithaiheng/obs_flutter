import 'dart:convert';

import 'package:get/get.dart';
import 'package:obs/app/modules/cart/controllers/cart_controller.dart';
import 'package:obs/app/modules/cart/views/cart_view.dart';
import 'package:obs/app/modules/home/views/home_view.dart';
import 'package:obs/app/modules/users/views/users_view.dart';
import 'package:obs/app/modules/wishlist/views/wishlist_view.dart';

class MainScreenController extends GetxController {
  //TODO: Implement MainScreenController

  final count = 0.obs;

  var isSelectIndex = 0.obs;
  final cartController = Get.put(CartController());
  Rx<RxInt> get num => cartController.num.obs;

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
    cartController.checkCart();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
