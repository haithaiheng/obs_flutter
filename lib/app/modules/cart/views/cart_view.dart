import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obs/app/modules/confirmorder/views/confirmorder_view.dart';
import 'package:obs/colors/constants.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'cart'.tr,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            centerTitle: true,
            // actions: [
            //   IconButton(
            //       onPressed: () {
            //         var data = {
            //           "bookid": controller.num.value,
            //           "title": "Book Title",
            //           "category": "Fantasy",
            //           "price": 2.00,
            //           "thumbnail":
            //               "https://dm989u341afjd.cloudfront.net/wp-content/uploads/2021/01/11140621/B00ZDAN928.01.LZZZZZZZ.jpg"
            //         };
            //         controller.addToCart(data);
            //       },
            //       icon: Icon(Icons.add)),
            //   IconButton(
            //       onPressed: () {
            //         controller.readCart();
            //       },
            //       icon: Icon(Icons.read_more)),
            // ],
          ),
          body: SingleChildScrollView(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.cart.length,
                itemBuilder: (context, index) {
                  List<dynamic> bookList = controller.cart.value;
                  return Container(
                    width: Get.width * 0.8,
                    height: Get.height * 0.17,
                    margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
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
                                // "https://dm989u341afjd.cloudfront.net/wp-content/uploads/2021/01/11140621/B00ZDAN928.01.LZZZZZZZ.jpg",
                                bookList[index]['thumbnail'],
                                width: 100,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${bookList[index]['title'] + bookList[index]['bookid'].toString()}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                        Text(
                                          bookList[index]['category'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$${bookList[index]['price']}",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .labelLarge,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Map<String, dynamic> data = {
                                                "bookid": bookList[index]
                                                    ['bookid'],
                                                "title": bookList[index]
                                                    ['title'],
                                                "category": bookList[index]
                                                    ['category'],
                                                "price": bookList[index]
                                                    ['price'],
                                                "thumbnail": bookList[index]
                                                    ['thumbnail'],
                                                // "https://dm989u341afjd.cloudfront.net/wp-content/uploads/2021/01/11140621/B00ZDAN928.01.LZZZZZZZ.jpg"
                                              };
                                              controller.removeCartItem(data);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              // color: dangerDark,
                                            )),
                                      ],
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
          bottomNavigationBar: Container(
            height: Get.height * 0.08,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "total".tr,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "\$${controller.total.value}",
                      style: Theme.of(context).primaryTextTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: dangerDark,
                        foregroundColor: secondaryColors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          // side: BorderSide(color: Colors.red),
                        )),
                    onPressed: () {
                      var body = {
                        "amount": controller.total.value,
                        "details": controller.cart.value
                      };
                      if (body['details'].isBlank == true) {
                        Get.defaultDialog(
                          title: 'message'.tr,
                          titleStyle: Theme.of(context).textTheme.labelMedium,
                          content: Text("blankcart".tr),
                          textConfirm: "ok".tr,
                          onConfirm: () => Get.back(),
                        );
                      } else {
                        Get.to(()=>ConfirmorderView(), arguments: body);
                      }
                    },
                    child: Text(
                      "checkout".tr,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
