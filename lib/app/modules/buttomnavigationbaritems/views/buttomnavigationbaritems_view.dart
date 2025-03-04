import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:obs/colors/constants.dart';
import 'package:obs/colors/svgIcon.dart';
import '../controllers/buttomnavigationbaritems_controller.dart';

class ButtomnavigationbaritemsView
    extends GetView<ButtomnavigationbaritemsController> {
  ButtomnavigationbaritemsView({super.key});

  // Access the controller
  final controllersButtom = Get.put(ButtomnavigationbaritemsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: dangerDark,
        unselectedItemColor: darkColors,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (value) {
          controllersButtom.isSelectIndex.value = value;
          debugPrint("This is Page: ${controllersButtom.isSelectIndex.value}");
        },
        currentIndex: controllersButtom.isSelectIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: controllersButtom.isSelectIndex.value == 0
                  ? SvgPicture.asset(
                      svgHome,
                      height: 24,
                      width: 24,
                    )
                  : HugeIcon(
                      icon: HugeIcons.strokeRoundedHome03,
                      color: primaryColors,
                      size: 24.0,
                    ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: controllersButtom.isSelectIndex.value == 1
                  ? SvgPicture.asset(
                      svgFavourite,
                      height: 24,
                      width: 24,
                    )
                  : HugeIcon(
                      icon: HugeIcons.strokeRoundedFavourite,
                      color: primaryColors,
                      size: 24.0,
                    ),
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: controllersButtom.isSelectIndex.value == 2
                  ? SvgPicture.asset(
                      svgShopping,
                      height: 24,
                      width: 24,
                    )
                  : HugeIcon(
                      icon: HugeIcons.strokeRoundedShoppingBag03,
                      color: primaryColors,
                      size: 24.0,
                    ),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: controllersButtom.isSelectIndex.value == 3
                  ? SvgPicture.asset(
                      svgUser,
                      height: 24,
                      width: 24,
                    )
                  : HugeIcon(
                      icon: HugeIcons.strokeRoundedUser,
                      color: primaryColors,
                      size: 24.0,
                    ),
            ),
            label: "Profile",
          ),
        ],
      );
    });
  }
}
