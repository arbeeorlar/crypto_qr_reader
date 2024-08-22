
import 'package:crypto_qr_reader/modules/printer/PrinterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class PaymentController extends GetxController {

  late TextEditingController amountController;
  late TextEditingController sourceWalletController;
  late TextEditingController destinationWalletController;
  late TextEditingController descriptionController;

  var txtAmountNameError = "".obs;
  var txtSourceWalletError = "".obs;
  var txtDestinationWalletError = "".obs;
  var txtDescriptionError = "".obs;



  void clearAmountNameErrorCode(_) => txtAmountNameError.value = "";
  void clearSourceWalletCode(_) => txtSourceWalletError.value = "";
  void clearDestinationWalletCode(_) => txtDestinationWalletError.value = "";
  void clearDescriptionCode(_) => txtDescriptionError.value = "";


  @override
  void onInit() {

    var barcodeItem = Get.arguments as String ;
    var splitString = barcodeItem.split("#");

    amountController = TextEditingController();
    sourceWalletController = TextEditingController();
    destinationWalletController = TextEditingController();
    descriptionController = TextEditingController();
    sourceWalletController.text = splitString[0];
    amountController.text = splitString[1];
    descriptionController.text = splitString[2];

    super.onInit();
  }


  validateInputs() {
    if (sourceWalletController.text.trim().isEmpty) {
      txtSourceWalletError.value = "Source wallet ID is required";
    }else if(destinationWalletController.text.trim().isEmpty) {
      txtDestinationWalletError.value = "Destination wallet ID is required";
    }else if(amountController.text.trim().isEmpty) {
      txtAmountNameError.value = "Amount is required";
    }else if(descriptionController.text.trim().isEmpty) {
      txtDescriptionError.value = "Transaction Description is required";
    } else {

      var  itemData = PaymentData(sourceWallet: sourceWalletController.text,
          destinationWallet: destinationWalletController.text,
          amount: amountController.text,
          description: descriptionController.text);

      Navigator.push(
        Get.context!,
        MaterialPageRoute(
          builder: (context) => PrinterScreen(itemData: itemData),
        ),
      );

    }
  }

}