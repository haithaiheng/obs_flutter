import 'package:get/get.dart';
import 'package:obs/app/modules/mybooks/providers/mybook_provider.dart';

class MybooksController extends GetxController {
  //TODO: Implement MybooksController

  final provider = Get.put(MybookProvider());
  final RxList _list = [].obs;
  RxList get list => _list;
  var _page = 1;
  var _total = 1;
  RxStatus status = RxStatus.loading();
  RxString isError = "".obs;
  final RxString _userLogin = ''.obs;
  @override
  void onInit() {
    _userLogin.value = Get.arguments;
    fetchMybooks(true);
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

  Future<void> fetchMybooks(bool firstLoad) async {
    try{
      if (firstLoad) {
        _page = 1;
      } else {
        _page += 1;
      }
        provider.fetchMybook(int.parse(_userLogin.value), _page).then((value) {
          if (value == 'argument missing'){
            status = RxStatus.error();
            isError('argument missing');
          }else if (value == 'empty'){
            status = RxStatus.success();
            Get.snackbar("message".tr, "no more data", snackPosition: SnackPosition.BOTTOM);
          }else{
            if (value is String){
              status = RxStatus.error();
              isError(value);
              print(value);
            }else{
              if (value['message'] == 'success') {
                status = RxStatus.success();
                if (_page > 1) {
                  var l = value['data'].map((e) => e).toList();
                  _list.addAll(l);
                } else {
                  _list.value = value['data'];
                }
                _total = value['page'];
              }
            }
          }
          update();
        });

    }catch(e){
      status = RxStatus.error();
      Get.snackbar("Error", e.toString());
    }
  }
}
