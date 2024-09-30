// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/views/signin_view.dart';
import 'package:pillo/app/modules/main/explore/controllers/explore_controller.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';

class ReviewSubmitView extends GetView<ExploreController> {
  const ReviewSubmitView({super.key});
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img_submit_review,
                width: 197,
                height: 197,
              ),
              (defaultPadding * 2).sbh,
              const MyText(
                text: 'Review Submitted',
                fontSize: 22,
                color: primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
              defaultPadding.sbh,
              const MyText(
                text:
                    "Your review has been successfully submitted. Once it’s approved, it will be published. Thank you for your feedback!",
                fontSize: 14,
                color: textlightColor,
                fontWeight: FontWeight.w400,
              ),
              (defaultPadding * 2).sbh,

              // const Spacer(),
              PrimaryButton(
                text: 'Back to Company',
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
