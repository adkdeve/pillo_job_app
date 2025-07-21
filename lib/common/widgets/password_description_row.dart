import 'package:flutter/material.dart';

import '../../app/core/core.dart';
import 'my_text.dart';

Widget passwordDescription({
  required IconData iconData, // IconData to be passed for different icons
  required Color iconColor,
  required String text,
  required double iconSize,
  required Color textColor,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return Row(
    children: [
      Icon(iconData, color: iconColor, size: iconSize), // Use passed iconData
      (AppConfig.defaultPadding / 2).sbw,
      MyText(
        text: text,
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
    ],
  );
}