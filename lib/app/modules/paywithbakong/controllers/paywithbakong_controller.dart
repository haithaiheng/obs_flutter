// ignore_for_file: avoid_print

import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khqr_sdk/khqr_sdk.dart';
import 'package:obs/app/modules/paywithbakong/providers/paywithbakong_provider.dart';

class PaywithbakongController extends GetxController {
  //TODO: Implement PaywithbakongController
  final provider = PaywithbakongProvider();
  final _khqrSdk = KhqrSdk();
  final _storage = GetStorage();
  final RxString _qrCode = ''.obs;
  RxString get qrCode => _qrCode;
  final RxString _md5 = ''.obs;
  final RxBool _isload = false.obs;
  RxBool get isLoad => _isload;
  final RxBool _isCheck = false.obs;
  @override
  void onInit() {
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

  void setLoading(bool loadvalue) {
    _isload.value = loadvalue;
    update();
  }

  Future<void> orderBook(body) async {
    setLoading(true);
    _isCheck.value = true;
    provider.orderBooks(body).then((value) async {
      print("value: $value");
      if (value['message'] == 'success') {
        await _storage.remove('cart');
        setLoading(false);
        // Get.offAll(MybooksView());
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
      final info = IndividualInfo(
          bakongAccountId: 'thaiheng_hai@aclb',
          acquiringBank: "Dev Bank",
          merchantName: 'Thaiheng Hai',
          accountInformation: '855964144669',
          amount: 100,
          currency: KhqrCurrency.khr);
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
        provider.checkTransaction(_md5.value).then((value) {
          if (value != null) {
            var data = {
              "userid": 1,
              "date": DateTime.now().toString(),
              "amount": body['amount'],
              "transac": value.toString(),
              "details": body['details']
            };
            orderBook(data);
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
