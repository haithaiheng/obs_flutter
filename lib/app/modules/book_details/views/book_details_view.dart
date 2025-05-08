import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:hugeicons/hugeicons.dart';
import 'package:obs/app/Controllers/MainController.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/constants/loading_widget.dart';
import 'package:obs/app/modules/book_details/models/books_detail_model.dart';
import 'package:obs/app/modules/cart/views/cart_view.dart';
import 'package:obs/app/routes/app_pages.dart';

import 'package:obs/colors/constants.dart';
import 'package:obs/colors/svgIcon.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  BookDetailsView({super.key});

  // final Map<String, dynamic> bookData = Get.arguments;

  // final bookController = Get.put(BookDetailsController());
  final MainController _mainController = Get.put(MainController());

  // Fix user id example for test comment show
  // final userID = 1;
  final _postComments = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  // void getBooks() {
  //   if (bookData['id'] == null) {
  //     controller.isError('Error: ID not found');
  //   } else {
  //     var id = bookData['id'];
  //     if (id is String) {
  //       id = int.tryParse(id) ?? 0;
  //     }
  //     bookController.getBook(id);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // getBooks();
    return GetBuilder<BookDetailsController>(
      init: BookDetailsController(),
      builder: (controller) {
        BookDetailsModel book = controller.book.value;
        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: false,
            backgroundColor: _mainController.isDarkMode.value
                ? AppColors.darkcardColor
                : AppColors.secondaryColor,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowLeft01,
                color: dangerDark,
                size: 30.0,
              ),
            ),
            title: Text(
              book.datas?.bookTitle ?? "No Title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: AppFonts.englishFont,
                color: _mainController.isDarkMode.value
                    ? AppColors.secondaryColor
                    : AppColors.darkcardColor,
              ),
            ),
            centerTitle: true,
          ),
          body: controller.isLoading.value
              ? LoadingWidget()
              : controller.isError.value.isNotEmpty
                  ? Center(
                      child: Text(controller.isError.value.toString()),
                    )
                  : RefreshIndicator(
                      key: _refreshIndicatorKey,
                      onRefresh: () async {
                        return Future<void>.delayed(const Duration(seconds: 2),
                            () {
                          // getBooks();
                        });
                      },
                      child: SingleChildScrollView(
                        child: GestureDetector(
                          onTap: () {
                            _focusNode.unfocus();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //   Block Image of Content
                                _buildImageThumbnail(book.datas!),
                                const SizedBox(
                                  height: 15,
                                ),
                                // Block show Information
                                _buildCardDetails(book.datas!),
                                //   End Block show Information
                                const SizedBox(
                                  height: 15,
                                ),
                                _buildCardComments(book.datas?.comments),
                                //   Block comment
                                const SizedBox(
                                  height: 20,
                                ),
                                //   Block Show PDF Book file

                                //   PDF Views -----------------------
                                // const SizedBox(height: 20),
                                // Check if bookFile is not empty
                                // ElevatedButton(
                                //   onPressed: () {
                                //     // Navigate to the '/pdf-viewers' route and pass arguments
                                //     Get.toNamed('/pdf-viewers', arguments: {
                                //       'pdf_url': bookController.book.value!.bookFile,
                                //     });
                                //   },
                                //   style: ElevatedButton.styleFrom(
                                //       backgroundColor: AppColors.primaryColor,
                                //       shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(10),
                                //       )),
                                //   child: Text(
                                //     "PDF",
                                //     style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 20,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                                //   End Block PDF Views -------------

                                //   Test Preview pdf
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //check user order status and free book
                (controller.isOrdered.value || book.datas?.bookPrice == "0")
                    ? Container(
                        width: Get.width * 0.8,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton.icon(
                          onPressed: () {
                            var data = {
                              'book_title':book.datas?.bookTitle,
                              'book_file':book.datas?.bookFile
                            };
                            Get.toNamed(Routes.BOOK, arguments: data);
                          },
                          icon: Icon(
                            Icons.menu_book,
                            color: Colors.white,
                            size: 20,
                          ),
                          label: Text(
                            "read".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Container(
                        width: Get.width * 0.8,
                        decoration: BoxDecoration(
                            color: controller.addCart.value
                                ? AppColors.darkcardColor
                                : AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton.icon(
                          onPressed: () {
                            //add to cart
                            controller.addCart.value
                                ? SizedBox()
                                : controller.addToCart();
                          },
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          label: Text(
                            "addtocart".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageThumbnail(Datas? bookData) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: double.infinity,
          height: 560,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkcardColor.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(
                bookData?.bookThumbnail ??
                    'https://endlessicons.com/wp-content/uploads/2012/11/image-holder-icon.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 2,
            ),
            child: Text(
              "\$ ${bookData?.bookPrice ?? 'Null'}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: AppFonts.englishFont,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardDetails(Datas? bookData) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _mainController.isDarkMode.value
            ? AppColors.darkcardColor
            : AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkcardColor.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 20,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              bookData?.bookTitle ?? "Null",
              style: TextStyle(
                fontSize: 20,
                fontFamily: AppFonts.englishFont,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 4,
            ),
            const SizedBox(
              height: 20,
            ),
            if (bookData!.bookGenre!.isNotEmpty)
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedUser,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        bookData.bookGenre ?? "Null",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedBook04,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  bookData.cateTitle ?? "Null",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "rate".tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      svgStar,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookData.bookRate.toString() ?? "0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Handle show Description of app
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "desc".tr,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.englishFont,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.showDes();
                  },
                  icon: RotatedBox(
                    quarterTurns: controller.isShowDes.value ? 0 : 2,
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowUp01,
                      color: AppColors.primaryColor,
                      size: 24.0,
                    ),
                  ),
                ),
              ],
            ),

            Visibility(
              visible: controller.isShowDes.value,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  bookData.bookDesc ?? "Null",
                  style: TextStyle(
                    fontFamily: AppFonts.englishFont,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            //   ------------------------------------- End -----------------------
          ],
        ),
      ),
    );
  }

  Widget _buildCardComments(List<Comments>? comments) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _mainController.isDarkMode.value
            ? AppColors.darkcardColor
            : AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkcardColor.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "comments".tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.englishFont,
                      fontSize: 16,
                      color: _mainController.isDarkMode.value
                          ? AppColors.lightcardColor
                          : AppColors.darkcardColor,
                    ),
                    children: [
                      TextSpan(
                        text: "(${comments?.length ?? 0})",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //   Code product
                    controller.showComments();
                  },
                  icon: RotatedBox(
                    quarterTurns: controller.isShowComments.value ? 0 : 2,
                    child: Icon(
                      Icons.keyboard_arrow_up_sharp,
                      size: 24,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),

            // Block Show Comments
            Visibility(
              visible: controller.isShowComments.value,
              child: _buildShowCommentsUsers(comments),
            ),
            const SizedBox(
              height: 20,
            ),

            // Block post comments
            _buildPostComment(),
            const SizedBox(
              height: 10,
            ),

            //   ------------------------------------- End -----------------------
          ],
        ),
      ),
    );
  }

  _buildShowCommentsUsers(List<Comments>? comments) {
    return (comments?.length == null)
        ? SizedBox()
        : Column(
            children: List.generate(comments!.length, (index) {
              final Comments comment = comments[index];
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: _mainController.isDarkMode.value
                        ? AppColors.thirdColor
                        : AppColors.lightcardColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomRight:
                          comment.userId == controller.uid.value.toString()
                              ? Radius.circular(0)
                              : Radius.circular(20),
                      bottomLeft:
                          comment.userId == controller.uid.value.toString()
                              ? Radius.circular(20)
                              : Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                "assets/images/profiles.png",
                              ),
                            ),

                            //   Block show comments
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        comment.userFirstname.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: AppFonts.englishFont,
                                          color:
                                              _mainController.isDarkMode.value
                                                  ? AppColors.secondaryColor
                                                  : AppColors.darkcardColor,
                                        ),
                                      ),
                                      // Check user if that is current user that delete comment
                                      Visibility(
                                        visible: comment.userId ==
                                            controller.uid.value.toString(),
                                        child: IconButton(
                                          onPressed: () {
                                            print(
                                                "Delete comment id: ${comment.comId}, User current id: ${comment.userId}");
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${comment.comText}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
  }

  Widget _buildPostComment() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _mainController.isDarkMode.value
            ? AppColors.darkcardColor
            : AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkcardColor.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: TextField(
        focusNode: _focusNode,
        controller: _postComments,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: _mainController.isDarkMode.value
              ? AppColors.thirdColor
              : AppColors.lightcardColor,
          hintText: "comment".tr,
          hintStyle: TextStyle(
            color: _mainController.isDarkMode.value
                ? AppColors.lightcardColor
                : Colors.grey,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedTelegram,
              color: AppColors.priceColor,
              size: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
