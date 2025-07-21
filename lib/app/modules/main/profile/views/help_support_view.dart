import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../app/core/resources/app_images.dart';

import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../auth/views/signin_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/profile_controller.dart';
import 'help_chat_view.dart';

class HelpSupportView extends GetView<ProfileController> {
  const HelpSupportView({super.key});

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
                      text: LocaleKeys.help_and_support.tr,
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
              18.sbh,
              InkWell(
                onTap: () {
                  SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle.light.copyWith(
                      statusBarIconBrightness: Brightness.light,
                    ),
                  );
                  Get.to(() => const HelpChatView());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: AppConfig.defaultPadding * 1.5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(9),
                        decoration: ShapeDecoration(
                          color: R.theme.color50,
                          shape: SmoothRectangleBorder(
                            smoothness: 1,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            R.image.ic_chat,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                      16.sbw,
                      MyText(
                        text: LocaleKeys.chat_with_us.tr,
                        fontSize: 16,
                        // color: R.theme.black,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      Icon(
                        size: 14,
                        color: R.theme.color500,
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
                    horizontal: AppConfig.defaultPadding * 1.5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(9),
                        decoration: ShapeDecoration(
                          color: R.theme.color50,
                          shape: SmoothRectangleBorder(
                            smoothness: 1,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            R.image.ic_whatsapp,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                      16.sbw,
                      MyText(
                        text: LocaleKeys.message_us_on_whatsapp.tr,
                        fontSize: 16,
                        // color: R.theme.black,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      Icon(
                        size: 14,
                        color: R.theme.color500,
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
                    horizontal: AppConfig.defaultPadding * 1.5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(9),
                        decoration: ShapeDecoration(
                          color: R.theme.color50,
                          shape: SmoothRectangleBorder(
                            smoothness: 1,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            R.image.ic_doc,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                      16.sbw,
                      MyText(
                        text: LocaleKeys.search_knowledge_base.tr,
                        fontSize: 16,
                        // color: R.theme.black,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      Icon(
                        size: 14,
                        color: R.theme.color500,
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConfig.defaultPadding * 1.5,
                ),
                child: PrimaryButton(
                  text: LocaleKeys.submit_a_request.tr,
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
              20.sbh,
            ],
          ),
        ),
      ),
    );
  }
}
