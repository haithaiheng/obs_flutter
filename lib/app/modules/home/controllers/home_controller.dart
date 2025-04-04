import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:obs/app/constants/application.dart';

class HomeController extends GetxController {
  final _dio = Dio();
  final url = application.apiBaseUrl;

  final searchs = TextEditingController();

  var isLoading = false.obs;
  var isError = "".obs;

  RxList categories = RxList([]);

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  @override
  void onClose() {
    searchs.dispose();
    super.onClose();
  }

  void getCategory() async {
    isLoading(true);
    isError("");

    try {
      final response = await _dio.get('${url}home');

      if (response.data is Map<String, dynamic> &&
          response.data.containsKey("data")) {
        var dataList = response.data["data"];

        categories.value = dataList;
      } else {
        isError(
            "Error: Response does not contain 'data' key or is not a valid map.");
        debugPrint(
            "Error: Response does not contain 'data' key or is not a valid map.");
      }
    } catch (e) {
      debugPrint('Error fetching categories: $e');
      isError("Server is not response!");
      Get.snackbar(
        "Error",
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red, // Use your `dangerDark` color here
      );
    } finally {
      isLoading(false);
    }
  }
}
