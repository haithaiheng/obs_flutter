import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:obs/app/Models/category_model.dart';
import 'package:obs/app/modules/providers/category_provider.dart';

class HomeController extends GetxController with StateMixin {
  final isAppbar = false.obs;
  final searchs = TextEditingController();
  final count = 0.obs;
  var isLoading = true.obs;
  var isError = false.obs;
  var categories = <CategoriesModel>[].obs;

  void increment() => count.value++;
  void toggleBarSearch() => isAppbar.toggle();

  @override
  void onInit() {
    super.onInit();
    CategoryProvider().getCategories().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onClose() {
    super.onClose();
    searchs.dispose();
  }
}
