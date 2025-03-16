// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, unused_element_parameter, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/constants/loading_widget.dart';
import 'package:obs/app/modules/users/controllers/users_controller.dart';

import 'package:obs/colors/constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController _controller = Get.put(HomeController());
  final UsersController _usersController = Get.put(UsersController());

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _usersController.isDarkmode.value
          ? darkColors
          : AppColors.secondaryColor,
      appBar: _appbar(),
      extendBody: true,
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 2), () {
            _controller.getCategory();
          });
        },
        child: Obx(() {
          if (_controller.isLoading.value) {
            return LoadingWidget();
          }
          if (_controller.isError.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${_controller.isError}",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: AppFonts.englishFont,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _controller.getCategory();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        backgroundColor: _usersController.isDarkmode.value
                            ? AppColors.darkcardColor
                            : AppColors.secondaryColor,
                      ),
                      child: Text(
                        "Refresh Page",
                        style: TextStyle(
                          fontFamily: AppFonts.englishFont,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (_controller.categories.isEmpty) {
            return Center(child: Text("Data not found"));
          }
          return _buildContent();
        }),
      ),
    );
  }

  _appbar() {
    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0.9,
      backgroundColor: _usersController.isDarkmode.value
          ? AppColors.darkcardColor
          : AppColors.lightcardColor,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: const AssetImage("assets/images/profiles.png"),
          ),
          const SizedBox(width: 10),
          Text(
            "${'hello'.tr}!, Jonh",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _usersController.isDarkmode.value
                    ? AppColors.lightcardColor
                    : AppColors.thirdColor),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            // Handle search action
          },
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedSearch01,
            color: dangerDark,
            size: 24.0,
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return ListView.builder(
      itemCount: _controller.categories.length,
      itemBuilder: (context, index) {
        final data = _controller.categories[index];
        final books = data['books'];
        final category = data['categories'];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: index == 0 ? 10 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${category['cate_title']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _usersController.isDarkmode.value
                          ? AppColors.lightcardColor
                          : AppColors.thirdColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (category != null) {
                        Get.toNamed('/categories-details', arguments: {
                          'cate_title': category['cate_title'],
                          'cate_id': category['cate_id'],
                          'books': books,
                        });
                      } else {
                        Get.snackbar("Error", "Null Categories!");
                      }
                    },
                    child: Text(
                      "See More",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // List App
            SizedBox(
              height: 380,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return Padding(
                    padding: EdgeInsets.only(
                        right: index == books.length - 1 ? 20 : 0,
                        left: 20,
                        top: 10,
                        bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        if (book['book_id'] != null) {
                          final bookId = book['book_id'];
                          print("This is ID for find book : ${bookId}");
                          Get.toNamed('/book-details', arguments: {
                            'id': bookId,
                            'title': book['book_title'],
                          });
                        }
                      },
                      child: _cardBookViews(book, category['cate_title']),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _cardBookViews(book, category) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: _usersController.isDarkmode.value
            ? AppColors.darkcardColor
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              clipBehavior: Clip.none,
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage('${book['book_thumbnail']}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: CircleAvatar(
                      backgroundColor: _usersController.isDarkmode.value
                          ? AppColors.darkcardColor
                          : Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: HugeIcon(
                          icon: HugeIcons.strokeRoundedFavourite,
                          color: Colors.red,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${book['book_title']}",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                color: _usersController.isDarkmode.value
                    ? Colors.white
                    : AppColors.darkcardColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedUserAccount,
                  color: dangerDark,
                  size: 20.0,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    "Author",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontFamily: "Poppins"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedBook01,
                  color: dangerDark,
                  size: 20.0,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    '$category',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontFamily: "Poppins"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '\$ ${book['book_price']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: dangerDark,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis, // Truncate text with "..."
                    maxLines: 1, // Ensures text remains on a single line
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: dangerDark,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amberAccent,
                          size: 22,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${book['rating'] ?? 0}",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
