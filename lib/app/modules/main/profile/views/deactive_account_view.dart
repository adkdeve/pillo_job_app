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
import 'package:pillo/app/modules/main/profile/views/deactive_confirm_view.dart';
import 'package:pillo/app/modules/main/profile/views/privacy_policy_view.dart';
import 'package:pillo/app/modules/main/profile/views/resume_pro_card_view.dart';
import 'package:pillo/app/modules/main/profile/views/term_of_use_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/my_text_form_field.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class DeactiveAccountView extends GetView<ProfileController> {
  const DeactiveAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            // horizontal: defaultPadding * 1.5,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                ),
                child: Row(
                  children: [
                    MyBackBtn(),
                    Spacer(),
                    MyText(
                      text: 'Deactivate Account',
                      fontSize: 22,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                    Spacer(),
                    NotificationBtn()
                  ],
                ),
              ),
              25.sbh,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          img_deactive,
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
                      4.sbh,
                      Text.rich(
                        maxLines: 3,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Enter the word',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: textlightColor,
                              ),
                            ),
                            TextSpan(
                              text: ' CONFIRM ',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: green,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'in order to delete your Pillo account. This can’t be undone.',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: textlightColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      24.sbh,
                      MyTextFormField(
                        hinttxt: 'Enter here',
                        controller: TextEditingController(),
                      ),
                      const Spacer(),
                      PrimaryButton(
                        text: 'Confirm',
                        onPressed: () {
                          Get.to(() => const DeactiveConfirmView());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
