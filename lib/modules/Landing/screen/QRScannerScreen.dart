
import 'package:crypto_qr_reader/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controller/QRScannerController.dart';

class QRScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QRController qrController = Get.put(QRController());

    return Scaffold(
      appBar: AppBar(title: Text('Ivory Pay')),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: GlobalKey(debugLabel: 'QR'),
              onQRViewCreated: qrController.onQRViewCreated,
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            flex: 1,
            child:  Text('Scan the barcode',style: AppStyles.bodyText(size: 16),)
          ),

        ],
      ),
    );
  }
}
