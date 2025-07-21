import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../core/core.dart';
import '../controllers/profile_controller.dart';
import 'deactive_account_view.dart';

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
                      text: LocaleKeys.settings.tr,
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
                                  MyText(
                                    text: LocaleKeys.enableFaceIDTitle.tr,
                                    fontSize: 14,
                                    // color: R.theme.color900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  4.sbh,
                                  MyText(
                                    text: LocaleKeys.enableFaceIDDescription.tr,
                                    fontSize: 12,
                                    textAlign: TextAlign.left,
                                    color: R.theme.color500,
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
                                activeTrackColor: R.theme.green,
                                activeColor: R.theme.white,
                                inactiveThumbColor: R.theme.green,
                                inactiveTrackColor: R.theme.white,
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
                                  MyText(
                                    text: LocaleKeys.newJobAlertsTitle.tr,
                                    fontSize: 14,
                                    // color: R.theme.color900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  4.sbh,
                                  MyText(
                                    text: LocaleKeys.newJobAlertsDescription.tr,
                                    fontSize: 12,
                                    textAlign: TextAlign.left,
                                    color: R.theme.color500,
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
                                activeTrackColor: R.theme.green,
                                activeColor: R.theme.white,
                                inactiveThumbColor: R.theme.green,
                                inactiveTrackColor: R.theme.white,
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
                                  MyText(
                                    text: LocaleKeys.applicationAndOrderUpdateTitle.tr,
                                    fontSize: 14,
                                    // color: R.theme.color900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  4.sbh,
                                  MyText(
                                    text: LocaleKeys.applicationAndOrderUpdateDescription.tr,
                                    fontSize: 12,
                                    textAlign: TextAlign.left,
                                    color: R.theme.color500,
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
                                activeTrackColor: R.theme.green,
                                activeColor: R.theme.white,
                                inactiveThumbColor: R.theme.green,
                                inactiveTrackColor: R.theme.white,
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
                                  MyText(
                                    text: LocaleKeys.newFeaturesUpdateTitle.tr,
                                    fontSize: 14,
                                    // color: R.theme.color900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  4.sbh,
                                  MyText(
                                    text:  LocaleKeys.newFeaturesUpdateDescription.tr,
                                    fontSize: 12,
                                    textAlign: TextAlign.left,
                                    color: R.theme.color500,
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
                                activeTrackColor: R.theme.green,
                                activeColor: R.theme.white,
                                inactiveThumbColor: R.theme.green,
                                inactiveTrackColor: R.theme.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const DeactiveAccountView());
                          },
                          child: MyText(
                            text: LocaleKeys.deactivateAccount.tr,
                            fontSize: 16,
                            textAlign: TextAlign.left,
                            color: R.theme.green,
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



