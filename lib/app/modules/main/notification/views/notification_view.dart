import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../core/localization/locales.g.dart';

import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_item.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MyBackBtn(),
                  const Spacer(),
                  MyText(
                    text: LocaleKeys.notifications.tr,
                    fontSize: 22,
                    // color: R.theme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  const Spacer(),
                  MyBackBtn(icon: R.image.ic_double_tick, onTap: () {}),
                ],
              ),
              40.sbh,
              MyText(
                text: LocaleKeys.today.tr,
                fontSize: 16,
                color: R.theme.green,
                fontWeight: FontWeight.w700,
              ),
              16.sbh,
              Notificationtem(
                icon: R.image.ic_notification_mail,
                title: LocaleKeys.application_update.tr,
                msg: LocaleKeys.facebook_application_reviewed.tr,
                time: '1m ago',
              ),
              24.sbh,
              Notificationtem(
                icon: R.image.ic_notification_heart,
                title: LocaleKeys
                    .new_jobs_added
                    .tr, // TODO: Add a specific key for this if needed
                msg: LocaleKeys.new_jobs_added.tr,
                time: '10m ago',
              ),
              24.sbh,
              MyText(
                text: LocaleKeys.this_week.tr,
                fontSize: 16,
                color: R.theme.green,
                fontWeight: FontWeight.w700,
              ),
              16.sbh,
              Notificationtem(
                icon: R.image.ic_notification_mail,
                title: LocaleKeys.application_update.tr,
                msg: LocaleKeys.application_not_selected.tr,
                time: 'Dec 23',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
