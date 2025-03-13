import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:khqr_sdk/khqr_sdk.dart';

import '../controllers/paywithbakong_controller.dart';

class PaywithbakongView extends GetView<PaywithbakongController> {
  const PaywithbakongView({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    Timer timer = Timer.periodic(
      Duration(seconds: 20),
      (_) => controller.checkTransaction(data),
    );
    return GetBuilder<PaywithbakongController>(
      init: PaywithbakongController(),
      dispose: (state) => timer.cancel(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back_ios)),
                  Text("ConfirmOrder"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Scan to make payment."),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: KhqrCardWidget(
                  width: 300.0,
                  receiverName: 'Thaiheng Hai',
                  amount: 1000.00,
                  keepIntegerDecimal: false,
                  currency: KhqrCurrency.khr,
                  qr: controller.qrCode.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
