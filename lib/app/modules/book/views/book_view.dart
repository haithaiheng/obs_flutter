import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
    late PdfViewerController pdfViewerController = PdfViewerController();
    final TextEditingController _pageController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['book_title'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SfPdfViewer.network(
        data['book_file'],
        key: pdfViewerKey,
        pageLayoutMode: PdfPageLayoutMode.single,
        controller: pdfViewerController,
      ),
      floatingActionButton: IconButton.outlined(
          onPressed: () {
            _pageController.text = '';
            Get.defaultDialog(
              title: 'topage'.tr,
              titleStyle: Theme.of(context).textTheme.headlineMedium,
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _pageController,
                    decoration: InputDecoration(
                      labelText: 'page'.tr,
                      labelStyle: Theme.of(context).textTheme.labelSmall,
                    ),
                    style: Theme.of(context).textTheme.labelMedium,
                    validator: (value) =>
                        value!.isEmpty ? 'Cannot be blank' : null,
                  ),
                ),
              ),
              textConfirm: 'ok'.tr,
              onConfirm: () {
                if (_formKey.currentState!.validate()) {}
                if (_pageController.text != '') {
                  pdfViewerController
                      .jumpToPage(int.parse(_pageController.text));
                  Get.back(result: true);
                }
              },
            );
          },
          icon: Icon(
            Icons.find_in_page,
          )),
    );
  }
}
