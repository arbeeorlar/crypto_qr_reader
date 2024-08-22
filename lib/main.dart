import 'package:crypto_qr_reader/routes/app_pages.dart';
import 'package:crypto_qr_reader/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ivory Pay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: white,
            //primary: white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          ),
        ),
      ),
      defaultTransition: Transition.noTransition,
      initialRoute: Routes.splashScreen,
      getPages: AppPages.pages,
    );
  }
}


