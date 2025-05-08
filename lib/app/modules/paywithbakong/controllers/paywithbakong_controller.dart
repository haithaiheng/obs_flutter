// ignore_for_file: avoid_print

import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khqr_sdk/khqr_sdk.dart';
import 'package:obs/app/modules/paywithbakong/providers/paywithbakong_provider.dart';

import '../../cart/controllers/cart_controller.dart';

class PaywithbakongController extends GetxController {
  //TODO: Implement PaywithbakongController
  final cartController = Get.put(CartController());
  final provider = PaywithbakongProvider();
  final _khqrSdk = KhqrSdk();
  final _storage = GetStorage();
  final RxString _qrCode = ''.obs;
  RxString get qrCode => _qrCode;
  final RxString _md5 = ''.obs;
  final RxBool _isLoad = false.obs;
  RxBool get isLoad => _isLoad;
  final RxBool _isCheck = false.obs;
  final RxString _userLogin = ''.obs;
  @override
  void onInit() {
    getUserId();
    generateKhqrIndividual();
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void setLoading(bool loadvalue) {
    _isLoad.value = loadvalue;
    update();
  }

  void resetCart(){
    cartController.readCart();
    cartController.num.value = 0;
  }

  Future<void> getUserId() async {
    final isLogin = await _storage.read('login');
    _userLogin.value = isLogin['user_id'];
    update();
  }

  Future<void> orderBook(body) async {
    _isCheck.value = true;

    provider.orderBooks(body).then((value) async {
      print("value: $value");
      if (value['message'] == 'success') {
        _storage.remove('cart.${_userLogin.value}');
        setLoading(true);
      } else {
        print(value['message']);
        Get.snackbar("message".tr, "Order failed");
      }
    }, onError: (error) {
      print("Order Error: ${error.toString()}");
      Get.snackbar("message".tr, "Order failed");
    });
  }

  Future<void> generateKhqrIndividual() async {
    try {
      final expire = DateTime.now().millisecondsSinceEpoch + 3600000;
      final info = IndividualInfo(
          bakongAccountId: 'thaiheng_hai@aclb',
          acquiringBank: "Dev Bank",
          merchantName: 'Thaiheng Hai',
          accountInformation: '855964144669',
          amount: 100,
          currency: KhqrCurrency.khr,
        expirationTimestamp: expire,
      );
      final khqrData = await _khqrSdk.generateIndividual(info);
      // print("khqrData: $khqrData");
      final isValid = await _khqrSdk.verify(khqrData!.qr);
      if (isValid) {
        _qrCode.value = khqrData.qr;
        _md5.value = khqrData.md5;
        print("md5: ${khqrData.md5}");
        update();
      }
    } catch (e) {
      print("error with generate qrcode: $e");
    }
  }

  Future<void> checkTransaction(dynamic body) async {
    try {
      if (!_isCheck.value) {

        provider.checkTransaction("f1df852d054d271871374fc68de3dbc0").then((value) {
          if (value != null) {
            var data = {
              "userid":_userLogin.value,
              "date": DateTime.now().toString(),
              "amount": body['amount'],
              "transac": value.toString(),
              "details": body['details']
            };
            // print(data);
            orderBook(data);
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
