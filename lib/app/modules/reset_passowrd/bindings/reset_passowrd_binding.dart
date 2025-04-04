import 'package:get/get.dart';

import '../controllers/reset_passowrd_controller.dart';

class ResetPassowrdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPassowrdController>(
      () => ResetPassowrdController(),
    );
  }
}
