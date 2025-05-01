import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:obs/app/constants/application.dart';

class HomeController extends GetxController {
  final _dio = Dio();
  final url = application.apiBaseUrl;

  // final searchs = TextEditingController();
  final _storage = GetStorage();
  RxList wishList = [].obs;

  var isLoading = false.obs;
  var isError = "".obs;
  RxList<RxList<bool>> bookmark = [[false].obs].obs;
  RxList categories = RxList([]);

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  @override
  void onClose() {
    // searchs.dispose();
    super.onClose();
  }

  void getCategory() async {
    isLoading(true);
    isError("");
    await getWishlistId();
    bookmark.clear();
    try {
      final response = await _dio.get('${url}home');

      if (response.data is Map<String, dynamic> &&
          response.data.containsKey("data")) {
        var dataList = response.data["data"];
        categories.value = dataList;
        //loop categories
        for(var i=0;i<dataList.length;i++){
          //loop books
          RxList<bool> lst = [false].obs;
          lst.clear();
          for (var j=0;j<dataList[i]['books'].length;j++){
            if (wishList.contains(dataList[i]['books'][j]['book_id'])){
              lst.add(true);
            }else{
              lst.add(false);
            }
          }
          bookmark.add(lst);
        }
        update();
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

  Future<void> getWishlistId() async{
    wishList.clear();
    final isLogin = _storage.read('login');
    final stored = await _storage.read('wishlist.${isLogin['user_id']}');
    var l = [];
    for(var i=0;i<stored.length;i++){
      Map<String, dynamic> map = jsonDecode(stored[i]);
      l.add(map['id']);
    }
    wishList.value = l;
    update();
  }

  void bookmarkAction(int mIndex, int index){
    bookmark[mIndex][index] = !bookmark[mIndex][index];
    update();
  }
}
