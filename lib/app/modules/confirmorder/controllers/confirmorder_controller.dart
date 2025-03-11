import 'package:get/get.dart';
import 'package:obs/app/modules/confirmorder/providers/confirmorder_provider_provider.dart';

class ConfirmorderController extends GetxController {
  //TODO: Implement ConfirmorderController

  final provider = ConfirmorderProviderProvider();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
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

  void setLoading(bool loadingValue) {
    _isLoading = loadingValue;
    update();
  }

  Future<void> orderBook(body) async {
    setLoading(true);
    provider.orderBooks(body).then((value) {
      if (value['message'] == 'success') {
        setLoading(false);
        // Get.to(MybooksView());
      } else {
        print(value['message']);
      }
    }, onError: (error) {
      setLoading(true);
      Get.snackbar("message", error.toString());
    });
  }
}
