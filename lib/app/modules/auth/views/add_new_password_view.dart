// ignore_for_file: library_private_types_in_public_api


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/views/reset_password_confirm_view.dart';
import 'package:pillo/app/modules/auth/views/signin_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/my_text_form_field.dart';
import 'package:pillo/components/primary_button.dart';
import '../controllers/auth_controller.dart';

class AddNewPasswordView extends GetView<AuthController> {
  const AddNewPasswordView({super.key});
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyBackBtn(),
              (defaultPadding * 1.8).sbh,
              const MyText(
                text: 'Create new password 🔓 ',
                fontSize: 24,
                color: primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
              ),
              (defaultPadding / 1.5).sbh,
              const MyText(
                text: 'Please enter your new password ',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.3,
                color: color500,
              ),
              (defaultPadding * 1.5).sbh,
              MyTextFormField(
                hinttxt: 'Password',
                obscureTxt: true,
                controller: TextEditingController(),
                prefixIcon: ic_lock,
                suffixIcon: ic_eye_lock,
                onChange: (str) {},
              ),
              (defaultPadding).sbh,
              MyTextFormField(
                hinttxt: 'Confirm password',
                obscureTxt: true,
                controller: TextEditingController(),
                prefixIcon: ic_lock,
                suffixIcon: ic_eye_lock,
                onChange: (str) {},
              ),
              (defaultPadding * 1.3).sbh,
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: red,
                    size: 8,
                  ),
                  (defaultPadding / 2).sbw,
                  const MyText(
                    text: 'Minimum 8 characters',
                    fontSize: 12,
                    color: red,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              (defaultPadding / 2).sbh,
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: green,
                    size: 8,
                  ),
                  (defaultPadding / 2).sbw,
                  const MyText(
                    text: 'One uppercase and lowercase character',
                    fontSize: 12,
                    color: green,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              (defaultPadding / 2).sbh,
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: green,
                    size: 8,
                  ),
                  (defaultPadding / 2).sbw,
                  const MyText(
                    text: 'One number',
                    fontSize: 12,
                    color: green,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              (defaultPadding / 2).sbh,
              Row(
                children: [
                  const Icon(
                    Icons.trip_origin,
                    color: color400,
                    size: 8,
                  ),
                  (defaultPadding / 2).sbw,
                  const MyText(
                    text: 'One special character',
                    fontSize: 12,
                    color: color400,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Reset password',
                onPressed: () {
                  Get.to(() => const ResetPasswordConfirmView());
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
