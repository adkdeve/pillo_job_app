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
import 'package:pillo/app/modules/main/profile/views/help_chat_view.dart';
import 'package:pillo/app/modules/main/profile/views/resume_pro_card_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class HelpSupportView extends GetView<ProfileController> {
  const HelpSupportView({super.key});
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
                      text: 'Help & Support',
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
              18.sbh,
              InkWell(
                onTap: () {
                  SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.light.copyWith(
                    statusBarColor: primaryColor,
                    statusBarIconBrightness: Brightness.light,
                  ));
                  Get.to(() => const HelpChatView());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: defaultPadding * 1.5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(9),
                        decoration: ShapeDecoration(
                          color: color50,
                          shape: SmoothRectangleBorder(
                            smoothness: 1,
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            ic_chat,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                      16.sbw,
                      const MyText(
                        text: 'Chat with us',
                        fontSize: 16,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      const Icon(
                        size: 14,
                        color: color500,
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ],
                  ),
                ),
              ),

              8.sbh,
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: defaultPadding * 1.5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(9),
                        decoration: ShapeDecoration(
                          color: color50,
                          shape: SmoothRectangleBorder(
                            smoothness: 1,
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            ic_whatsapp,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                      16.sbw,
                      const MyText(
                        text: 'Message us on WhatsApp',
                        fontSize: 16,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      const Icon(
                        size: 14,
                        color: color500,
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ],
                  ),
                ),
              ),
              8.sbh,
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: defaultPadding * 1.5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(9),
                        decoration: ShapeDecoration(
                          color: color50,
                          shape: SmoothRectangleBorder(
                            smoothness: 1,
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            ic_doc,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                      16.sbw,
                      const MyText(
                        text: 'Search our Knowledge Base',
                        fontSize: 16,
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      const Icon(
                        size: 14,
                        color: color500,
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                ),
                child: PrimaryButton(
                  text: 'Submit a Request',
                  onPressed: () {
                    // Get.to(() => const ResumeProCardView());
                  },
                ),
              ),
              // 10.sbh,
              // Center(
              //   child: GestureDetector(
              //     onTap: () {
              //       Get.back();
              //     },
              //     child: const MyText(
              //       text: 'Close',
              //       fontSize: 16,
              //       color: color500,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              20.sbh
            ],
          ),
        ),
      ),
    );
  }
}
