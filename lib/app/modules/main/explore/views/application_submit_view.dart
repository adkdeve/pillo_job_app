// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/views/signin_view.dart';
import 'package:pillo/app/modules/main/explore/controllers/explore_controller.dart';
import 'package:pillo/app/routes/app_pages.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';

class ApplicationSubmitView extends GetView<ExploreController> {
  const ApplicationSubmitView({super.key});
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
                img_submit_job,
                width: 197,
                height: 197,
              ),
              (defaultPadding * 2).sbh,
              const MyText(
                text: 'Job Application Sent',
                fontSize: 22,
                color: primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
              defaultPadding.sbh,
              const MyText(
                text:
                    "Your job application was\nsuccessfully sent. Good Luck!!",
                fontSize: 14,
                color: textlightColor,
                fontWeight: FontWeight.w400,
              ),
              (defaultPadding * 2).sbh,

              // const Spacer(),
              PrimaryButton(
                text: 'Back to Home',
                onPressed: () {
                  SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.light.copyWith(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: primaryColor,
                  ));
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
