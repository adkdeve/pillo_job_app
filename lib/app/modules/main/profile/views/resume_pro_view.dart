import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pcom_app/app/core/core.dart';
import 'package:pcom_app/app/modules/main/profile/views/resume_pro_card_view.dart';
import '../../../../../app/core/resources/app_images.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../auth/views/signin_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/profile_controller.dart';

class ResumeProView extends GetView<ProfileController> {
  const ResumeProView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  MyBackBtn(),
                  Spacer(),
                  MyText(
                    text: LocaleKeys.resume_pro_title.tr,
                    fontSize: 22,
                    // color: R.theme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn(),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      26.sbh,
                      Image.asset(width: 1.sw, R.image.img_card),
                      105.sbh,
                      PrimaryButton(
                        text: LocaleKeys.pay_now.tr,
                        onPressed: () {
                          Get.to(() => const ResumeProCardView());
                        },
                      ),
                      10.sbh,
                      Center(
                        child: MyText(
                          text: LocaleKeys.cancel.tr,
                          fontSize: 16,
                          opacity: 0.5,
                          // color: R.theme.color500,
                          fontWeight: FontWeight.w400,
                        ),
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
