import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/modules/confirmorder/providers/confirmorder_provider_provider.dart';
import 'package:obs/app/modules/mybooks/views/mybooks_view.dart';

class ConfirmorderController extends GetxController {
  //TODO: Implement ConfirmorderController

  final provider = ConfirmorderProviderProvider();
  final _storage = GetStorage();
  bool _isLoading = true;
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
    // print(jsonEncode(body));
    setLoading(true);
    provider.orderBooks(body).then((value) async {
      if (value['message'] == 'success') {
        setLoading(false);
        await _storage.remove('cart');
        Get.offAll(MybooksView());
      } else {
        print(value['message']);
      }
    }, onError: (error) {
      setLoading(true);
      print(error.toString());
      Get.snackbar("message", "Order failed");
    });
  }
}
