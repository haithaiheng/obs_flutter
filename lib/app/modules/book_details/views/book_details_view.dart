import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:hugeicons/hugeicons.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/constants/loading_widget.dart';
import 'package:obs/app/modules/book_details/models/books_detail_model.dart';
import 'package:obs/app/modules/users/controllers/users_controller.dart';

import 'package:obs/colors/constants.dart';
import 'package:obs/colors/svgIcon.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  BookDetailsView({super.key});

  final Map<String, dynamic> bookData = Get.arguments;

  final bookController = Get.put(BookDetailsController());
  final UsersController _userController = Get.find();

  // Fix user id example for test comment show
  final userID = 1;
  final _postComments = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  void getBooks() {
    if (bookData['id'] == null) {
      controller.isError('Error: ID not found');
    } else {
      var id = bookData['id'];
      if (id is String) {
        id = int.tryParse(id) ?? 0;
      }
      bookController.getBook(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    getBooks();
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: false,
        backgroundColor: _userController.isDarkmode.value
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
          '${bookData['title']}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: AppFonts.englishFont,
            color: _userController.isDarkmode.value
                ? AppColors.secondaryColor
                : AppColors.darkcardColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedShoppingCartCheckIn01,
              color: AppColors.primaryColor,
              size: 24.0,
            ),
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return LoadingWidget();
        }

        if (controller.isError.isNotEmpty) {
          return Center(
            child: Center(child: Text(controller.isError.toString())),
          );
        }

        return RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: () async {
            return Future<void>.delayed(const Duration(seconds: 2), () {
              getBooks();
            });
          },
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                _focusNode.unfocus();
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //   Block Image of Content
                    _buildImageThumbnail(),
                    const SizedBox(
                      height: 15,
                    ),
                    // Block show Information
                    _buildCardDetails(),
                    //   End Block show Information
                    const SizedBox(
                      height: 15,
                    ),
                    _buildCardComments(),
                    //   Block comment
                    const SizedBox(
                      height: 20,
                    ),
                    //   Block Show PDF Book file

                    //   PDF Views -----------------------
                    const SizedBox(height: 20),
                    // Check if bookFile is not empty
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the '/pdf-viewers' route and pass arguments
                        Get.toNamed('/pdf-viewers', arguments: {
                          'pdf_url': bookController.book.value!.bookFile,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text(
                        "PDF",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    //   End Block PDF Views -------------

                    //   Test Preview pdf
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildImageThumbnail() {
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
                controller.book.value!.bookThumbnail,
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
              "\$ ${controller.book.value!.bookPrice ?? 'Null'}",
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

  Widget _buildCardDetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _userController.isDarkmode.value
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
              bookController.book.value!.bookTitle ?? "Null",
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
            if (bookController.book.value!.bookGenre.isNotEmpty)
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
                        bookController.book.value!.bookGenre ?? "Null",
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
                  bookController.book.value!.cateTitle ?? "Null",
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
                  "Rating",
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
                      bookController.book.value!.bookRate.toString() ?? "0",
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
                  "Description:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.englishFont,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    bookController.showDes();
                  },
                  icon: RotatedBox(
                    quarterTurns: bookController.isShowDes.value ? 0 : 2,
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
              visible: bookController.isShowDes.value,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  bookController.book.value!.bookDesc,
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

  Widget _buildCardComments() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _userController.isDarkmode.value
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
                    text: "Comments(",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.englishFont,
                      fontSize: 16,
                      color: _userController.isDarkmode.value
                          ? AppColors.lightcardColor
                          : AppColors.darkcardColor,
                    ),
                    children: [
                      TextSpan(
                        text: "${bookController.book.value!.comments.length}",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(text: ")"),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //   Code product
                    bookController.showComments();
                  },
                  icon: RotatedBox(
                    quarterTurns: bookController.isShowComments.value ? 0 : 2,
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
              visible: bookController.isShowComments.value,
              child: _buildShowCommentsUsers(),
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

  _buildShowCommentsUsers() {
    return Column(
      children:
          List.generate(bookController.book.value!.comments.length, (index) {
        final Comments comments = bookController.book.value!.comments[index];

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
              color: _userController.isDarkmode.value
                  ? AppColors.thirdColor
                  : AppColors.lightcardColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: comments.userId == userID.toString()
                    ? Radius.circular(0)
                    : Radius.circular(20),
                bottomLeft: comments.userId == userID.toString()
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  comments.userFirstname.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppFonts.englishFont,
                                    color: _userController.isDarkmode.value
                                        ? AppColors.secondaryColor
                                        : AppColors.darkcardColor,
                                  ),
                                ),
                                // Check user if that is current user that delete comment
                                Visibility(
                                  visible: comments.userId == userID.toString(),
                                  child: IconButton(
                                    onPressed: () {
                                      print(
                                          "Delete comment id: ${comments.comId}, User current id: ${comments.userId}");
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
                    "${comments.comText}",
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
        color: _userController.isDarkmode.value
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
          fillColor: _userController.isDarkmode.value
              ? AppColors.thirdColor
              : AppColors.lightcardColor,
          hintText: "Comment",
          hintStyle: TextStyle(
            color: _userController.isDarkmode.value
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
