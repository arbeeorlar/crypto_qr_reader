
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
//import 'package:qr_code_scanner/qr_code_scanner.dart';

class LandingController extends GetxController{


  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void onInit() async{
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }


  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
       log("scannedDataStream ${scanData.code.toString()}");
    });
  }


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }




}