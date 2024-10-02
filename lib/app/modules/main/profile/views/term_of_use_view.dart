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

class TermOfUseView extends GetView<ProfileController> {
  const TermOfUseView({super.key});
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
                      text: 'Terms of Use',
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
                        text: 'Introduction',
                        fontSize: 18,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      10.sbh,
                      const MyText(
                        text:
                            'Welcome to Pillo! These Terms of Use ("Terms") govern your access to and use of the Pillo mobile application and Web ("App") and the services provided therein ("Services"). By accessing or using the App, you agree to be bound by these Terms.',
                        fontSize: 14,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                      ),
                      10.sbh,
                      const MyText(
                        text: '1. Terms of Use',
                        fontSize: 18,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      19.sbh,
                      const MyText(
                        text: '1.1 Eligibility',
                        fontSize: 14,
                        color: green,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      20.sbh,
                      const MyText(
                        text:
                            'You must be at least 18 years old and have the legal capacity to enter into contracts to use the App.',
                        fontSize: 14,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                      ),
                      20.sbh,
                      const MyText(
                        text: '1.2 User Accounts',
                        fontSize: 14,
                        color: green,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                        20.sbh,
                      const MyText(
                        text:
                            'You may be required to create an account to use certain features of the App. You are responsible for maintaining the confidentiality of your account information, including your username and password. You agree to be responsible for all activities that occur under your account.',
                        fontSize: 14,
                        color: blackColor,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                      ),
                      20.sbh,
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
