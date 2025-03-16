import 'package:get/get.dart';

import '../controllers/pdf_viewers_controller.dart';

class PdfViewersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfViewersController>(
      () => PdfViewersController(),
    );
  }
}
