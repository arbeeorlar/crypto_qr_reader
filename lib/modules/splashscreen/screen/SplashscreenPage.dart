





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../theme/app_colors.dart';
import '../controller/SplashscreenController.dart';

class SplashscreenPage extends GetView<SplashscreenController> {
   SplashscreenPage({super.key});




  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      assignId: true,
      init: controller,
      builder: (_) {
        return  WillPopScope(
          onWillPop: () =>
          Future<bool>.value(false), // splashScreenController.onWillPop,
          child: Scaffold(
            body: Center(
              child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                 color: primaryColor
                ),
                child: FadeTransition(
                  opacity: CurvedAnimation(
                      parent: controller.animationController1,
                      curve: Curves.easeIn),
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 250,
                    child: SvgPicture.asset(
                      'assets/images/ivory_logo.svg',
                      semanticsLabel: 'logo',
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
