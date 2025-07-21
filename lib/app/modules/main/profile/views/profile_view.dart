import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../app/core/resources/app_images.dart';
import 'package:pcom_app/app/modules/main/profile/views/resume_pro_view.dart';
import 'package:pcom_app/app/modules/main/profile/views/setting_view.dart';
import 'package:pcom_app/app/modules/main/profile/views/term_policy_view.dart';

import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/setting_item.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../auth/views/code_verify_view.dart';
import '../controllers/profile_controller.dart';
import 'account_info_view.dart';
import 'help_support_view.dart';
import 'my_alert_view.dart';
import 'my_order_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    List<SettingItem> settingsItems = [
      SettingItem(img: R.image.ic_account, text: LocaleKeys.account_info.tr),
      SettingItem(img: R.image.ic_resume, text: LocaleKeys.resume_pro.tr),
      SettingItem(img: R.image.ic_orderr, text: LocaleKeys.my_orders.tr),
      SettingItem(img: R.image.ic_notification2, text: LocaleKeys.my_alerts.tr),
      SettingItem(img: R.image.ic_term, text: LocaleKeys.help_and_support.tr),
      SettingItem(img: R.image.ic_help, text: LocaleKeys.terms_and_policy.tr),
      SettingItem(img: R.image.ic_pass, text: LocaleKeys.general_settings.tr),
      SettingItem(img: R.image.ic_setting, text: LocaleKeys.change_password.tr),
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
                    decoration: BoxDecoration(
                      color: R.theme.primary,
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
                  child: SvgPicture.asset(R.image.ic_pattern),
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
                      border: Border.all(color: R.theme.white, width: 7),
                      image: DecorationImage(image: AssetImage(R.image.img_dp)),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: Get.mediaQuery.padding.top + 16,
                  child: MyText(
                    text: LocaleKeys.profile.tr,
                    fontSize: 22,
                    color: R.theme.white,
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
          MyText(
            text: 'jdoe@test.com',
            color: R.theme.color500,
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
                      ),
                    );
                    if (i == 0) {
                      Get.to(() => const AccountInfoView());
                    } else if (i == 1) {
                      Get.to(() => const ResumeProView());
                    } else if (i == 2) {
                      Get.to(() => const MyOrderView());
                    } else if (i == 3) {
                      Get.to(() => const MyAlertView());
                    } else if (i == 4) {
                      Get.to(() => const HelpSupportView());
                    } else if (i == 5) {
                      Get.to(() => const TermPolicyView());
                    } else if (i == 6) {
                      Get.to(() => const SettingView());
                    } else if (i == 7) {
                      Get.to(() => const CodeVerifyView(), arguments: 'reset');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 23,
                      right: 23,
                      bottom: 12,
                      top: 12,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: R.theme.color50,
                            shape: SmoothRectangleBorder(
                              smoothness: 1,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Center(child: SvgPicture.asset(data.img)),
                        ),
                        AppConfig.defaultPadding.sbw,
                        MyText(
                          text: data.text,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

