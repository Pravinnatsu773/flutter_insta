// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_insta/screens/explore/explore.dart';
import 'package:flutter_insta/screens/home_page/home_page.dart';
import 'package:flutter_insta/screens/main_screen/main_screen_controller.dart';
import 'package:flutter_insta/screens/profile/profile.dart';
import 'package:flutter_insta/screens/reels/reels.dart';
import 'package:flutter_insta/utils/controllers/insta_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final mainScreenController = Get.put(MainScreenController());
  final instaController = Get.put(InstaController());

  final screens = <Widget>[
    HomePage(),
    Explore(),
    const ReelsPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: Scaffold(
            backgroundColor: Colors.white,
            body: screens[mainScreenController.bottomNavIndex.value]),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
              color: instaController.isDarModeOn.value
                  ? Colors.black
                  : Colors.white,
              border: Border(
                  top: BorderSide(
                      width: 0.6, color: Colors.grey.withOpacity(0.4)))),
          child: bottomNavButtons(),
        ),
      ),
    );
  }

  Widget bottomNavButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            mainScreenController.bottomNavIndex.value = 0;

            instaController.isDarModeOn.value = false;
            instaController.reelModeChange();
          },
          child: mainScreenController.bottomNavIndex.value == 0
              ? SvgPicture.asset(
                  'assets/home-20-filled.svg',
                  width: 32,
                )
              : SvgPicture.asset(
                  'assets/home-20-regular.svg',
                  width: 32,
                  color:
                      instaController.isDarModeOn.value ? Colors.white : null,
                ),
        ),
        GestureDetector(
          onTap: () {
            mainScreenController.bottomNavIndex.value = 1;

            instaController.isDarModeOn.value = false;
            instaController.reelModeChange();
          },
          child: mainScreenController.bottomNavIndex.value == 1
              ? SvgPicture.asset(
                  'assets/search-line.svg',
                  width: 28,
                )
              : SvgPicture.asset(
                  'assets/search.svg',
                  width: 28,
                  color:
                      instaController.isDarModeOn.value ? Colors.white : null,
                ),
        ),
        GestureDetector(
          onTap: () {
            mainScreenController.bottomNavIndex.value = 2;
            instaController.isDarModeOn.value = true;
            instaController.reelModeChange();
          },
          child: mainScreenController.bottomNavIndex.value == 2
              ? SvgPicture.asset(
                  'assets/play-bold.svg',
                  width: 26,
                  color:
                      instaController.isDarModeOn.value ? Colors.white : null,
                )
              : SvgPicture.asset(
                  'assets/play-line-duotone.svg',
                  width: 26,
                ),
        ),
        GestureDetector(
          onTap: () {
            mainScreenController.bottomNavIndex.value = 3;

            instaController.isDarModeOn.value = false;
            instaController.reelModeChange();
          },
          child: mainScreenController.bottomNavIndex.value == 3
              ? SvgPicture.asset(
                  'assets/profile-circle-fill.svg',
                  width: 32,
                  color:
                      instaController.isDarModeOn.value ? Colors.white : null,
                )
              : SvgPicture.asset(
                  'assets/profile-circle-light.svg',
                  width: 32,
                  color:
                      instaController.isDarModeOn.value ? Colors.white : null,
                ),
        ),
      ],
    );
  }
}
