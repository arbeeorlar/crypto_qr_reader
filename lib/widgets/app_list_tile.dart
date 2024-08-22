
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppListTile extends StatelessWidget {
  final String valueText;
  final String keyText;
  final bool isGray;

  AppListTile({this.keyText = "", this.valueText = "", this.isGray = false});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: isGray ? gray20 : white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              keyText,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 12,
                  ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Text(valueText,
                  style: Theme.of(context).textTheme.headlineSmall!.merge(const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400)))),
        ],
      ),
    );
  }
}
