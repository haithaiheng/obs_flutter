import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  final _storage = GetStorage();
  final RxList _cart = [].obs;
  RxList get cart => _cart;
  final RxDouble _total = 0.0.obs;
  RxDouble get total => _total;
  var _userid = "0";

  final RxInt _num = 0.obs;
  RxInt get num => _num;

  @override
  void onInit() {
    // _storage.remove(('cart.$_userid'));
    getId();
    readCart();
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

  void addToCart(Map<String, dynamic> data) {
    // num++;
    var cart = _storage.read('cart.$_userid');
    List<dynamic> stored = [];
    if (cart == null) {
      stored.add(jsonEncode(data));
    } else {
      stored = _storage.read('cart.$_userid');
      stored.add(jsonEncode(data));
    }
    _cart.value = stored;
    _storage.write('cart.$_userid', stored);
    readCart();
    checkCart();
  }

  void readCart() {
    _total.value = 0;
    var cart = _storage.read('cart.$_userid');
    if (cart != null) {
      List<dynamic> stored = _storage.read('cart.$_userid');
      // print("read card: ${stored}");
      List<Map<String, dynamic>> l = [];
      for (var i = 0; i < stored.length; i++) {
        Map<String, dynamic> map = jsonDecode(stored[i]);
        _total.value += map['price'];
        l.add(map);
      }
      _cart.value = l;
      update();
    }
  }

  void removeCartItem(Map<String, dynamic> data) async {
    List<dynamic> stored = await _storage.read('cart.$_userid');
    if (stored.contains(jsonEncode(data))) {
      stored.remove(jsonEncode(data));
      _storage.write('cart.$_userid', stored);
      readCart();
    }
    checkCart();
  }

  void checkCart() async {
    _num.value = 0;
    var stored = await _storage.read('cart.$_userid');
    if (stored != null) {
      _num.value = stored.length;
    }
    update();
  }

  void getId(){
    final isLogin = _storage.read('login');
    _userid = isLogin['user_id'];
  }
}
