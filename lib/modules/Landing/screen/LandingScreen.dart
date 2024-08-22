

import 'dart:developer';

import 'package:crypto_qr_reader/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/primary_button.dart';
import '../controller/LandingController.dart';
import 'QRScannerScreen.dart';

class LandingScreen extends GetView<LandingController> {
  LandingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      assignId: true,
      init: controller,
      builder: (_) {
        return  SafeArea(
          child: Scaffold(
            backgroundColor: white,
            resizeToAvoidBottomInset: true,
            body: Column(
              children: [
                const SizedBox(height: 80,),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(right: 30,left: 30),
                  child: CustomTextButton(
                    text: 'Make Payment',
                    isLogo: false,
                    textSize: 14,
                    backgroundColor: primaryColor,
                    textColor: white,
                    onPressed: () {
                      Get.to(QRScannerPage());
                    },
                  ),
                ),
                const SizedBox(height: 40,),
                Container(
                  margin: EdgeInsets.only(right: 20,left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Transaction History", style: AppStyles.bodyText(size: 16,fontWeight: FontWeight.w500),)
                    ],
                  ),
                )

              ],
            ),

          ),
        );
      },
    );
  }




}