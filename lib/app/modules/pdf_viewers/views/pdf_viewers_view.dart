import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:obs/app/Controllers/MainController.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/modules/users/controllers/users_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../../colors/constants.dart';
import '../controllers/pdf_viewers_controller.dart';

class PdfViewersView extends GetView<PdfViewersController> {
  PdfViewersView({super.key});

  @override
  Widget build(BuildContext context) {
    final pdfBook = Get.arguments?['pdf_url'] ?? '';
    final MainController _mainController = Get.find();
    return Scaffold(
      appBar: AppBar(
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
        title: Text('Documents',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: AppFonts.englishFont,
              color: _mainController.isDarkMode.value
                  ? AppColors.secondaryColor
                  : AppColors.darkcardColor,
            )),
        centerTitle: true,
      ),
      body: pdfBook.isNotEmpty
          ? SfPdfViewer.network(
              pdfBook,
              onDocumentLoadFailed: (details) {
                Get.snackbar(
                  'Error',
                  'Failed to load PDF: ${details.error}',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
            )
          : const Center(
              child: Text(
                'No PDF URL provided',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
    );
  }
}
