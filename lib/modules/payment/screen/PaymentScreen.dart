

import 'package:crypto_qr_reader/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/primary_button.dart';
import '../controller/PaymentController.dart';

class PaymentScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());

   return  SafeArea(
      child: Scaffold(
        backgroundColor: white,
        resizeToAvoidBottomInset: true,
        body: Form(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: const Icon(Icons.keyboard_backspace_outlined)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: <Widget>[
                        Text("Payment", style: AppStyles.bodyText(size: 24,color: Colors.black),),
                        const SizedBox(height: 40,),

                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 5),
                          child: Obx(() {
                            return TextFormField(
                              controller: controller.sourceWalletController,
                              //focusNode: controller.usernameFocusNode,
                              showCursor: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              autocorrect: false,
                              textAlign: TextAlign.left,
                              inputFormatters: const [
                                // BlacklistingTextInputFormatter(RegExp(r"\s")),
                                // FilteringTextInputFormatter.deny(
                                //     RegExp(r"\s")),
                              ],
                              decoration: InputDecoration(
                                errorText:
                                controller
                                    .txtSourceWalletError.value == "" || controller
                                    .txtSourceWalletError.value == null ? null : controller
                                    .txtSourceWalletError.value,
                                hintText: 'Source Wallet ID',
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 18, bottom: 18),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(
                                        12)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        //isTransparentBorder ? Colors.transparent : yellow,
                                        width: 2)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(
                                        12)),
                                errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1)),
                                filled: true,
                                fillColor: Colors.grey,
                              ),
                              style: AppStyles.bodyText2(
                                  fontWeight: FontWeight.normal,
                                  size: 14.0,
                                  color: Colors.black),
                              onChanged: controller.clearSourceWalletCode,
                            );
                          }),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 5),
                          child: Obx(() {
                            return TextFormField(
                              controller: controller.destinationWalletController,
                              //focusNode: controller.usernameFocusNode,
                              showCursor: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              autocorrect: false,
                              textAlign: TextAlign.left,
                              inputFormatters: const [
                                // BlacklistingTextInputFormatter(RegExp(r"\s")),
                                // FilteringTextInputFormatter.deny(
                                //     RegExp(r"\s")),
                              ],
                              decoration: InputDecoration(
                                errorText:
                                controller
                                    .txtDestinationWalletError.value == "" || controller
                                    .txtDestinationWalletError.value == null ? null : controller
                                    .txtDestinationWalletError.value,
                                hintText: 'Destination Wallet ID',
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 18, bottom: 18),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(
                                        12)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        //isTransparentBorder ? Colors.transparent : yellow,
                                        width: 2)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(
                                        12)),
                                errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1)),
                                filled: true,
                                fillColor: Colors.grey,
                              ),
                              style: AppStyles.bodyText2(
                                  fontWeight: FontWeight.normal,
                                  size: 14.0,
                                  color: Colors.black),
                              onChanged: controller.clearDestinationWalletCode,
                            );
                          }),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 5),
                          child: Obx(() {
                            return TextFormField(
                              controller: controller.amountController,
                              //focusNode: controller.usernameFocusNode,
                              showCursor: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              autocorrect: false,
                              textAlign: TextAlign.left,
                              inputFormatters: const [
                                // BlacklistingTextInputFormatter(RegExp(r"\s")),
                                // FilteringTextInputFormatter.deny(
                                //     RegExp(r"\s")),
                              ],
                              decoration: InputDecoration(
                                errorText:
                                controller
                                    .txtAmountNameError.value == "" || controller
                                    .txtAmountNameError.value == null ? null : controller
                                    .txtAmountNameError.value,
                                hintText: 'Amount',
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 18, bottom: 18),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(
                                        12)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        //isTransparentBorder ? Colors.transparent : yellow,
                                        width: 2)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(
                                        12)),
                                errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1)),
                                filled: true,
                                fillColor: Colors.grey,
                              ),
                              style: AppStyles.bodyText2(
                                  fontWeight: FontWeight.normal,
                                  size: 14.0,
                                  color: Colors.black),
                              onChanged: controller.clearAmountNameErrorCode,
                            );
                          }),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 5),
                          child: Obx(() {
                            return TextFormField(
                              controller: controller.descriptionController,
                              //focusNode: controller.usernameFocusNode,
                              showCursor: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                              autocorrect: false,
                              textAlign: TextAlign.left,
                              inputFormatters: const [
                                // BlacklistingTextInputFormatter(RegExp(r"\s")),
                                // FilteringTextInputFormatter.deny(
                                //     RegExp(r"\s")),
                              ],
                              decoration: InputDecoration(
                                errorText:
                                controller
                                    .txtDescriptionError.value == "" || controller
                                    .txtDescriptionError.value == null ? null : controller
                                    .txtDescriptionError.value,
                                hintText: 'Transaction Description',
                                contentPadding: const EdgeInsets.only(
                                    left: 18, top: 18, bottom: 18),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(
                                        12)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        //isTransparentBorder ? Colors.transparent : yellow,
                                        width: 2)),
                                disabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1),
                                    borderRadius: BorderRadius.circular(
                                        12)),
                                errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1)),
                                filled: true,
                                fillColor: Colors.grey,
                              ),
                              style: AppStyles.bodyText2(
                                  fontWeight: FontWeight.normal,
                                  size: 14.0,
                                  color: Colors.black),
                              onChanged: controller.clearDescriptionCode,
                            );
                          }),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const SizedBox(height: 20,),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: CustomTextButton(
                              textColor: white,
                              text: 'Proceed',
                              onPressed: controller.validateInputs,
                            ),
                          ),
                          const SizedBox(height: 20,),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}