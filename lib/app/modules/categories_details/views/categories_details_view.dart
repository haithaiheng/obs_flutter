import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/modules/book_details/controllers/book_details_controller.dart';
import 'package:obs/app/modules/users/controllers/users_controller.dart';

import '../../../../colors/constants.dart';
import '../controllers/categories_details_controller.dart';

class CategoriesDetailsView extends GetView<CategoriesDetailsController> {
  CategoriesDetailsView({super.key});

  final categoryTile = Get.arguments?['cate_title'] ?? 'Unknown';
  final categoryId = Get.arguments?['cate_id'] ?? 0;
  final List books = Get.arguments?['books'] ?? [];

  final _userController = Get.put(UsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: _userController.isDarkmode.value
            ? AppColors.thirdColor
            : Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.primaryColor),
        ),
        title: Text(
          '$categoryTile',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: AppFonts.englishFont,
              color: _userController.isDarkmode.value
                  ? AppColors.lightcardColor
                  : AppColors.darkcardColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.46),
                  itemCount: books.length,
                  primary: false,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return GestureDetector(
                      onTap: () {
                        if (book['book_id'] != null) {
                          Get.toNamed('/book-details', arguments: {
                            'id': book['book_id'],
                            'title': book['book_title'],
                          });
                        } else {
                          Get.snackbar("Error", "Book details not found.");
                        }
                      },
                      child: _cardBookViews(book, categoryTile),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  _cardBookViews(book, category) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: _userController.isDarkmode.value
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
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        '${book['book_thumbnail']}',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                              color: Colors.red, // Customize color
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/placeholder.png',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: CircleAvatar(
                      backgroundColor: _userController.isDarkmode.value
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
                color: _userController.isDarkmode.value
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
