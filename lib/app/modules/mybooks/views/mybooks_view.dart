import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/modules/mainScreen/views/main_screen_view.dart';

import '../controllers/mybooks_controller.dart';

class MybooksView extends GetView<MybooksController> {
  const MybooksView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.offAll(MainScreenView()),
            child: Icon(Icons.arrow_back_ios)),
        title: const Text('MybooksView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MybooksView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
