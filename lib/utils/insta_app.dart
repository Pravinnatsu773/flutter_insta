import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstaApp {
  static const String appName = "Devfest";
  static const String appVersion = "Version 1.0.4";
  static const int appVersionCode = 1;
  static const String appColor = "#ffd7167";
  static Color primaryAppColor = Colors.white;
  static Color secondaryAppColor = Colors.black;
  static const String googleSansFamily = "Rubik";
  static bool isDebugMode = false;
  static const Color textColor = Color(0xff313131);

  //* Preferences
  static late SharedPreferences prefs;
}
