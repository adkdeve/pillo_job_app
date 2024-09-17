// ignore_for_file: library_private_types_in_public_api


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/views/code_verify_view.dart';
import 'package:pillo/app/modules/auth/views/signin_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/my_text_form_field.dart';
import 'package:pillo/components/primary_button.dart';
import '../controllers/auth_controller.dart';

class ResetPasswordView extends GetView<AuthController> {
  const ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            horizontal: defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                children: [
                  MyBackBtn(),
                  Spacer(),
                  MyText(
                    text: 'Reset Password 🔓 ',
                    fontSize: 24,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                ],
              ),
              (defaultPadding * 2).sbh,
              Image.asset(
                img_reset,
                height: 170,
              ),
              (defaultPadding * 2).sbh,
              const MyText(
                text:
                    "Enter the email associated with your Pillo account and we will send you confirmation code",
                fontSize: 14,
                color: textlightColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.1,
              ),
              (defaultPadding * 1.5).sbh,
              MyTextFormField(
                hinttxt: 'Email',
                controller: TextEditingController(),
                prefixIcon: ic_mail,
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Send code',
                onPressed: () {
                  Get.to(() => const CodeVerifyView(), arguments: 'reset');
                },
              ),
              (defaultPadding * 1.5).sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MyText(
                    text: 'Already have an account? ',
                    fontSize: 16,
                    color: color500,
                    fontWeight: FontWeight.w400,
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const MyText(
                      text: 'Sign In',
                      fontSize: 16,
                      color: green,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              (defaultPadding * 2).sbh,
            ],
          ),
        ),
      ),
    );
  }
}
