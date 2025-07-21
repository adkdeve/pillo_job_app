import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/my_text.dart';

class Notificationtem extends StatelessWidget {
  const Notificationtem({
    super.key,
    required this.icon,
    required this.title,
    required this.msg,
    required this.time,
  });
  final String icon;
  final String title;
  final String msg;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: R.theme.color50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(icon, width: 24, height: 24),
        ),
        16.sbw,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MyText(
                      text: title,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Spacer(),
                  MyText(
                    text: time,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                    color: R.theme.color500,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              4.sbh,
              MyText(
                text: msg,
                fontSize: 12,
                color: R.theme.color500,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
