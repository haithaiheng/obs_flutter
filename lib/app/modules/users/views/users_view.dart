import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/constants/app_constant.dart';

import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      init: UsersController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(
          title: Text('profile'.tr),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height * 0.18,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "welcome_back".tr,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Thaiheng Hai Thaiheng",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      Text(
                                        "thaihenghai@gmail.com",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 50,
                      height: 30,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.thirdColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            size: 16,
                            color: AppColors.secondaryColor,
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.lock_outline),
                      title: Text("Change Password"),
                      subtitle: Text("You can change password"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Icon(Icons.book_outlined),
                      title: Text("My Books"),
                      subtitle: Text("Enjoys reading"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Icon(Icons.dark_mode_outlined),
                      title: Text("Dark Mode"),
                      subtitle: Text("Change your app theme"),
                      trailing: Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            value: true,
                            onChanged: (value) {},
                            activeColor: AppColors.primaryColor,
                          )),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Get.defaultDialog(
                        title: 'change_lang'.tr,
                        barrierDismissible: false,
                        content: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      var locale = Locale('kh', 'KM');
                                      Get.updateLocale(locale);
                                      controller.writeLanguage('kh');
                                      Get.back();
                                    },
                                    child: Text("khmer".tr)),
                                Get.locale == Locale('kh', 'KM')
                                    ? Icon(
                                        Icons.check,
                                        size: 12,
                                      )
                                    : SizedBox(),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      var locale = Locale('en', 'US');
                                      Get.updateLocale(locale);
                                      controller.writeLanguage('en');
                                      Get.back();
                                    },
                                    child: Text("english".tr)),
                                Get.locale == Locale('en', 'US')
                                    ? Icon(
                                        Icons.check,
                                        size: 12,
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.language_outlined),
                        title: Text("Change Language"),
                        subtitle: Text("Switch to your country language"),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Icon(Icons.exit_to_app_outlined),
                      title: Text("Log Out"),
                      subtitle: Text("Take a rest"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
