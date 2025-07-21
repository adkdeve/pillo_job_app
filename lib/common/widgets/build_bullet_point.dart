import 'package:flutter/material.dart';
import 'package:pcom_app/app/core/core.dart';

import 'my_text.dart';

Widget buildBulletPoint(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            8.sbh,
            Icon(
              Icons.circle,
              size: 7,
              // color: R.theme.black.withOpacity(.8),
            ),
          ],
        ),
        12.sbw,
        Expanded(
          child: MyText(
            text: text,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
            height: 1.4,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    ),
  );
}
