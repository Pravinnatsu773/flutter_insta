import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InstaController extends GetxController {
  final isDarModeOn = false.obs;

  reelModeChange() {
    if (isDarModeOn.value) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      );
    }
  }

  changeThemeMode() {
    // if (Get.isDarkMode) {
    //   Get.changeThemeMode(ThemeMode.light);

    //   // InstaApp.prefs.setBool(InstaApp.darkModePref, false);
    //   isDarModeOn.value = false;
    // } else {
    //   Get.changeThemeMode(ThemeMode.dark);

    //   // InstaApp.prefs.setBool(InstaApp.darkModePref, true);
    //   isDarModeOn.value = true;
    // }
  }

  checkThemeMode() {
    // isDarModeOn.value = InstaApp.prefs.getBool(InstaApp.darkModePref) ?? false;
    isDarModeOn.value = isDarModeOn.value ? false : true;
  }
}
