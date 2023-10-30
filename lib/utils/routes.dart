import 'package:flutter_insta/screens/explore/explore.dart';
import 'package:flutter_insta/screens/main_screen/main_screen.dart';
import 'package:get/get.dart';

enum Routes { mainscreen, meditationContent, meditationPlayer, editPage }

Map<Routes, String> _views = {
  Routes.mainscreen: "/",
};

// -> List of all view in app
List<GetPage> navigationViews = [
  GetPage(
    name: _views[Routes.mainscreen]!,
    page: () => MainScreen(),
  ),
];

/// An abstract method for routing through [GetX] as `Get.to()`
void travel(Routes route, {dynamic arguments}) {
  try {
    Get.toNamed(_views[route]!, arguments: arguments);
  } catch (e) {
    throw Exception("The route doesn't exists!");
  }
}

/// An abstract method for routing through [GetX] as `Get.back()`
void travelBack() => Get.back();

/// An abstract method for routing through [GetX] as `Get.off()`
void travelOff(Routes route, {dynamic arguments}) {
  try {
    Get.offAndToNamed(_views[route]!, arguments: arguments);
  } catch (e) {
    throw Exception("The route doesn't exists!");
  }
}

/// An abstract method for routing through [GetX] as `Get.offAll()`
void travelOffAll(Routes route, {dynamic arguments}) {
  try {
    Get.offAllNamed(_views[route]!, arguments: arguments);
  } catch (e) {
    throw Exception("The route doesn't exists!");
  }
}

/// An abstract method for routing through [GetX] as `Get.offNamedUntil()`
void travelOffUntil(Routes route, {bool isCurrentRoutePersisted = false}) {
  try {
    Get.offNamedUntil(_views[route]!, (route) => isCurrentRoutePersisted);
  } catch (e) {
    throw Exception("The route doesn't exists!");
  }
}
