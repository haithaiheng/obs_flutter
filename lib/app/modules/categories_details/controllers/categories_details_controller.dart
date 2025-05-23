import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:obs/app/constants/application.dart';
import 'package:obs/app/modules/categories_details/models/category_details_model.dart';

class CategoriesDetailsController extends GetxController {
  //TODO: Implement CategoriesDetailsController
  final _dio = Dio();
  final _api = Application();
  RxInt isID = RxInt(0);
  var page =1;

  RxList<CategoryDetailsModel> books = RxList([]);
  RxBool isLoading = RxBool(true);
  RxString isError = RxString("");
  @override
  void onInit() {
    super.onInit();
    isID(int.parse(Get.arguments['cate_id']));
    // Check Connection for controller
    if (isID.value != null) {
      print("This is ID: ${isID}");
      getBooksByCate(isID, true);
    } else {
      print("This is failed ID");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<void> getBooksByCate(id, bool firstLoad) async {
    isLoading(true);
    isError("");

    try {
      if (firstLoad){
        page = 1;
      }else{
        page +=1;
      }
      final response =
          await _dio.get('${_api.apiBaseUrl}bookbycategory?id=${id}&page=${page}');

      if (response.statusCode == 200) {
        // print("Response Data: ${response.data['data']}");
        final data = response.data['data'] as List;
        // print("This is: ${data}");
        if (firstLoad){
          books(data.map((json) => CategoryDetailsModel.fromJson(json)).toList());
        }else{
          books.addAll(data.map((json) => CategoryDetailsModel.fromJson(json)).toList());
        }
      } else {
        isError("Failed request data, status: ${response.statusCode}");
      }
    } catch (e) {
      isError("Error: ${e.toString()}");
    } finally {
      isLoading(false);
    }
  }
}
