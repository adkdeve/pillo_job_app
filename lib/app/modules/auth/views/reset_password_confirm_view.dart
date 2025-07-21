// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pcom_app/app/modules/auth/views/signin_view.dart';
import '../../../../app/core/core.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../../common/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';

class ResetPasswordConfirmView extends GetView<AuthController> {
  const ResetPasswordConfirmView({super.key});
  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(R.image.img_password_sucess, width: 145, height: 145),
              (AppConfig.defaultPadding * 3).sbh,
              MyText(
                text: LocaleKeys.password_changed_success.tr,
                fontSize: 22,
                color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
              AppConfig.defaultPadding.sbh,
              MyText(
                text: LocaleKeys.password_change_message.tr,
                fontSize: 14,
                color: R.theme.textLightColor,
                fontWeight: FontWeight.w400,
              ),
              const Spacer(),
              PrimaryButton(
                color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                text: LocaleKeys.login.tr,
                onPressed: () {
                  Get.offAll(() => const SigninView());
                },
              ),
              (AppConfig.defaultPadding * 2).sbh,
            ],
          ),
        ),
      ),
    );
  }
}
