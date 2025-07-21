import 'package:flutter/material.dart';
import 'package:pcom_app/common/widgets/smooth_rectangle_border.dart';

import 'my_text.dart';

Widget customJobDescriptionContainer({
  required BuildContext context,  // Add context as a parameter
  required String text,
  required double fontSize,
  required Color lightColor,
  required Color darkColor,
  required double borderRadius,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 5,
    ),
    decoration: ShapeDecoration(
      color: Theme.of(context).brightness == Brightness.light
          ? lightColor // Light theme decoration color
          : darkColor, // Dark theme decoration color
      shape: SmoothRectangleBorder(
        smoothness: 1,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    child: Center(
      child: MyText(
        text: text,
        fontSize: fontSize,
        opacity: 0.4,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
