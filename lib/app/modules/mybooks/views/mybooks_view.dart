// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/modules/book/views/book_view.dart';

import '../controllers/mybooks_controller.dart';

class MybooksView extends GetView<MybooksController> {
  const MybooksView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MybooksController>(
      init: MybooksController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "my_book".tr,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: GridView.builder(
                itemCount: controller.list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final mybooks = controller.list.value;
                  return GestureDetector(
                    onTap: () => Get.to(BookView(), arguments: mybooks[index]),
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(
                                mybooks[index]['book_thumbnail'],
                                width: Get.width * 0.5,
                                height: Get.height * 0.2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              mybooks[index]['book_title'],
                              style: Theme.of(context).textTheme.headlineMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Icon(Icons.book),
                                Text(
                                  mybooks[index]['book_category'],
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: Get.width * 0.45,
                    mainAxisExtent: Get.height * 0.35,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
