import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:obs/app/constants/application.dart';
import 'package:obs/app/modules/book_details/models/books_detail_model.dart';

class BookDetailsController extends GetxController {
  final _apiUrl = Application();
  final _dio = Dio();

  Rx<BookDetailsModel?> book = Rx<BookDetailsModel?>(null);

  RxBool isLoading = RxBool(true);
  RxString isError = RxString("");
  RxBool isShowDes = RxBool(false);
  RxBool isShowComments = RxBool(false);

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // Method to fetch book details
  void getBook(int id) async {
    isLoading(true);
    isError.value = "";

    try {
      final response =
          await _dio.get('${_apiUrl.apiBaseUrl}bookdetail.php?id=$id');

      if (response.statusCode == 200) {
        var rawData = jsonDecode(response.data);

        if (rawData['data'] != null) {
          book.value = BookDetailsModel.fromJson(rawData['data']);
          // print("Book Details: ${book.value}");
        } else {
          isError.value = "No data found";
        }

        update();
      } else {
        isLoading(false);
        isError('Failed to load book');
        print("Failed to load book: ${response.statusCode}");
        update();
      }
    } catch (e) {
      isError.value = "Failed to load book details: $e";
      isLoading(false);
      print("Exception: $e");
      update();
    } finally {
      isLoading(false);
    }
  }

//   handle des
  void showDes() {
    update();
    isShowDes.value = !isShowDes.value;
  }

  void showComments() => isShowComments.value = !isShowComments.value;
}
