import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../app/core/resources/app_images.dart';

import '../../../../../common/widgets/custom_chip.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../auth/views/signin_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/profile_controller.dart';

class MyViewAlertView extends GetView<ProfileController> {
  const MyViewAlertView({super.key});

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
                    text: LocaleKeys.alerts_title.tr,
                    fontSize: 22,
                    // color: R.theme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn(),
                ],
              ),
              30.sbh,
              Container(
                width: 1.sw,
                padding: const EdgeInsets.only(
                  top: 17,
                  bottom: 11,
                  right: 24,
                  left: 14,
                ),
                decoration: BoxDecoration(
                  // color: R.theme.white,
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
                          R.image.ic_notification2,
                          width: 20,
                          height: 20,
                          color: R.theme.green,
                        ),
                      ),
                    ),
                    16.sbw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Linstead Jobs',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          // color: R.theme.primary,
                        ),
                        5.sbh,
                        MyText(
                          text: 'Service',
                          fontSize: 12,
                          color: Color(0xff747A80),
                        ),
                      ],
                    ),
                    const Spacer(),
                    MyText(
                      text: 'Aug 10, 2024',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff747A80),
                    ),
                  ],
                ),
              ),
              30.sbh,
               Expanded(
                child: Wrap(
                  // spacing: 16, // Space between chips horizontally
                  runSpacing: 24, // Space between chips vertically
                  children: [
                    CustomChip(label: LocaleKeys.full_time.tr),
                    CustomChip(label: LocaleKeys.remote.tr),
                    CustomChip(label: LocaleKeys.full_name.tr),
                    CustomChip(label: LocaleKeys.industry_sales_marketing.tr),
                    CustomChip(label: LocaleKeys.contract.tr),
                  ],
                ),
              ),
              // const Spacer(),
              PrimaryButton(
                text: LocaleKeys.delete_alert.tr,
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      width: 1.sw,
                      padding: const EdgeInsets.all(26),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(R.image.ic_alert, width: 75, height: 77),
                          16.sbh,
                          MyText(
                            text: LocaleKeys.are_you_sure.tr,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: R.theme.black,
                          ),
                          16.sbh,
                          MyText(
                            text: LocaleKeys.confirm_alert_deletion.tr,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: R.theme.black.withOpacity(.8),
                          ),
                          25.sbh,
                          PrimaryButton(
                            text: LocaleKeys.confirm.tr,
                            color: R.theme.green,
                            borderRadius: 20,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                  );
                },
              ),
              // 10.sbh
              GestureDetector(
                onTap: () => Get.back(),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: MyText(
                    text: LocaleKeys.close.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: R.theme.color500,
                  ),
                ),
              ),
              24.sbh,
            ],
          ),
        ),
      ),
    );
  }
}
