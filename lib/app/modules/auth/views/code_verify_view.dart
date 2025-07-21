// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../../common/widgets/my_back_btn.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../../common/widgets/primary_button.dart';
import '../../../../common/widgets/resend_code_widget.dart';
import '../../../core/core.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';
import 'add_new_password_view.dart';
import 'choose_location_view.dart';

class CodeVerifyView extends GetView<AuthController> {
  const CodeVerifyView({super.key});
  @override
  Widget build(BuildContext context) {
    var isButtonEnabled = false.obs;
    final lightMode = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyBackBtn(),
              (AppConfig.defaultPadding * 1.8).sbh,
              MyText(
                text: LocaleKeys.verify_its_you.tr,
                fontSize: 24,
                color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
              ),
              (AppConfig.defaultPadding / 1.5).sbh,
              Text.rich(
                maxLines: 2,
                TextSpan(
                  children: [
                    TextSpan(
                      text: LocaleKeys.we_sent_code.tr,
                      style: GoogleFonts.inter().copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 0.3,
                        color: R.theme.color500,
                      ),
                    ),
                    TextSpan(
                      text: LocaleKeys.email_placeholder.tr,
                      style: GoogleFonts.inter().copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.3,
                        color: R.theme.red,
                      ),
                    ),
                    TextSpan(
                      text: LocaleKeys.enter_code_here.tr,
                      style: GoogleFonts.inter().copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 0.3,
                        color: R.theme.color500,
                      ),
                    ),
                  ],
                ),
              ),
              (AppConfig.defaultPadding * 2).sbh,
              Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                submittedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontSize: 24,
                    color: R.theme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: lightMode ? R.theme.color50 : R.theme.color500,
                    borderRadius: 12.radius,
                    border: Border.all(
                      color: const Color(0xffE5E7EB),
                      width: 1.5,
                    ),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: lightMode ? R.theme.color50 : R.theme.color500,
                    borderRadius: 12.radius,
                    border: Border.all(color: R.theme.green, width: 1.5),
                  ),
                ),
                pinAnimationType: PinAnimationType.scale,
                length: 5,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: lightMode ? R.theme.color50 : R.theme.color500,
                    borderRadius: 12.radius,
                    border: Border.all(
                      color: const Color(0xffE5E7EB),
                      width: 1.5,
                    ),
                  ),
                ),
                onCompleted: (String verificationCode) {
                  isButtonEnabled.value = true;
                },
                onChanged: (code) {
                  isButtonEnabled.value = false;
                  // debugPrint('onChanged: $value');
                },
                // cursor: const Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(bottom: 9),
                //       width: 22,
                //       height: 1,
                //       color: Colors.red,
                //     ),
                //   ],
                // ),
              ),
              (AppConfig.defaultPadding * 2).sbh,
              const ResendCodeWidget(),
              const Spacer(),
              Obx(
                () => PrimaryButton(
                  color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                  disabled: !isButtonEnabled.value,
                  text: LocaleKeys.confirm.tr,
                  onPressed: () {
                    String type = Get.arguments ?? '';
                    if (type == 'reset') {
                      Get.to(() => const AddNewPasswordView());
                    } else if (type == 'signin') {
                      SystemChrome.setSystemUIOverlayStyle(
                        SystemUiOverlayStyle.light.copyWith(
                          statusBarIconBrightness: Brightness.light,
                          statusBarColor: R.theme.primary,
                        ),
                      );
                      Get.toNamed(Routes.MAIN);
                    } else if (type == 'signup') {
                      Get.to(() => const ChooseLocationView());
                    }
                  },
                ),
              ),
              (AppConfig.defaultPadding * 2).sbh,
            ],
          ),
        ),
      ),
    );
  }
}


