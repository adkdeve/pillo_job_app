// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../app/core/resources/app_images.dart';

import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../controllers/explore_controller.dart';

class ReviewSubmitView extends GetView<ExploreController> {
  const ReviewSubmitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(R.image.img_submit_review, width: 197, height: 197),
              (AppConfig.defaultPadding * 2).sbh,
              MyText(
                text: LocaleKeys.review_submitted.tr,
                fontSize: 22,
                color: R.theme.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
              AppConfig.defaultPadding.sbh,
              MyText(
                text: LocaleKeys.review_message.tr,
                fontSize: 14,
                color: R.theme.textLightColor,
                fontWeight: FontWeight.w400,
              ),
              (AppConfig.defaultPadding * 2).sbh,
              // const Spacer(),
              PrimaryButton(
                text: LocaleKeys.back_to_company.tr,
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
