import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:get/get.dart';
import 'package:pcom_app/app/modules/auth/views/signin_view.dart';
import '../../../../app/core/core.dart';
import '../../../../app/core/resources/app_images.dart';

import '../../../../common/widgets/my_text.dart';
import '../../../../common/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightMode = Theme.of(context).brightness == Brightness.light;

    final PageController introSliderController = PageController();
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
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const SigninView());
                    // SystemChrome.setSystemUIOverlayStyle(
                    //     SystemUiOverlayStyle.light.copyWith(
                    //   statusBarIconBrightness: Brightness.light,
                    //   statusBarColor: primaryColor,
                    // ));
                    // Get.offAllNamed(Routes.MAIN);
                  },
                  child: MyText(
                    text: LocaleKeys.skip.tr,
                    fontSize: 16,
                    color: R.theme.orange,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: introSliderController,
                  onPageChanged: (int page) {},
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage(R.image.img_intro),
                          fit: BoxFit.cover,
                        ),
                        (AppConfig.defaultPadding * 2).sbh,
                        MyText(
                          text: LocaleKeys.find_dream_job.tr,
                          height: 1.4,
                          fontSize: 24,
                          letterSpacing: 0.1,
                          // color: red,
                          fontWeight: FontWeight.w700,
                        ),
                        AppConfig.defaultPadding.sbh,
                        MyText(
                          text: LocaleKeys.create_profile_text.tr,
                          height: 1.4,
                          fontSize: 14,
                          letterSpacing: 0.3,
                          color: R.theme.textLightColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage(R.image.img_intro),
                          fit: BoxFit.cover,
                        ),
                        (AppConfig.defaultPadding * 2).sbh,
                        MyText(
                          text: LocaleKeys.find_dream_job.tr,
                          height: 1.4,
                          fontSize: 24,
                          letterSpacing: 0.1,
                          // color: red,
                          fontWeight: FontWeight.w700,
                        ),
                        AppConfig.defaultPadding.sbh,
                        MyText(
                          text: LocaleKeys.create_profile_text.tr,
                          height: 1.4,
                          fontSize: 14,
                          letterSpacing: 0.3,
                          color: R.theme.textLightColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppConfig.defaultPadding.sbh,
              SmoothPageIndicator(
                controller: introSliderController,
                count: 2,
                effect: ExpandingDotsEffect(
                  activeDotColor: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                  dotColor: R.theme.color200,
                  dotHeight: 6,
                  dotWidth: 6,
                  expansionFactor: 5,
                ),
              ),
              (AppConfig.defaultPadding * 2).sbh,
              PrimaryButton(
                smoothness: 0,
                color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                text: LocaleKeys.get_started.tr,
                onPressed: () {
                  Get.to(() => const SigninView());
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
