import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../controllers/profile_controller.dart';
import 'account_edit_view.dart';

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
                    text: LocaleKeys.account_info_title.tr,
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
                                  color: R.theme.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(
                                        0xff9CA3AF,
                                      ).withOpacity(.12),
                                      offset: const Offset(5, 15),
                                      blurRadius: 50,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: SvgPicture.asset(R.image.ic_edit_bck),
                              ),
                              Container(
                                width: 82,
                                height: 82,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(R.image.img_dp),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      16.sbh,
                      MyText(
                        text: LocaleKeys.personal_info.tr,
                        fontSize: 16,
                        color: R.theme.color500,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                      16.sbh,
                      Container(
                        width: 1.sw,
                        padding: const EdgeInsets.symmetric(
                          vertical: 21,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: R.theme.color100),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: LocaleKeys.your_name.tr,
                                  fontSize: 14,
                                  opacity: 0.4,
                                  // color: R.theme.color500,
                                  fontWeight: FontWeight.w600,
                                ),
                                MyText(
                                  text: 'Jane Doe',
                                  fontSize: 14,
                                  // color: R.theme.color900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            27.sbh,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: LocaleKeys.date_of_birth.tr,
                                  fontSize: 14,
                                  opacity: 0.4,
                                  // color: R.theme.color500,
                                  fontWeight: FontWeight.w600,
                                ),
                                MyText(
                                  text: 'March 12, 1995',
                                  fontSize: 14,
                                  // color: R.theme.color900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            27.sbh,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: LocaleKeys.gender.tr,
                                  fontSize: 14,
                                  opacity: 0.4,
                                  // color: R.theme.color500,
                                  fontWeight: FontWeight.w600,
                                ),
                                MyText(
                                  text: 'Female',
                                  fontSize: 14,
                                  // color: R.theme.color900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            // 27.sbh,
                            // Obx(
                            //   () => Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: [
                            //        MyText(
                            //         text: '2FA Enabled',
                            //         fontSize: 14,
                            //         color: R.theme.color500,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //       SizedBox(
                            //         height: 20,
                            //         child: Switch(
                            //           value: isSwitched.value,
                            //           onChanged: (value) {
                            //             isSwitched.value = value;
                            //           },
                            //           activeTrackColor: R.theme.green,
                            //           activeColor: R.theme.white,
                            //           inactiveThumbColor: R.theme.green,
                            //           inactiveTrackColor: R.theme.white,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      24.sbh,
                      MyText(
                        text: LocaleKeys.contact_info.tr,
                        fontSize: 16,
                        color: R.theme.color500,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                      16.sbh,
                      Container(
                        width: 1.sw,
                        padding: const EdgeInsets.symmetric(
                          vertical: 21,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: R.theme.color100),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: LocaleKeys.phone_number.tr,
                                  fontSize: 14,
                                  opacity: 0.4,
                                  // color: R.theme.color500,
                                  fontWeight: FontWeight.w600,
                                ),
                                MyText(
                                  text: '(1) 876 456  7666',
                                  fontSize: 14,
                                  // color: R.theme.color900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            27.sbh,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: LocaleKeys.email.tr,
                                  fontSize: 14,
                                  opacity: 0.4,
                                  // color: R.theme.color500,
                                  fontWeight: FontWeight.w600,
                                ),
                                MyText(
                                  text: 'janedoe@test.com',
                                  fontSize: 14,
                                  // color: R.theme.color900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            27.sbh,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: LocaleKeys.country.tr,
                                  fontSize: 14,
                                  opacity: 0.4,
                                  // color: R.theme.color500,
                                  fontWeight: FontWeight.w600,
                                ),
                                MyText(
                                  text: 'Jamaica',
                                  fontSize: 14,
                                  // color: R.theme.color900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      34.sbh,
                      PrimaryButton(
                        text: LocaleKeys.edit.tr,
                        onPressed: () {
                          Get.to(() => const AccountEditView());
                        },
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
