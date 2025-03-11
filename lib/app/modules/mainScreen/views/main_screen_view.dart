import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:obs/colors/constants.dart';
import 'package:obs/colors/svgIcon.dart';

import '../controllers/main_screen_controller.dart';
import 'package:badges/badges.dart' as badges;

class MainScreenView extends GetView<MainScreenController> {
  MainScreenView({super.key});

  final mainScreenController = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Start from the right
                end: Offset.zero, // Move to the center
              ).animate(animation),
              child: child,
            ),
            child: mainScreenController
                .pages[mainScreenController.isSelectIndex.value],
          )),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
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
              icon: badges.Badge(
                badgeContent: Text(
                  '0',
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
