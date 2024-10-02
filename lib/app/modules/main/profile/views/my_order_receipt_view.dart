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

class MyOrderReceiptView extends GetView<ProfileController> {
  const MyOrderReceiptView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            horizontal: defaultPadding * 1.5,
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  MyBackBtn(),
                  Spacer(),
                  MyText(
                    text: 'My Orders',
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn()
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    26.sbh,
                    Image.asset(
                      width: 1.sw,
                      img_card3,
                    ),
                    67.sbh,
                    PrimaryButton(
                      text: 'Email Invoice',
                      onPressed: () {
                        // Get.to(() => const ResumeProCardView());
                      },
                    ),
                    10.sbh,
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const MyText(
                          text: 'Close',
                          fontSize: 16,
                          color: color500,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    20.sbh,
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
