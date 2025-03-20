// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:obs/app/modules/users/controllers/users_controller.dart';
import 'package:obs/colors/constants.dart';
import 'package:obs/colors/svgIcon.dart';

import '../controllers/main_screen_controller.dart';
import 'package:badges/badges.dart' as badges;

class MainScreenView extends GetView<MainScreenController> {
  MainScreenView({super.key});

  final mainScreenController = Get.put(MainScreenController());
  final _userController = Get.put(UsersController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
          mainScreenController.pages[mainScreenController.isSelectIndex.value]),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.black,
          selectedItemColor: dangerDark,
          unselectedItemColor: darkColors,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: (value) {
            mainScreenController.isSelectIndex.value = value;
            debugPrint(
                "This is Page: ${mainScreenController.isSelectIndex.value}");
          },
          currentIndex: mainScreenController.isSelectIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: mainScreenController.isSelectIndex.value == 0
                  ? SvgPicture.asset(
                      svgHome,
                      height: 30,
                      width: 30,
                    )
                  : HugeIcon(
                      icon: HugeIcons.strokeRoundedHome03,
                      color: primaryColors,
                      size: 30.0,
                    ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: mainScreenController.isSelectIndex.value == 1
                  ? SvgPicture.asset(
                      svgFavourite,
                      height: 30.0,
                      width: 30.0,
                    )
                  : HugeIcon(
                      icon: HugeIcons.strokeRoundedFavourite,
                      color: primaryColors,
                      size: 30.0,
                    ),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: mainScreenController.num.value != 0
                  ? badges.Badge(
                      badgeContent: Text(
                        mainScreenController.num.value != 0
                            ? mainScreenController.num.value.toString()
                            : '',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      child: mainScreenController.isSelectIndex.value == 2
                          ? SvgPicture.asset(
                              svgShopping,
                              height: 30.0,
                              width: 30.0,
                            )
                          : HugeIcon(
                              icon: HugeIcons.strokeRoundedShoppingBag03,
                              color: primaryColors,
                              size: 30.0,
                            ),
                    )
                  : mainScreenController.isSelectIndex.value == 2
                      ? SvgPicture.asset(
                          svgShopping,
                          height: 30.0,
                          width: 30.0,
                        )
                      : HugeIcon(
                          icon: HugeIcons.strokeRoundedShoppingBag03,
                          color: primaryColors,
                          size: 30.0,
                        ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: mainScreenController.isSelectIndex.value == 3
                  ? SvgPicture.asset(
                      svgUser,
                      height: 30.0,
                      width: 30.0,
                    )
                  : HugeIcon(
                      icon: HugeIcons.strokeRoundedUser,
                      color: primaryColors,
                      size: 30.0,
                    ),
              label: "Profile",
            ),
          ],
        );
      }),
    );
  }
}
