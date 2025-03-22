// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
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
        body: controller.status.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.status.isError
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(controller.isError.value),
                        TextButton(onPressed: (){
                          controller.fetchMybooks(true);
                        }, child: Text("Retry"))
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RefreshIndicator(
                      onRefresh: () => controller.fetchMybooks(true),
                      child: LazyLoadScrollView(
                        onEndOfPage: () => controller.fetchMybooks(false),
                        child: GridView.builder(
                          itemCount: controller.list.length,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final mybooks = controller.list.value;
                            return GestureDetector(
                              onTap: () => Get.to(() => BookView(),
                                  arguments: mybooks[index]),
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Image.network(
                                          mybooks[index]['book_thumbnail'],
                                          width: Get.width * 0.5,
                                          height: Get.height * 0.2,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            mybooks[index]['book_title'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.book),
                                              Text(
                                                mybooks[index]['book_category'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
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
