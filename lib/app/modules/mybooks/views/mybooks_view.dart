import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mybooks_controller.dart';

class MybooksView extends GetView<MybooksController> {
  const MybooksView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
