import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_insta/utils/insta_app.dart';
import 'package:flutter_insta/utils/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //   ),
  // );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // * Get Shared Preference Instance for whole app
  InstaApp.prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'InstaApp',
      getPages: navigationViews,
      theme: ThemeData(
        //* Custom Google Font
        // fontFamily: InstaApp.googleSansFamily,
        // primarySwatch: Colors.red,
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: InstaApp.textColor),
          titleMedium: TextStyle(color: InstaApp.textColor),
          titleSmall: TextStyle(color: InstaApp.textColor),
          headlineLarge: TextStyle(color: InstaApp.textColor),
          headlineMedium: TextStyle(color: InstaApp.textColor),
          headlineSmall: TextStyle(color: InstaApp.textColor),
          bodyLarge: TextStyle(color: InstaApp.textColor),
          bodyMedium: TextStyle(color: InstaApp.textColor),
          bodySmall: TextStyle(color: InstaApp.textColor),
        ),
        primaryColor: Colors.white,
        disabledColor: Colors.grey,
        cardColor: Colors.white,
        canvasColor: Colors.grey[50],
        brightness: Brightness.light,

        buttonTheme: Theme.of(context)
            .buttonTheme
            .copyWith(colorScheme: const ColorScheme.light()),
      ),

      // home: MainScreen(),
      initialRoute: '/',
    );
  }
}
