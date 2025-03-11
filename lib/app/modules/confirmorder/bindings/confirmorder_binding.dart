import 'package:get/get.dart';

import '../controllers/confirmorder_controller.dart';

class ConfirmorderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmorderController>(
      () => ConfirmorderController(),
    );
  }
}
