import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/filter_view.dart';
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

class MyViewAlertView extends GetView<ProfileController> {
  const MyViewAlertView({super.key});
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
                    text: 'My Alerts',
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn()
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
                  color: whiteColor,
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
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          ic_notification2,
                          width: 20,
                          height: 20,
                          color: green,
                        ),
                      ),
                    ),
                    16.sbw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MyText(
                          text: 'Linstead Jobs',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                        5.sbh,
                        const MyText(
                          text: 'Service',
                          fontSize: 12,
                          color: Color(0xff747A80),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const MyText(
                      text: 'Aug 10, 2024',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff747A80),
                    )
                  ],
                ),
              ),
              30.sbh,
              const Expanded(
                child: Wrap(
                  // spacing: 16, // Space between chips horizontally
                  runSpacing: 24, // Space between chips vertically
                  children: [
                    CustomChip(label: "Full Time"),
                    CustomChip(label: "Remote"),
                    CustomChip(label: "Linstead Jamaica"),
                    CustomChip(label: "Sales & Marketing"),
                    CustomChip(label: "Contract"),
                  ],
                ),
              ),
              // const Spacer(),
              PrimaryButton(
                text: 'Delete Alert',
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
                          SvgPicture.asset(
                            ic_alert,
                            width: 75,
                            height: 77,
                          ),
                          16.sbh,
                          const MyText(
                            text: 'Are you sure?',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: blackColor,
                          ),
                          16.sbh,
                          MyText(
                            text:
                                'Please confirm you would like to\ndelete this alert',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: blackColor.withOpacity(.8),
                          ),
                          25.sbh,
                          PrimaryButton(
                            text: 'Confirm',
                            color: green,
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
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: MyText(
                    text: 'Close',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: color500,
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

class CustomChip extends StatelessWidget {
  final String label;

  const CustomChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(10, 99, 117, 0.10),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: green,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(16),
        //   side: BorderSide.none,
        // ),
      ),
    );
  }
}
