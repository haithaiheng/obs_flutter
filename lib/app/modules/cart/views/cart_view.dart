import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/modules/confirmorder/views/confirmorder_view.dart';
import 'package:obs/colors/constants.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  // final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      builder: (controller) => Scaffold(
        backgroundColor: secondaryColors,
        appBar: AppBar(
          title: Text(
            'cart'.tr,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width * 0.8,
                  height: Get.height * 0.2,
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
                              "https://dm989u341afjd.cloudfront.net/wp-content/uploads/2021/01/11140621/B00ZDAN928.01.LZZZZZZZ.jpg",
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
                                        "Bed Time Stories ssafasf safsfdafaa faf sfaasdfsaf asfasfsaf adasfaf",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        "Poplar",
                                        style: TextStyle(fontSize: 14),
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
                                        "\$20",
                                        style: TextStyle(
                                            color: dangerDark,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.delete,
                                            size: 18,
                                            color: dangerDark,
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
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Total:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "\$40.50",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: dangerDark,
                        fontSize: 20),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: dangerDark,
                    foregroundColor: secondaryColors,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      // side: BorderSide(color: Colors.red),
                    )),
                onPressed: () {
                  var body = {
                    "userid": 1,
                    "date": DateTime.now().toString(),
                    "amount": 7.00,
                    "transac": "242305KJASKL",
                    "details": [
                      {
                        "bookid": 2,
                        "title": "Bed Time Stories ssafasf safsfdafaa",
                        "category": "Fantasy",
                        "thumbnail":
                            "https://dm989u341afjd.cloudfront.net/wp-content/uploads/2021/01/11140621/B00ZDAN928.01.LZZZZZZZ.jpg",
                        "price": 2.00,
                        "amount": 2.00,
                        "remark": "" //transction no after success
                      },
                      {
                        "bookid": 3,
                        "title": "Bed Time Stories ssafasf safsfdafaa",
                        "category": "Fantasy",
                        "thumbnail":
                            "https://dm989u341afjd.cloudfront.net/wp-content/uploads/2021/01/11140621/B00ZDAN928.01.LZZZZZZZ.jpg",
                        "price": 5.00,
                        "amount": 5.00,
                        "remark": "" //transction no after success
                      }
                    ]
                  };
                  Get.to(ConfirmorderView(), arguments: body);
                },
                child: Text(
                  "Check Out",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
