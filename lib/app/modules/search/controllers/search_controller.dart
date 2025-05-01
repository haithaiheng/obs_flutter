import 'package:get/get.dart';
import 'package:obs/app/modules/search/providers/search_provider.dart';

class SearchBookController extends GetxController {
  //TODO: Implement SearchController

  final provider = Get.put(SearchProvider());
  final RxList _list = [].obs;
  RxList get list => _list;
  var _page = 1;
  var _total = 1;
  RxStatus status = RxStatus.loading();
  RxString isError = "".obs;
  @override
  void onInit() {
    fetchBooks("", true);
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

  Future<void> fetchBooks(String search, bool firstLoad) async {
    try{
      // print("page $_page, total $_total");
      if (_page > _total){
        return;
      }
      if (firstLoad) {
        _page = 1;
      } else {
        _page += 1;
      }
      provider.search(search, _page).then((value) {
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
          }else{
            if (value['message'] == 'success') {
              status = RxStatus.success();
              if (_page > 1) {
                var l = value['data'].map((e) => e).toList();
                _list.addAll(l);

              } else {
                _list.value = value['data'];
              }
              _total = value['total_page'];
            }
            // print(_list.toList());
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
