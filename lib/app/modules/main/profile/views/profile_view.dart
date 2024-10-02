import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pillo/app/modules/auth/views/code_verify_view.dart';
import 'package:pillo/app/modules/auth/views/reset_password_confirm_view.dart';
import 'package:pillo/app/modules/auth/views/reset_password_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/modules/main/profile/views/account_info_view.dart';
import 'package:pillo/app/modules/main/profile/views/help_support_view.dart';
import 'package:pillo/app/modules/main/profile/views/my_order_view.dart';
import 'package:pillo/app/modules/main/profile/views/resume_pro_view.dart';
import 'package:pillo/app/modules/main/profile/views/setting_view.dart';
import 'package:pillo/app/modules/main/profile/views/term_policy_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light,
    ));
    List<SettingItem> settingsItems = [
      SettingItem(img: ic_account, text: 'Account Information'),
      SettingItem(img: ic_resume, text: 'Resume Pro'),
      SettingItem(img: ic_orderr, text: 'My Orders'),
      SettingItem(img: ic_term, text: 'Help & Support'),
      SettingItem(img: ic_help, text: 'Terms & Policy'),
      SettingItem(img: ic_pass, text: 'General Settings'),
      SettingItem(img: ic_setting, text: 'Change Password'),
    ];
    return Scaffold(
      // backgroundColor: color25,
      body: Column(
        children: [
          SizedBox(
            width: 1.sw,
            height: 230,
            child: Stack(
              children: [
                Positioned(
                  bottom: 30,
                  child: Container(
                    width: 1.sw,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 35,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(ic_pattern),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 85,
                    height: 85,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: whiteColor,
                        width: 7,
                      ),
                      image: const DecorationImage(
                        image: AssetImage(img_dp),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: Get.mediaQuery.padding.top + 16,
                  child: const MyText(
                    text: 'Profile',
                    fontSize: 22,
                    color: whiteColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ),
          const MyText(
            text: 'Jane Doe',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          6.sbh,
          const MyText(
            text: 'jdoe@test.com',
            color: color500,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          8.sbh,
          Expanded(
            child: ListView.builder(
                itemCount: settingsItems.length,
                padding: const EdgeInsets.all(0),
                itemBuilder: (c, i) {
                  var data = settingsItems[i];
                  return InkWell(
                    onTap: () {
                      SystemChrome.setSystemUIOverlayStyle(
                          SystemUiOverlayStyle.light.copyWith(
                        statusBarIconBrightness: Brightness.dark,
                      ));
                      if (i == 0) {
                        Get.to(() => const AccountInfoView());
                      } else if (i == 1) {
                        Get.to(() => const ResumeProView());
                      } else if (i == 2) {
                        Get.to(() => const MyOrderView());
                      } else if (i == 3) {
                        Get.to(() => const HelpSupportView());
                      } else if (i == 4) {
                        Get.to(() => const TermPolicyView());
                      } else if (i == 5) {
                        Get.to(() => const SettingView());
                      } else if (i == 6) {
                        Get.to(() => const CodeVerifyView(),
                            arguments: 'reset');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 23, right: 23, bottom: 12, top: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
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
                                data.img,
                              ),
                            ),
                          ),
                          defaultPadding.sbw,
                          MyText(
                            text: data.text,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SettingItem {
  final String img;
  final String text;

  SettingItem({required this.img, required this.text});
}
