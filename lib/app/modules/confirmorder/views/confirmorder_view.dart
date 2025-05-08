import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/modules/paywithbakong/views/paywithbakong_view.dart';
import '../controllers/confirmorder_controller.dart';

class ConfirmorderView extends GetView<ConfirmorderController> {
  const ConfirmorderView({super.key});
  @override
  Widget build(BuildContext context) {
    var body = Get.arguments;
    return GetBuilder<ConfirmorderController>(
        init: ConfirmorderController(),
        builder: (controler) => Scaffold(
              appBar: AppBar(
                title: Text(
                  'confirmorder'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              body: SafeArea(
                child: Stack(
                  children: [
                    SizedBox(
                      height: Get.height * 0.7,
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: body['details'].length,
                            itemBuilder: (context, index) {
                              var book = body['details'];
                              return Container(
                                width: Get.width * 0.8,
                                height: Get.height * 0.17,
                                margin: const EdgeInsets.only(
                                    top: 10, left: 15, right: 15),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.network(
                                            book[index]['thumbnail'],
                                            width: 100,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  spacing: 5,
                                                  children: [
                                                    Text(
                                                      book[index]['title'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium,
                                                    ),
                                                    Text(
                                                      book[index]['category'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium,
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "\$${book[index]['price']}",
                                                  style: Theme.of(context)
                                                      .primaryTextTheme
                                                      .labelLarge,
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
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: Get.width,
                          height: 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "total".tr,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "\$${body['amount']}",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .labelLarge,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              bottomNavigationBar: SafeArea(
                child: Container(
                  height: Get.height * 0.1,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: AppColors.secondaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: AppColors.primaryColor))),
                    onPressed: () {
                      Get.to(()=>PaywithbakongView(), arguments: body);
                    },
                    child: Text(
                      "paynow".tr,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ),
            ));
  }
}
