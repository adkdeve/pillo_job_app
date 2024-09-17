import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/views/signin_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});
  @override
  Widget build(BuildContext context) {
    final PageController introSliderController = PageController();
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
              const Align(
                alignment: Alignment.centerRight,
                child: MyText(
                  text: 'Skip',
                  fontSize: 16,
                  color: red,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
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
                        const Image(
                          image: AssetImage(img_intro),
                          fit: BoxFit.cover,
                        ),
                        (defaultPadding * 2).sbh,
                        const MyText(
                          text: 'Find your dream job\nright now',
                          height: 1.4,
                          fontSize: 24,
                          letterSpacing: 0.1,
                          // color: red,
                          fontWeight: FontWeight.w700,
                        ),
                        defaultPadding.sbh,
                        const MyText(
                          text:
                              'Create your profile now and gain visibility\nto the leading recruiters and companies\nin the Caribbean.',
                          height: 1.4,
                          fontSize: 14,
                          letterSpacing: 0.3,
                          color: textlightColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Image(
                          image: AssetImage(img_intro),
                          fit: BoxFit.cover,
                        ),
                        (defaultPadding * 2).sbh,
                        const MyText(
                          text: 'Find your dream job\nright now',
                          height: 1.4,
                          fontSize: 24,
                          letterSpacing: 0.1,
                          // color: red,
                          fontWeight: FontWeight.w700,
                        ),
                        defaultPadding.sbh,
                        const MyText(
                          text:
                              'Create your profile now and gain visibility\nto the leading recruiters and companies\nin the Caribbean.',
                          height: 1.4,
                          fontSize: 14,
                          letterSpacing: 0.3,
                          color: textlightColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              defaultPadding.sbh,
              SmoothPageIndicator(
                controller: introSliderController,
                count: 2,
                effect: const ExpandingDotsEffect(
                  activeDotColor: primaryColor,
                  dotColor: color200,
                  dotHeight: 6,
                  dotWidth: 6,
                  expansionFactor: 5,
                ),
              ),
              (defaultPadding * 2).sbh,
              PrimaryButton(
                smoothness: 0,
                text: 'Get Started',
                onPressed: () {
                  Get.to(() => const SigninView());
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
