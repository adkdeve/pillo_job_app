import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/my_text_form_field.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../controllers/profile_controller.dart';
import 'deactive_confirm_view.dart';

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
            vertical: AppConfig.defaultPadding,
            // horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConfig.defaultPadding * 1.5,
                ),
                child: Row(
                  children: [
                    MyBackBtn(),
                    Spacer(),
                    MyText(
                      text: LocaleKeys.deactivateAccount.tr,
                      fontSize: 22,
                      // color: R.theme.primary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                    Spacer(),
                    NotificationBtn(),
                  ],
                ),
              ),
              25.sbh,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          R.image.img_deactive,
                          height: 160,
                          width: 190,
                        ),
                      ),
                      25.sbh,
                      MyText(
                        text: LocaleKeys.sorry_to_see_you_go.tr,
                        fontSize: 24,
                        color: R.theme.color900,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                      4.sbh,
                      Text.rich(
                        maxLines: 3,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: LocaleKeys.enter_the_word.tr,
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: R.theme.color500,
                              ),
                            ),
                            TextSpan(
                              text: ' ${LocaleKeys.confirm_caps.tr} ',
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: R.theme.green,
                              ),
                            ),
                            TextSpan(
                              text: LocaleKeys.confirm_instruction.tr,
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                color: R.theme.color500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      24.sbh,
                      MyTextFormField(
                        hinttxt: LocaleKeys.enter_here.tr,
                        controller: TextEditingController(),
                      ),
                      const Spacer(),
                      PrimaryButton(
                        text: LocaleKeys.confirm.tr,
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
