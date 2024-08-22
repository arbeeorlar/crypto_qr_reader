
import 'package:get/get.dart';

import '../modules/splashscreen/binding/SplashscreenBinding.dart';
import '../modules/splashscreen/screen/SplashscreenPage.dart';
part 'app_routes.dart';


abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
  ];
}