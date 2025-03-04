import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:obs/colors/constants.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsView extends GetView<BookDetailsController> {
  BookDetailsView({super.key});
  final Map<String, dynamic> bookData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColors,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: dangerDark,
            size: 24.0,
          ),
        ),
        title: Text('${bookData['title']}'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookDetailsView is working:ID: ${bookData['id']} ',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
