import 'package:get/get.dart';

import '../controllers/paywithbakong_controller.dart';

class PaywithbakongBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaywithbakongController>(
      () => PaywithbakongController(),
    );
  }
}
