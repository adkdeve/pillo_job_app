// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/views/signin_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import '../controllers/auth_controller.dart';

class ResetPasswordConfirmView extends GetView<AuthController> {
  const ResetPasswordConfirmView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            horizontal: defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                img_password_sucess,
                width: 145,
                height: 145,
              ),
              (defaultPadding * 3).sbh,
              const MyText(
                text: 'Great! your password\nhas changed',
                fontSize: 22,
                color: primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
              defaultPadding.sbh,
              const MyText(
                text:
                    "Rest assured, we'll inform you if\nthere are any issues with your\naccount.",
                fontSize: 14,
                color: textlightColor,
                fontWeight: FontWeight.w400,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Login',
                onPressed: () {
                  Get.offAll(() => const SigninView());
                },
              ),
              (defaultPadding * 2).sbh,
            ],
          ),
        ),
      ),
    );
  }
}
