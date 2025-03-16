import 'package:get/get.dart';
import 'package:obs/app/modules/mybooks/providers/mybook_provider.dart';

class MybooksController extends GetxController {
  //TODO: Implement MybooksController

  final provider = Get.put(MybookProvider());
  final RxList _list = [].obs;
  RxList get list => _list;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchMybooks();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<dynamic> fetchMybooks() async {
    provider.fetchMybook().then((value) {
      if (value.length > 0) {
        _list.value = value;
        update();
      } else {
        Get.snackbar("message", value);
      }
    });
  }
}
