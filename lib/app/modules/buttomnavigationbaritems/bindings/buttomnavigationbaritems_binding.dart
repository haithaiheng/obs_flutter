import 'package:get/get.dart';

import '../controllers/buttomnavigationbaritems_controller.dart';

class ButtomnavigationbaritemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ButtomnavigationbaritemsController>(
      () => ButtomnavigationbaritemsController(),
    );
  }
}
