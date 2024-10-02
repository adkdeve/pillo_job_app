import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/job_details_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/modules/main/profile/views/privacy_policy_view.dart';
import 'package:pillo/app/modules/main/profile/views/resume_pro_card_view.dart';
import 'package:pillo/app/modules/main/profile/views/term_of_use_view.dart';
import 'package:pillo/app/routes/app_pages.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/my_text_form_field.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class DeactiveConfirmView extends GetView<ProfileController> {
  const DeactiveConfirmView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            horizontal: 24,
          ),
          child: Column(
            children: [
              const Spacer(),
              Center(
                child: Image.asset(
                  img_exit,
                  height: 160,
                  width: 190,
                ),
              ),
              25.sbh,
              const MyText(
                text: 'Sorry to see you go 😢',
                fontSize: 24,
                color: color900,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
              ),
              12.sbh,
              const MyText(
                text:
                    "Your Pillo account has been deactivated. If you change your mind in the future, you can reactivate your account at any time by logging in with your email address and password.",
                fontSize: 14,
                color: textlightColor,
                fontWeight: FontWeight.w400,
              ),
              const Spacer(
                flex: 2,
              ),
              PrimaryButton(
                text: 'Exit',
                onPressed: () {
                  Get.offAllNamed(Routes.AUTH);
                  // Get.to(() => const CodeVerifyView(), arguments: 'signin');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
