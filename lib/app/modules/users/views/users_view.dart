import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:obs/app/Controllers/MainController.dart';
import 'package:obs/app/constants/appMode.dart';
import 'package:obs/app/constants/app_constant.dart';
import 'package:obs/app/modules/mybooks/views/mybooks_view.dart';
import 'package:obs/app/modules/profile/views/profile_view.dart';
import 'package:obs/app/routes/app_pages.dart';

import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UsersController());
    final mainController = Get.put(MainController());
    return Obx((){
      final profile = jsonDecode(controller.profile.value);
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'profile'.tr,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Stack(
                  children: [
                    Container(
                      width: Get.width,
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
                                          "${profile['user_firstname']} ${profile['user_lastname']}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.secondaryColor,
                                          ),
                                        ),
                                        Text(
                                          profile['user_email'],
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
                            onPressed: () async {
                              final result = await Get.to(()=>ProfileView() , arguments: profile);
                              if (result){
                                controller.readProfile();
                              }
                            },
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
                  margin:
                  const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                  child: Card(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: ()=> Get.toNamed(Routes.FORGOT),
                          child: ListTile(
                            leading: Icon(Icons.lock_outline),
                            title: Text("changepassword".tr),
                            subtitle: Text("changepassword_sub".tr),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () => Get.to(() => MybooksView(), arguments: controller.userLogin.value),
                          child: ListTile(
                            leading: Icon(Icons.book_outlined),
                            title: Text("mybooks".tr),
                            subtitle: Text("mybooks_sub".tr),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                        const Divider(),
                        ListTile(
                          leading: Icon(Icons.dark_mode_outlined),
                          title: Text("darkmode".tr),
                          subtitle: Text("darkmode_sub".tr),
                          trailing: Transform.scale(
                              scale: 0.7,
                              child: Switch(
                                value: mainController.isDarkMode.value,
                                onChanged: (value) {
                                  value ? Get.changeThemeMode(ThemeMode.dark) : Get.changeThemeMode(ThemeMode.light);
                                  mainController.writeMode(value);
                                },
                                activeColor: AppColors.primaryColor,
                              )),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () => Get.defaultDialog(
                            title: 'change_lang'.tr,
                            titleStyle:
                            Theme.of(context).textTheme.headlineMedium,
                            content: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    var locale = Locale('kh', 'KM');
                                    Get.updateLocale(locale);
                                    CustomTheme.font = "KantumruyPro";
                                    mainController.writeLanguage('kh');
                                    Get.back();
                                  },
                                  child: ListTile(
                                    leading: Image.asset(
                                      "assets/images/kh.png",
                                      fit: BoxFit.fill,
                                      width: 30,
                                      height: 30,
                                    ),
                                    title: Text(
                                      "khmer".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    trailing: Get.locale == Locale('kh', 'KM')
                                        ? Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.green,
                                    )
                                        : SizedBox(),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    var locale = Locale('en', 'US');
                                    Get.updateLocale(locale);
                                    CustomTheme.font = "Poppins";
                                    mainController.writeLanguage('en');
                                    Get.back();
                                  },
                                  child: ListTile(
                                    leading: Image.asset(
                                      "assets/images/en.png",
                                      fit: BoxFit.fill,
                                      width: 30,
                                      height: 30,
                                    ),
                                    title: Text(
                                      "english".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    trailing: Get.locale == Locale('en', 'US')
                                        ? Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Colors.green,
                                    )
                                        : SizedBox(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.language_outlined),
                            title: Text("change_lang".tr),
                            subtitle: Text("change_lang_sub".tr),
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: ()=> controller.logout(),
                          child: ListTile(
                            leading: Icon(Icons.exit_to_app_outlined),
                            title: Text("logout".tr),
                            subtitle: Text("logout_sub".tr),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
