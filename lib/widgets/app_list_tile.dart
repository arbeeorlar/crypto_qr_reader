import 'package:auto_size_text/auto_size_text.dart';
import 'package:fbnmobie/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fbnmobie/util/responsive_screen_functions.dart';

class AppListTile extends StatelessWidget {
  final String valueText;
  final String keyText;
  final bool isGray;

  AppListTile({this.keyText = "", this.valueText = "", this.isGray = false});

  @override
  Widget build(BuildContext context) {
    final Function sh = sHeight(context);
    final Function sw = sWidth(context);

    return Container(
      height: sh(50),
      padding: EdgeInsets.symmetric(horizontal: sw(32)),
      decoration: BoxDecoration(color: isGray ? gray8 : white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              keyText,
              style: Theme.of(context).textTheme.overline!.copyWith(
                    fontSize: sh(12),
                  ),
            ),
          ),
          Expanded(
              flex: 1,
              child: AutoSizeText(valueText,
                  style: Theme.of(context).textTheme.overline!.merge(TextStyle(
                      fontSize: sh(14), fontWeight: FontWeight.w400)))),
        ],
      ),
    );
  }
}
