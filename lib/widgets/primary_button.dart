
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double textSize;
  final EdgeInsetsGeometry padding;
  final bool isLogo ;
  final bool isSVG;
  final String imageString;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.all(12.0),
    this.textSize = 16.0,
    this.isLogo = false,
    this.isSVG = false,
    this.imageString = "",
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        textStyle:  AppStyles.bodyText(size: textSize),
        // primary: textColor,
        //  shape: RoundedRectangleBorder(
        //    borderRadius: BorderRadius.circular(12),
        //  ),
        padding: padding,
      ),
      child: isLogo ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          isSVG ? SvgPicture.asset(
            imageString!,
            height: 16,
            width: 16,
          ) :  Image(image: AssetImage(imageString),width: 20,height: 20,),
          const SizedBox(width: 8), // Adjust spacing between icon and text
          // Button text
          Text(
            text,
            style: AppStyles.bodyText(
              color: textColor,
              size: textSize,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ) :  Text(
        text,
        style: AppStyles.bodyText(color: textColor,size: textSize,fontWeight: FontWeight.w400),
      ),
    );
  }
}