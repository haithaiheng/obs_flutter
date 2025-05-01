import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/modules/home/controllers/home_controller.dart';

class WishlistController extends GetxController {
  //TODO: Implement WishlistController

  final _storage = GetStorage();
  final RxList _wishlist = [].obs;
  RxList get wishlist => _wishlist;
  var _userid = "0";

  final RxInt _num = 0.obs;
  RxInt get num => _num;
  final _homecontroller = Get.put(HomeController());

  @override
  void onInit() {
    // _storage.remove(('cart.$_userid'));
    getId();
    readWishlist();
    print("wishlist init");
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

  void addToWishList(Map<String, dynamic> data) {
    // num++;
    var cart = _storage.read('wishlist.$_userid');
    List<dynamic> stored = [];
    if (cart == null) {
      stored.add(jsonEncode(data));
    } else {
      stored = _storage.read('wishlist.$_userid');
      stored.add(jsonEncode(data));
    }
    _wishlist.value = stored;
    _storage.write('wishlist.$_userid', stored);
    update();
    readWishlist();
  }

  Future<void> readWishlist() async {
    var wishlist = _storage.read('wishlist.$_userid');
    if (wishlist != null) {
      List<dynamic> stored = await _storage.read('wishlist.$_userid');
      // print("read card: ${stored}");
      List<Map<String, dynamic>> l = [];
      l.clear();
      for (var i = 0; i < stored.length; i++) {
        Map<String, dynamic> map = jsonDecode(stored[i]);
        l.add(map);
      }
      _wishlist.value = l;
      update();
    }
  }

  void removeWishlistItem(Map<String, dynamic> data) async {
    List<dynamic> stored = await _storage.read('wishlist.$_userid');
    if (stored.contains(jsonEncode(data))) {
      stored.remove(jsonEncode(data));
      _storage.write('wishlist.$_userid', stored);
      readWishlist();
    }
  }

  void getId(){
    final isLogin = _storage.read('login');
    _userid = isLogin['user_id'];
  }

  void bookmarkAction(String id){
    _homecontroller.wishList.remove(id);
    _homecontroller.getCategory();
  }
}
