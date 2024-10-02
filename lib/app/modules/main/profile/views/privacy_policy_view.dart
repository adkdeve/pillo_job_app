import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/job_details_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/modules/main/profile/views/resume_pro_card_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

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
            vertical: defaultPadding,
            // horizontal: defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                ),
                child: Row(
                  children: [
                    MyBackBtn(),
                    Spacer(),
                    MyText(
                      text: 'Privacy Policy',
                      fontSize: 22,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                    Spacer(),
                    NotificationBtn()
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
                      const MyText(
                        text: 'Information We Collect',
                        fontSize: 18,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      7.sbh,
                      const MyText(
                        text:
                            'We collect certain information when you use the App, including:',
                        fontSize: 14,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                      ),
                      2.sbh,
                      buildBulletPoint(
                          'Personal information you provide, such as your name, email address, and resume.'),
                      buildBulletPoint(
                          'Device information, such as your device type, operating system, and IP address.'),
                      buildBulletPoint(
                          'Usage data, such as how you use the App and the features you access.'),
                      15.sbh,
                      const MyText(
                        text: 'Use of Information',
                        fontSize: 18,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      15.sbh,
                      const MyText(
                        text: 'We use the information we collect to:',
                        fontSize: 14,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                      ),
                      2.sbh,
                      buildBulletPoint(
                          'Provide and improve the App and Services.'),
                      buildBulletPoint(
                          'Send you information about jobs and other opportunities.'),
                      buildBulletPoint(
                          'Respond to your inquiries and requests.'),
                      buildBulletPoint('Comply with legal requirements.'),
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

  // Helper widget for bullet points
  Widget buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.sbw,
          Column(
            children: [
              8.sbh,
              Icon(
                Icons.circle,
                size: 6,
                color: blackColor.withOpacity(.8),
              ),
            ],
          ),
          10.sbw,
          Expanded(
            child: MyText(
              text: text,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.4,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
