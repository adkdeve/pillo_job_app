import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            horizontal: defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const MyBackBtn(),
                  const Spacer(),
                  const MyText(
                    text: 'Notifications',
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  const Spacer(),
                  MyBackBtn(
                    icon: ic_double_tick,
                    onTap: () {},
                  ),
                ],
              ),
              40.sbh,
              const MyText(
                text: 'Today',
                fontSize: 16,
                color: green,
                fontWeight: FontWeight.w700,
              ),
              16.sbh,
              const Notificationtem(
                icon: ic_notification_mail,
                title: 'Application Update',
                msg: 'Your Facebook application was reviewed.',
                time: '1m ago',
              ),
              24.sbh,
              const Notificationtem(
                icon: ic_notification_heart,
                title: 'Recently added Jobs',
                msg: '35 New remote Job was added today. ',
                time: '10m ago',
              ),
              24.sbh,
              const MyText(
                text: 'This Week',
                fontSize: 16,
                color: green,
                fontWeight: FontWeight.w700,
              ),
              16.sbh,
              const Notificationtem(
                icon: ic_notification_mail,
                title: 'Application Update',
                msg: 'Your Shell Application was not selected.',
                time: 'Dec 23',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
              color: color50, borderRadius: BorderRadius.circular(12)),
          child: SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
          ),
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
                  MyText(
                    text: title,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  // Spacer(),
                  MyText(
                    text: time,
                    fontSize: 12,
                    color: color500,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              4.sbh,
              MyText(
                text: msg,
                fontSize: 12,
                color: color500,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
