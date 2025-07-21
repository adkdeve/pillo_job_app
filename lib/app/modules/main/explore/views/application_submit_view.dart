// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../app/core/resources/app_images.dart';

import 'package:get/get.dart';

import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../routes/app_pages.dart';
import '../../../../core/core.dart';
import '../controllers/explore_controller.dart';

class ApplicationSubmitView extends GetView<ExploreController> {
  const ApplicationSubmitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(R.image.img_submit_job, width: 197, height: 197),
              (AppConfig.defaultPadding * 2).sbh,
              MyText(
                text: LocaleKeys.job_application_sent.tr,
                fontSize: 22,
                // color: R.theme.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
              AppConfig.defaultPadding.sbh,
              MyText(
                text: LocaleKeys.job_application_success_message.tr,
                fontSize: 14,
                opacity: 0.3,
                fontWeight: FontWeight.w400,
              ),
              (AppConfig.defaultPadding * 2).sbh,
              // const Spacer(),
              PrimaryButton(
                text: LocaleKeys.back_to_home.tr,
                onPressed: () {
                  SystemChrome.setSystemUIOverlayStyle(
                    SystemUiOverlayStyle.light.copyWith(
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: R.theme.primary,
                    ),
                  );
                  Get.offAllNamed(Routes.MAIN);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
