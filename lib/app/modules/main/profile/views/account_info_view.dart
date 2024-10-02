import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/modules/main/profile/views/account_edit_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class AccountInfoView extends GetView<ProfileController> {
  const AccountInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    var isSwitched = true.obs;
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
                    text: 'Account Info 🪪',
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
                    16.sbh,
                    Center(
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xff9CA3AF)
                                          .withOpacity(.12),
                                      offset: const Offset(5, 15),
                                      blurRadius: 50,
                                      spreadRadius: 0,
                                    )
                                  ]),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: SvgPicture.asset(
                                ic_edit_bck,
                              ),
                            ),
                            Container(
                              width: 82,
                              height: 82,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(img_dp),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    16.sbh,
                    const MyText(
                      text: 'Personal Info',
                      fontSize: 16,
                      color: color500,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                    16.sbh,
                    Container(
                      width: 1.sw,
                      padding: const EdgeInsets.symmetric(
                          vertical: 21, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: color100,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'Your name',
                                fontSize: 14,
                                color: color500,
                                fontWeight: FontWeight.w600,
                              ),
                              MyText(
                                text: 'Jane Doe',
                                fontSize: 14,
                                color: color900,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          27.sbh,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'Date of Birth',
                                fontSize: 14,
                                color: color500,
                                fontWeight: FontWeight.w600,
                              ),
                              MyText(
                                text: 'March 12, 1995',
                                fontSize: 14,
                                color: color900,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          27.sbh,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'Gender',
                                fontSize: 14,
                                color: color500,
                                fontWeight: FontWeight.w600,
                              ),
                              MyText(
                                text: 'Female',
                                fontSize: 14,
                                color: color900,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          27.sbh,
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const MyText(
                                  text: '2FA Enabled',
                                  fontSize: 14,
                                  color: color500,
                                  fontWeight: FontWeight.w600,
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
                          ),
                        ],
                      ),
                    ),
                    24.sbh,
                    const MyText(
                      text: 'Contact Info',
                      fontSize: 16,
                      color: color500,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                    16.sbh,
                    Container(
                      width: 1.sw,
                      padding: const EdgeInsets.symmetric(
                          vertical: 21, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: color100,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'Phone number',
                                fontSize: 14,
                                color: color500,
                                fontWeight: FontWeight.w600,
                              ),
                              MyText(
                                text: '(1) 876 456  7666',
                                fontSize: 14,
                                color: color900,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          27.sbh,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: 'Email',
                                fontSize: 14,
                                color: color500,
                                fontWeight: FontWeight.w600,
                              ),
                              MyText(
                                text: 'janedoe@test.com',
                                fontSize: 14,
                                color: color900,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    34.sbh,
                    PrimaryButton(
                        text: 'Edit',
                        onPressed: () {
                          Get.to(() => const AccountEditView());
                        }),
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
