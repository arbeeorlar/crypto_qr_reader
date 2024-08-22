import 'package:get/get.dart';
import '../controller/LandingController.dart';


class LandingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandingController());
  }
}