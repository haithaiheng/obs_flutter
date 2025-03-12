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
  RxInt num = 1.obs;

  @override
  void onInit() {
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

  void addToCart(Map<String, dynamic> data) async {
    num++;
    var cart = _storage.read('cart');
    List<dynamic> stored = [];
    if (cart == null) {
      stored.add(jsonEncode(data));
    } else {
      stored = _storage.read('cart');
      stored.add(jsonEncode(data));
    }
    _cart.value = stored;
    _storage.write('cart', stored);
    readCart();
  }

  void readCart() async {
    _total.value = 0;
    var cart = await _storage.read('cart');
    if (cart != null) {
      List<dynamic> stored = await _storage.read('cart');
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
    List<dynamic> stored = await _storage.read('cart');
    if (stored.contains(jsonEncode(data))) {
      stored.remove(jsonEncode(data));
      _storage.write('cart', stored);
      readCart();
    }
  }
}
