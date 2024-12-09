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
import 'package:pillo/app/modules/main/profile/views/my_view_alert_view.dart';
import 'package:pillo/app/modules/main/profile/views/resume_pro_card_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/my_text_form_field.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class AddMyViewAlertView extends GetView<ProfileController> {
  const AddMyViewAlertView({super.key});
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  MyBackBtn(),
                  Spacer(),
                  MyText(
                    text: 'Create Alerts',
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

              const Wrap(
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
              30.sbh,
              // const MyText(
              //   text: 'Alert Name',
              //   fontSize: 16,
              //   fontWeight: FontWeight.w600,
              // ),
              // defaultPadding.sbh,
              // MyTextFormField(
              //   controller: TextEditingController(),
              //   hinttxt: 'Enter alert name',
              // ),
              // 8.sbh,

              // defaultPadding.sbh,
              const Textedit2(
                title: 'Alert Name',
                titleFontSize: 16,
                titleTextColor: color900,
                textFontSize: 14,
                hintText: 'Enter alert name',
              ),
              8.sbh,
              const Textedit2(
                title: 'Alert Frequency',
                icon: ic_arrow_down,
                titleFontSize: 16,
                titleTextColor: color900,
                textFontSize: 14,
                text: 'Choose Frequency',
              ),

              const Spacer(),
              PrimaryButton(
                text: 'Save Alert',
                onPressed: () {
                  // Get.bottomSheet(
                  //   Container(
                  //     width: 1.sw,
                  //     padding: const EdgeInsets.all(26),
                  //     margin: const EdgeInsets.symmetric(
                  //       horizontal: 10,
                  //       vertical: 8,
                  //     ),
                  //     decoration: const BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.all(Radius.circular(40)),
                  //     ),
                  //     child: Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         SvgPicture.asset(
                  //           ic_alert,
                  //           width: 75,
                  //           height: 77,
                  //         ),
                  //         16.sbh,
                  //         const MyText(
                  //           text: 'Are you sure?',
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w700,
                  //           color: blackColor,
                  //         ),
                  //         16.sbh,
                  //         MyText(
                  //           text:
                  //               'Please confirm you would like to\ndelete this alert',
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w400,
                  //           color: blackColor.withOpacity(.8),
                  //         ),
                  //         25.sbh,
                  //         PrimaryButton(
                  //           text: 'Confirm',
                  //           color: green,
                  //           borderRadius: 20,
                  //           onPressed: () {
                  //             Get.back();
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   backgroundColor: Colors.transparent,
                  //   isScrollControlled: true,
                  // );
                },
              ),
              // 10.sbh
              Center(
                child: GestureDetector(
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
              ),
              24.sbh,
            ],
          ),
        ),
      ),
    );
  }
}
