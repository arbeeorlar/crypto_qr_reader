

import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../routes/app_pages.dart';


class SplashscreenController extends GetxController  with GetTickerProviderStateMixin {

  late AnimationController animationController1 =
  AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));





  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    animationController1.forward();
    initAnimationListener();
    super.onReady();
  }


  void initAnimationListener() async {

    animationController1.addListener(() async {
      if (animationController1.isCompleted) {
        loadData();
      }
    });
  }


    Future<Timer> loadData() async {
    return Timer(const Duration(milliseconds: 5000), onDoneLoading);
  }

  onDoneLoading() async {
    Get.offAndToNamed(Routes.landingScreen);
  }

  @override
  void onClose() {
    animationController1.dispose();
    Get.delete();
    super.onClose();
  }


}

//   @override
//   void onInit() {
//     loadData();
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   Future<Timer> loadData() async {
//     return Timer(const Duration(seconds: 5), onDoneLoading);
//   }
//
//   onDoneLoading() async {
//     Get.offAndToNamed(Routes.walkthroughScreen);
//   }
// }