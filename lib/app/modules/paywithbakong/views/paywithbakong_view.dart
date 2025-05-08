import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:khqr_sdk/khqr_sdk.dart';
import 'package:obs/app/modules/mainScreen/views/main_screen_view.dart';

import '../controllers/paywithbakong_controller.dart';

class PaywithbakongView extends GetView<PaywithbakongController> {
  const PaywithbakongView({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    Timer timer = Timer.periodic(
      Duration(seconds: 15),
      (_) {
        if (controller.hasListeners) {
          controller.checkTransaction(data);
        }
      },
    );
    return GetBuilder<PaywithbakongController>(
      init: PaywithbakongController(),
      dispose: (state) => timer.cancel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "payment".tr,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: SafeArea(
          child: Container(
            height: Get.height * 0.7,
            alignment: Alignment.center,
            child: controller.isLoad.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Thank you. Enjoy reading!",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            controller.resetCart();
                            Get.offAll(MainScreenView());
                          },
                          child: Text("ok".tr)),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "scantopay".tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: KhqrCardWidget(
                          width: 300.0,
                          receiverName: 'Thaiheng Hai',
                          amount: 100.00,
                          keepIntegerDecimal: false,
                          currency: KhqrCurrency.khr,
                          qr: controller.qrCode.value,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: LinearProgressIndicator(),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
