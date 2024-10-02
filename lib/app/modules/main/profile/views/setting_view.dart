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
import 'package:pillo/app/modules/main/profile/views/deactive_account_view.dart';
import 'package:pillo/app/modules/main/profile/views/privacy_policy_view.dart';
import 'package:pillo/app/modules/main/profile/views/resume_pro_card_view.dart';
import 'package:pillo/app/modules/main/profile/views/term_of_use_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class SettingView extends GetView<ProfileController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    var isSwitched = true.obs;
    var isSwitched2 = true.obs;
    var isSwitched3 = true.obs;
    var isSwitched4 = true.obs;

    return Scaffold(
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            // horizontal: defaultPadding * 1.5,
          ),
          child: Column(
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
                      text: 'Settings',
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
              25.sbh,
              Obx(
                () => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyText(
                                    text: 'Enable Face ID or Fingerprint',
                                    fontSize: 14,
                                    color: color900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  4.sbh,
                                  const MyText(
                                    text:
                                        'Enjoy safer, faster and simpler\nway to login. ',
                                    fontSize: 12,
                                    textAlign: TextAlign.left,
                                    color: color500,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: Switch(
                                value: isSwitched.value,
                                onChanged: (value) {
                                  isSwitched.value = value;
                                },
                                activeTrackColor: green,
                                activeColor: whiteColor,
                                inactiveThumbColor: green,
                                inactiveTrackColor: whiteColor,
                              ),
                            ),
                          ],
                        ),
                        27.sbh,
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyText(
                                    text: 'New Job Alerts',
                                    fontSize: 14,
                                    color: color900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  4.sbh,
                                  const MyText(
                                    text:
                                        'You want to receive\nnotifications on new jobs.  ',
                                    fontSize: 12,
                                    textAlign: TextAlign.left,
                                    color: color500,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: Switch(
                                value: isSwitched2.value,
                                onChanged: (value) {
                                  isSwitched2.value = value;
                                },
                                activeTrackColor: green,
                                activeColor: whiteColor,
                                inactiveThumbColor: green,
                                inactiveTrackColor: whiteColor,
                              ),
                            ),
                          ],
                        ),
                        27.sbh,
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyText(
                                    text: 'Application Update',
                                    fontSize: 14,
                                    color: color900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  4.sbh,
                                  const MyText(
                                    text:
                                        'You want to receive notifications\nabout jobs your applied for',
                                    fontSize: 12,
                                    textAlign: TextAlign.left,
                                    color: color500,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: Switch(
                                value: isSwitched3.value,
                                onChanged: (value) {
                                  isSwitched3.value = value;
                                },
                                activeTrackColor: green,
                                activeColor: whiteColor,
                                inactiveThumbColor: green,
                                inactiveTrackColor: whiteColor,
                              ),
                            ),
                          ],
                        ),
                        27.sbh,
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyText(
                                    text: 'New Features Update',
                                    fontSize: 14,
                                    color: color900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  4.sbh,
                                  const MyText(
                                    text:
                                        'You want to receive notifications\nabout new features & releases. ',
                                    fontSize: 12,
                                    textAlign: TextAlign.left,
                                    color: color500,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: Switch(
                                value: isSwitched4.value,
                                onChanged: (value) {
                                  isSwitched4.value = value;
                                },
                                activeTrackColor: green,
                                activeColor: whiteColor,
                                inactiveThumbColor: green,
                                inactiveTrackColor: whiteColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const DeactiveAccountView());
                          },
                          child: const MyText(
                            text: 'Deactivate account',
                            fontSize: 16,
                            textAlign: TextAlign.left,
                            color: green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
