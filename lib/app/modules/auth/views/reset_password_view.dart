// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../app/core/core.dart';

import '../../../../common/widgets/my_back_btn.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../../common/widgets/my_text_form_field.dart';
import '../../../../common/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';
import 'code_verify_view.dart';

class ResetPasswordView extends GetView<AuthController> {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var isButtonEnabled = false.obs;
    final lightMode = Theme.of(context).brightness == Brightness.light;

    emailController.addListener(() {
      if (emailController.text != '' &&
          StringExtensions(emailController.text).isEmail) {
        isButtonEnabled.value = true;
      } else {
        isButtonEnabled.value = false;
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  MyBackBtn(),
                  Spacer(),
                  MyText(
                    text: LocaleKeys.reset_password.tr,
                    fontSize: 24,
                    color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                ],
              ),
              (AppConfig.defaultPadding * 2).sbh,
              Image.asset(R.image.img_reset, height: 170),
              (AppConfig.defaultPadding * 2).sbh,
              MyText(
                text: LocaleKeys.enter_email_message.tr,
                fontSize: 14,
                color: R.theme.textLightColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.1,
              ),
              (AppConfig.defaultPadding * 1.5).sbh,
              MyTextFormField(
                hinttxt: LocaleKeys.email.tr,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: R.image.ic_mail,
              ),
              const Spacer(),
              Obx(
                () => PrimaryButton(
                  color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                  text: LocaleKeys.send_code.tr,
                  disabled: !isButtonEnabled.value,
                  onPressed: () {
                    Get.to(() => const CodeVerifyView(), arguments: 'reset');
                  },
                ),
              ),
              (AppConfig.defaultPadding * 1.5).sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: LocaleKeys.already_have_an_account.tr,
                    fontSize: 16,
                    color: R.theme.color500,
                    fontWeight: FontWeight.w400,
                  ),
                  6.sbw,
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: MyText(
                      text: LocaleKeys.sign_in.tr,
                      fontSize: 16,
                      color: R.theme.green,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              (AppConfig.defaultPadding * 2).sbh,
            ],
          ),
        ),
      ),
    );
  }
}
