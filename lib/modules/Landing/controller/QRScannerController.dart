import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../routes/app_pages.dart';
import '../../payment/screen/PaymentScreen.dart';

class QRController extends GetxController {
  var result = Rxn<Barcode>();
  QRViewController? qrViewController;

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      // result.value = scanData;
       Get.to(PaymentScreen(),arguments: scanData.code.toString());

    });
  }

  void disposeQRView() {
    qrViewController?.dispose();
  }
}
