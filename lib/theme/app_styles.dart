import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static of(BuildContext context) {
    return AppStyles();
  }

  static TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  static TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  static TextStyle bottomNavigationText(
      {Color? color, double? size, FontWeight? fontWeight}) {
    return TextStyle(
        color: color, fontWeight: fontWeight, fontSize: size);
  }

  static TextStyle dashBoardText(
      {Color? color,
      double? size,
      FontWeight? fontWeight,
      double letterSpacing = 0}) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        letterSpacing: letterSpacing);
  }

  static TextStyle bodyText2(
      {Color? color,
      double? size,
      FontWeight? fontWeight,
      double letterSpacing = 0}) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        letterSpacing: letterSpacing,
        ); //fontFamily: "gilroy"
  }



  static TextStyle appBarText(
      {Color? color, double size = 18.0, double letterSpacing = 0}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: size,
        letterSpacing: letterSpacing,); //fontFamily: "gilroy"
  }

  static ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.black,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  static TextStyle bottomNavigationTextWithOutColor(
      {double? size, FontWeight? fontWeight}) {
    return TextStyle(
        color: primaryColor,
        fontWeight: fontWeight,
        fontSize: size,);
  }

  static TextStyle bodyText(
      {Color? color,
      double size = 18.0,
      double letterSpacing = 0,
      FontWeight? fontWeight}) {
    return TextStyle(
        color: color, fontWeight: fontWeight,fontSize: size);
  }


  static TextStyle underLineText(
      {Color? color,
        double size = 18.0,
        double letterSpacing = 0,
        FontWeight? fontWeight}) {
    return TextStyle(
        color: color, fontWeight: fontWeight, fontSize: size,decoration: TextDecoration.underline);
  }

  static BoxDecoration inputField({bool hasError = false}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: hasError ? Border.all(color: Colors.red) : null,
      color: Colors.grey.shade200,
    );
  }

  static Widget formSpace() {
    return const SizedBox(height: 20);
  }

  static Widget formSectionSpace() {
    return const SizedBox(height: 40);
  }
}
