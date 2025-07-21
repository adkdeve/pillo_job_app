import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pcom_app/common/widgets/smooth_rectangle_border.dart';

import '../../app/core/core.dart';
import '../../app/modules/main/profile/views/my_view_alert_view.dart';
import 'my_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/core/core.dart';
import 'my_text.dart';
import 'smooth_rectangle_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pcom_app/common/widgets/my_text.dart';
import 'package:pcom_app/common/widgets/smooth_rectangle_border.dart';

class MyListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String? buttonText;
  final String? status;
  final Color? statusColor;
  final Color? statusBgColor;
  final VoidCallback? onTap;
  final String? leadingIcon;

  const MyListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    this.buttonText,
    this.status,
    this.statusColor,
    this.statusBgColor,
    this.onTap,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 1.sw,
        padding: const EdgeInsets.only(top: 17, bottom: 11, right: 24, left: 14),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 50,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (leadingIcon != null)
              Container(
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: const Color(0xffF9FAFB),
                  shape: SmoothRectangleBorder(
                    smoothness: 1,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    leadingIcon!,
                    width: 20,
                    height: 20,
                    color: R.theme.green,
                  ),
                ),
              ),

            if (leadingIcon != null) 16.sbw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: title,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  5.sbh,
                  MyText(
                    text: subtitle,
                    fontSize: 12,
                    color: const Color(0xff747A80),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (buttonText != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: ShapeDecoration(
                      color: statusBgColor?.withOpacity(.1) ?? const Color(0xff004EE4).withOpacity(.1),
                      shape: SmoothRectangleBorder(
                        smoothness: 1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: MyText(
                      text: buttonText!,
                      fontSize: 12,
                      color: statusColor ?? const Color(0xff004EE4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (status != null) ...[
                  4.sbh,
                  MyText(
                    text: status!,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ],
                6.sbh,
                MyText(
                  text: date,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff747A80),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
