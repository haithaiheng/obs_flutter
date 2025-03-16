import 'package:get/get.dart';

import '../controllers/categories_details_controller.dart';

class CategoriesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesDetailsController>(
      () => CategoriesDetailsController(),
    );
  }
}
