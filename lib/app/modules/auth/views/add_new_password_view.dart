// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pcom_app/app/modules/auth/views/reset_password_confirm_view.dart';
import '../../../../app/core/core.dart';

import 'package:get/get.dart';
import '../../../../common/widgets/my_back_btn.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../../common/widgets/my_text_form_field.dart';
import '../../../../common/widgets/password_description_row.dart';
import '../../../../common/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';

class AddNewPasswordView extends GetView<AuthController> {
  const AddNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var isButtonEnabled = false.obs;
    var passwordController = TextEditingController();
    final lightMode = Theme.of(context).brightness == Brightness.light;

    passwordController.addListener(() {
      if (passwordController.text != ''
          // && StringExtensions(passwordController.text).isValidPassword
      ) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyBackBtn(),
              (AppConfig.defaultPadding * 1.8).sbh,
              MyText(
                text: LocaleKeys.create_new_password.tr,
                fontSize: 24,
                color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
              ),
              (AppConfig.defaultPadding / 1.5).sbh,
              MyText(
                text: LocaleKeys.enter_new_password.tr,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.3,
                color: R.theme.color500,
              ),
              (AppConfig.defaultPadding * 1.5).sbh,
              MyTextFormField(
                hinttxt: LocaleKeys.password.tr,
                obscureTxt: true,
                controller: TextEditingController(),
                prefixIcon: R.image.ic_lock,
                suffixIcon: R.image.ic_eye_lock,
                onChange: (str) {},
              ),
              (AppConfig.defaultPadding).sbh,
              MyTextFormField(
                hinttxt: LocaleKeys.confirm_password.tr,
                obscureTxt: true,
                controller: passwordController,
                prefixIcon: R.image.ic_lock,
                suffixIcon: R.image.ic_eye_lock,
                onChange: (str) {},
              ),
              (AppConfig.defaultPadding * 1.3).sbh,
              passwordDescription(
                iconData: Icons.circle,
                iconColor: R.theme.red,
                text: LocaleKeys.min_8_characters.tr,
                iconSize: 8,
                textColor: R.theme.red,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              (AppConfig.defaultPadding / 2).sbh,
              passwordDescription(
                iconData: Icons.circle,
                iconColor: R.theme.green,
                text: LocaleKeys.uppercase_lowercase_characters.tr,
                iconSize: 8,
                textColor: R.theme.green,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              (AppConfig.defaultPadding / 2).sbh,
              passwordDescription(
                iconData: Icons.circle,
                iconColor: R.theme.green,
                text: LocaleKeys.one_number.tr,
                iconSize: 8,
                textColor: R.theme.green,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              (AppConfig.defaultPadding / 2).sbh,
              passwordDescription(
                iconData: Icons.trip_origin,
                iconColor: R.theme.color400,
                text: LocaleKeys.special_character.tr,
                iconSize: 8,
                textColor: R.theme.color400,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              Obx(
                    () => PrimaryButton(
                      color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                      text: LocaleKeys.reset_password.tr,
                  disabled: !isButtonEnabled.value,
                  onPressed: () {
                    Get.to(() => const ResetPasswordConfirmView());
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

