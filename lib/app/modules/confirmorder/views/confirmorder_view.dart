import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/modules/cart/views/cart_view.dart';
import 'package:obs/app/modules/mainScreen/views/main_screen_view.dart';
import 'package:obs/colors/constants.dart';

import '../controllers/confirmorder_controller.dart';

class ConfirmorderView extends GetView<ConfirmorderController> {
  const ConfirmorderView({super.key});
  @override
  Widget build(BuildContext context) {
    var body = Get.arguments;
    return GetBuilder<ConfirmorderController>(
        init: ConfirmorderController(),
        builder: (controler) => SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  title: Text('confirmorder'.tr),
                  centerTitle: true,
                ),
                body: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: body['details'].length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: Get.width * 0.8,
                        height: Get.height * 0.2,
                        margin:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    body['details'][index]['thumbnail'],
                                    width: 100,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              body['details'][index]['title'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              body['details'][index]
                                                  ['category'],
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "\$${body['details'][index]['price']}",
                                          style: TextStyle(
                                              color: dangerDark,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                bottomNavigationBar: Container(
                  height: Get.height * 0.1,
                  padding: const EdgeInsets.all(20),
                  color: AppColors.secondaryColor,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: AppColors.secondaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: AppColors.primaryColor))),
                    onPressed: () {
                      Get.defaultDialog(
                        barrierDismissible: false,
                        title: 'scanhere'.tr,
                        content: controller.isLoading
                            ? Center(
                                child: Image.network(
                                  "https://devithuotkeo.com/static/image/portfolio/khqr/khqr-7.png",
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.check_mark_circled,
                                        size: 60,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'success'.tr,
                                        style: TextStyle(
                                            fontFamily: AppFonts.khmerFont,
                                            fontWeight: FontWeight.bold,
                                            color: darkColors),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  controler.isLoading
                                      ? SizedBox()
                                      : ElevatedButton.icon(
                                          onPressed: () {
                                            Get.offAll(MainScreenView());
                                          },
                                          label: Text("ok".tr),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            foregroundColor:
                                                AppColors.secondaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              // side: BorderSide(
                                              //   color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                        // textConfirm: controller.isLoading ? '' : 'ok'.tr,
                        // onConfirm: () => controller.isLoading ? '' : Get.back(),
                      );

                      // controller.orderBook(body);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wallet,
                          size: 16,
                          color: secondaryColors,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Pay Now",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
