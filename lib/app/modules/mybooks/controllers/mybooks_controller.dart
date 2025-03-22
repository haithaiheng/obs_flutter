import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obs/app/modules/mybooks/providers/mybook_provider.dart';

class MybooksController extends GetxController {
  //TODO: Implement MybooksController

  final provider = Get.put(MybookProvider());
  final RxList _list = [].obs;
  RxList get list => _list;
  final _page = 1.obs;
  final RxInt _total = 0.obs;
  RxInt get total => _total;
  RxStatus status = RxStatus.loading();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchMybooks(true);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchMybooks(bool firstLoad) async {
    status = RxStatus.loading();
    if (firstLoad) {
      _page.value = 1;
    } else {
      _page.value += 1;
    }
    provider.fetchMybook(1, _page.value).then((value) {
      status = RxStatus.success();
      if (value['datas'].length > 0) {
        if (_page.value > 1) {
          var l = value['datas'].map((e)=>e).toList();
          _list.addAll(l);
        } else {
          _list.value = value['datas'];
        }
        update();
      } else {
        Get.snackbar("message", value);
      }
    });
  }
}
