import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pcom_app/app/core/core.dart';

import '../../../../../common/widgets/build_bullet_point.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../auth/views/signin_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/profile_controller.dart';

class PrivacyPolicyView extends GetView<ProfileController> {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            // horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConfig.defaultPadding * 1.5,
                ),
                child: Row(
                  children: [
                    MyBackBtn(),
                    Spacer(),
                    MyText(
                      text: LocaleKeys.privacy_policy.tr,
                      fontSize: 22,
                      // color: R.theme.primary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                    Spacer(),
                    NotificationBtn(),
                  ],
                ),
              ),
              34.sbh,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: LocaleKeys.information_we_collect.tr,
                        fontSize: 18,
                        // color: R.theme.black,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      7.sbh,
                      MyText(
                        text: LocaleKeys.collection_intro.tr,
                        fontSize: 14,
                        // color: R.theme.black,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                      ),
                      2.sbh,
                      buildBulletPoint(
                        LocaleKeys.bullet_points_personal_info.tr,
                      ),
                      buildBulletPoint(
                        LocaleKeys.bullet_points_device_info.tr,
                      ),
                      buildBulletPoint(
                        LocaleKeys.bullet_points_usage_data.tr,
                      ),
                      15.sbh,
                      MyText(
                        text: LocaleKeys.use_of_information.tr,
                        fontSize: 18,
                        // color: R.theme.black,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      15.sbh,
                      MyText(
                        text: LocaleKeys.use_of_information_intro.tr,
                        fontSize: 14,
                        // color: R.theme.black,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                      ),
                      2.sbh,
                      buildBulletPoint(
                        LocaleKeys.use_bullet_points_improve_app_services.tr,
                      ),
                      buildBulletPoint(
                        LocaleKeys.use_bullet_points_send_info.tr,
                      ),
                      buildBulletPoint(
                        LocaleKeys.use_bullet_points_respond_inquiries.tr,
                      ),
                      buildBulletPoint(
                        LocaleKeys.use_bullet_points_comply_legal_requirements.tr,
                      ),
                      10.sbh,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
