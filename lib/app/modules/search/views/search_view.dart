import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:obs/app/Controllers/MainController.dart';
import 'package:obs/app/modules/book_details/views/book_details_view.dart';

import '../../../../colors/constants.dart';
import '../../../constants/app_constant.dart';
import '../../book/views/book_view.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchBookController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final search = TextEditingController();
    final mainController = Get.put(MainController());
    return GetBuilder<SearchBookController>(
      init: SearchBookController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('search'.tr),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async => await controller.fetchBooks(search.text, true),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: search,
                    decoration: InputDecoration(
                      hintText: "search".tr,
                      labelText: "search".tr,
                      suffixIcon: IconButton(
                          onPressed: () async {
                            await controller.fetchBooks(search.text, true);
                          },
                          icon: Icon(Icons.search)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onFieldSubmitted: (value) {},
                  ),
                ),
                LazyLoadScrollView(
                  onEndOfPage: () async =>
                      await controller.fetchBooks(search.text, false),
                  child: GridView.builder(
                    itemCount: controller.list.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final books = controller.list;
                      return GestureDetector(
                        onTap: () =>
                            Get.to(() => BookDetailsView(), arguments: books[index]['book_id']),
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.network(
                                    books[index]['book_thumbnail'] ??
                                        "https://marketplace.canva.com/EAGEuNwgF3k/1/0/1003w/canva-modern-and-simple-prayer-journal-book-cover-UL8kCB4ONE8.jpg",
                                    width: Get.width * 0.5,
                                    height: Get.height * 0.25,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        books[index]['book_title'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.book),
                                          Text(
                                            books[index]['cate_title'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          // Icon(Icons.monetization_on_outlined),
                                          Text(
                                            "\$ ${books[index]['book_price']}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: Get.width * 0.5,
                        mainAxisExtent: Get.height * 0.4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
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
