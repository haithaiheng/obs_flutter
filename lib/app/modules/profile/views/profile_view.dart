import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/constants/app_constant.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _key = GlobalKey<FormState>();


    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) => Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 50,
                          left: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back_ios),
                              ),
                              Text(
                                "profile".tr,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18.0, left: 18, right: 18),
                      child: Text(
                        "details".tr,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller.firstController,
                              decoration: InputDecoration(
                                hintText: 'Input Firstname',
                                hintStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                label: Text(
                                  "firstname".tr,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              style: Theme.of(context).textTheme.labelLarge,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Firstname Required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: controller.lastController,
                              decoration: InputDecoration(
                                hintText: 'Input Lastname',
                                hintStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                                label: Text(
                                  "${"lastname".tr} (${'optional'.tr})",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: controller.bioController,
                              minLines: 5,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Input Bio',
                                hintStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                border: OutlineInputBorder(),
                              ),
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_key.currentState!.validate()) {}

                      // var body = jsonEncode(map);
                      controller.updateProfile();
                    },
                    label: controller.isLoading
                        ? CircularProgressIndicator(
                            strokeWidth: 1,
                          )
                        : Text(
                            "savechange".tr,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.primaryColor),
                      foregroundColor:
                          WidgetStatePropertyAll(AppColors.secondaryColor),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        // side: BorderSide(color: Colors.red),
                      )),
                    ),
                  ),
                ),
              ),
            ));
  }
}
