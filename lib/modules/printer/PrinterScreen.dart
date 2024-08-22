import 'dart:async';
import 'dart:convert';

import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_colors.dart';
import '../../widgets/app_list_tile.dart';
import '../../widgets/primary_button.dart';


class PrinterScreen extends StatefulWidget {

  final PaymentData? itemData ;

  const PrinterScreen({super.key, this.itemData});

  @override
  _PrinterScreenState createState() => _PrinterScreenState();
}

class _PrinterScreenState extends State<PrinterScreen> {
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

  bool _connected = false;
  BluetoothDevice? _device;
  String tips = 'no device connect';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initBluetooth());
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initBluetooth() async {
    bluetoothPrint.startScan(timeout: Duration(seconds: 4));

    bool isConnected=await bluetoothPrint.isConnected??false;

    bluetoothPrint.state.listen((state) {
      print('******************* cur device status: $state');

      switch (state) {
        case BluetoothPrint.CONNECTED:
          setState(() {
            _connected = true;
            tips = 'connect success';
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          setState(() {
            _connected = false;
            tips = 'disconnect success';
          });
          break;
        default:
          break;
      }
    });

    if (!mounted) return;

    if(isConnected) {
      setState(() {
        _connected=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ivory Pay'),
        ),
        body: RefreshIndicator(
          onRefresh: () =>
              bluetoothPrint.startScan(timeout: const Duration(seconds: 4)),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Text(tips),
                        ),
                      ],
                    ),
                    StreamBuilder<List<BluetoothDevice>>(
                      stream: bluetoothPrint.scanResults,
                      initialData: [],
                      builder: (c, snapshot) => Column(
                        children: snapshot.data!.map((d) => ListTile(
                          title: Text(d.name??''),
                          subtitle: Text(d.address??''),
                          onTap: () async {
                            setState(() {
                              _device = d;
                            });
                          },
                          trailing: _device!=null && _device!.address == d.address?const Icon(
                            Icons.check,
                            color: Colors.green,
                          ):null,
                        )).toList(),
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 50,),
                AppListTile(
                  isGray: true,
                    keyText: "Source Wallet",
                    valueText:
                    widget.itemData!.sourceWallet!),

                AppListTile(
                    keyText: "Destination Wallet",
                    isGray: false,
                    valueText:
                    widget.itemData!.destinationWallet!),
                AppListTile(
                    keyText: "Amount",
                    isGray: true,
                    valueText:
                    widget.itemData!.amount!),

                AppListTile(
                    keyText: "Description",
                    isGray: false,
                    valueText:
                    widget.itemData!.description!),

                const SizedBox(height: 100,),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: Column(
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          OutlinedButton(
                            onPressed:  _connected?null:() async {
                              if(_device!=null && _device!.address !=null){
                                setState(() {
                                  tips = 'connecting...';
                                });
                                await bluetoothPrint.connect(_device!);
                              }else{
                                setState(() {
                                  tips = 'please select device';
                                });
                                print('please select device');
                              }
                            },
                            child: const Text('connect'),
                          ),
                          const SizedBox(width: 10.0),
                          OutlinedButton(
                            onPressed:  _connected?() async {
                              setState(() {
                                tips = 'disconnecting...';
                              });
                              await bluetoothPrint.disconnect();
                            }:null,
                            child: const Text('disconnect'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        height: 50,
                        width: double.infinity,
                        margin: const EdgeInsets.only(right: 30,left: 30),
                        child: CustomTextButton(
                          text: 'Print Receipt',
                          isLogo: false,
                          textSize: 14,
                          backgroundColor: _connected? primaryColor : gray2,
                          textColor: _connected?  white : black,
                          onPressed: _connected?() async {
                            Map<String, dynamic> config = Map();

                            List<LineText> list = [];

                            list.add(LineText(type: LineText.TYPE_TEXT, content: '**********************************************', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
                            list.add(LineText(type: LineText.TYPE_TEXT, content: 'IvoryPay', weight: 1, align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));
                            list.add(LineText(linefeed: 1));

                            list.add(LineText(type: LineText.TYPE_TEXT, content: '------------------------------------------', weight: 1, align: LineText.ALIGN_CENTER, linefeed: 1));
                            list.add(LineText(type: LineText.TYPE_TEXT, content: 'Source Wallet Id :     ${widget.itemData!.sourceWallet}', weight: 1, align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 0));
                            list.add(LineText(type: LineText.TYPE_TEXT, content: 'Destination Wallet Id :     ${widget.itemData!.destinationWallet}', weight: 1, align: LineText.ALIGN_LEFT, x: 350, relativeX: 0, linefeed: 0));
                            list.add(LineText(type: LineText.TYPE_TEXT, content: 'Amount :     ${widget.itemData!.amount}', weight: 1, align: LineText.ALIGN_LEFT, x: 500, relativeX: 0, linefeed: 1));

                            list.add(LineText(type: LineText.TYPE_TEXT, content: 'Transaction Description :     ${widget.itemData!.description}', align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 0));
                            list.add(LineText(type: LineText.TYPE_TEXT, content: 'Payment Method :     QR Payment', align: LineText.ALIGN_LEFT, x: 350, relativeX: 0, linefeed: 0));

                            list.add(LineText(type: LineText.TYPE_TEXT, content: '**********************************************', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
                            list.add(LineText(linefeed: 1));

                            ByteData data = await rootBundle.load("assets/images/ivory_logo.svg");
                            List<int> imageBytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
                            String base64Image = base64Encode(imageBytes);
                            list.add(LineText(type: LineText.TYPE_IMAGE, content: base64Image, align: LineText.ALIGN_CENTER, linefeed: 1));
                            await bluetoothPrint.printReceipt(config, list);
                          }:null,
                        ),
                      ),


                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: StreamBuilder<bool>(
          stream: bluetoothPrint.isScanning,
          initialData: false,
          builder: (c, snapshot) {
            if (snapshot.data == true) {
              return FloatingActionButton(
                onPressed: () => bluetoothPrint.stopScan(),
                backgroundColor: Colors.red,
                child: const Icon(Icons.stop),
              );
            } else {
              return FloatingActionButton(
                  child: const Icon(Icons.search),
                  onPressed: () => bluetoothPrint.startScan(timeout: const Duration(seconds: 4)));
            }
          },
        ),
      ),
    );
  }
}




class PaymentData{

  String? sourceWallet;
  String? destinationWallet;
  String? amount;
  String? description;

  PaymentData({this.sourceWallet,this.destinationWallet,this.description,this.amount});


}