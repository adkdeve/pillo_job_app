import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import '../../../../common/widgets/my_back_btn.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../../common/widgets/my_text_form_field.dart';
import '../../../../common/widgets/other_login.dart';
import '../../../../common/widgets/password_description_row.dart';
import '../../../../common/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';
import '../../../core/core.dart';
import 'code_verify_view.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightMode = Theme.of(context).brightness == Brightness.light;

    var passText = ''.obs;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConfig.defaultPadding,
              horizontal: AppConfig.defaultPadding * 1.5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyBackBtn(),
                (AppConfig.defaultPadding * 1.8).sbh,
                MyText(
                  text: LocaleKeys.join_us.tr,
                  fontSize: 24,
                  color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1,
                ),
                (AppConfig.defaultPadding / 2).sbh,
                MyText(
                  text: LocaleKeys.create_account_message.tr,
                  fontSize: 16,
                  color: R.theme.color500,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                (AppConfig.defaultPadding * 2).sbh,
                MyTextFormField(
                  hinttxt: LocaleKeys.first_name.tr,
                  controller: TextEditingController(),
                  prefixIcon: R.image.ic_person,
                ),
                (AppConfig.defaultPadding).sbh,
                MyTextFormField(
                  hinttxt: LocaleKeys.last_name.tr,
                  controller: TextEditingController(),
                  prefixIcon: R.image.ic_person,
                ),
                (AppConfig.defaultPadding).sbh,
                MyTextFormField(
                  hinttxt: LocaleKeys.email.tr,
                  controller: controller.emailController,
                  prefixIcon: R.image.ic_mail,
                ),
                (AppConfig.defaultPadding).sbh,
                MyTextFormField(
                  hinttxt: LocaleKeys.password.tr,
                  obscureTxt: true,
                  controller: controller.passController,
                  prefixIcon: R.image.ic_lock,
                  suffixIcon: R.image.ic_eye_lock,
                  onChange: (str) {
                    passText.value = str;
                  },
                ),
                Obx(
                  () => Visibility(
                    visible: passText.value.isNotEmpty,
                    child: Column(
                      children: [
                        (AppConfig.defaultPadding / 1.3).sbh,
                        passwordDescription(
                          iconData: Icons.circle,
                          iconColor: R.theme.red,
                          text: LocaleKeys.min_8_characters.tr,
                          iconSize: 8,
                          textColor: R.theme.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        (AppConfig.defaultPadding / 2).sbh,
                        passwordDescription(
                          iconData: Icons.circle,
                          iconColor: R.theme.green,
                          text: LocaleKeys.uppercase_lowercase_characters.tr,
                          iconSize: 8,
                          textColor: R.theme.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        (AppConfig.defaultPadding / 2).sbh,
                        passwordDescription(
                          iconData: Icons.circle,
                          iconColor: R.theme.green,
                          text: LocaleKeys.one_number.tr,
                          iconSize: 8,
                          textColor: R.theme.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        (AppConfig.defaultPadding / 2).sbh,
                        passwordDescription(
                          iconData: Icons.trip_origin,
                          iconColor: R.theme.color400,
                          text: LocaleKeys.special_character.tr,
                          iconSize: 8,
                          textColor: R.theme.color400,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
                (AppConfig.defaultPadding * 1.5).sbh,
                Obx(
                      () => PrimaryButton(
                        color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                    smoothness: 0,
                    disabled: !controller.isButtonEnabled.value,
                        text: LocaleKeys.sign_up.tr,
                    onPressed: () {
                      Get.to(() => const CodeVerifyView(), arguments: 'signup');
                    },
                  ),
                ),
                (AppConfig.defaultPadding * 1.5).sbh,
                Row(
                  children: [
                    SvgPicture.asset(R.image.ic_divider),
                    const Spacer(),
                    MyText(
                      text: LocaleKeys.or.tr,
                      fontSize: 14,
                      color: R.theme.color500,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.3,
                    ),
                    const Spacer(),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..scale(-1.0, 1.0),
                      child: SvgPicture.asset('assets/icons/ic_divider.svg'),
                    ),
                  ],
                ),
                (AppConfig.defaultPadding / 1.5).sbh,
                Row(
                  children: [
                    OtherLogin(
                      iconPath: R.image.ic_google,
                      onTap: () {},
                    ),
                    AppConfig.defaultPadding.sbw,
                    OtherLogin(
                      iconPath: R.image.ic_apple,
                      onTap: () {},
                    ),
                  ],
                ),
                (AppConfig.defaultPadding).sbh,
                Center(
                  child: MyText(
                    text: LocaleKeys.by_using_app.tr,
                    fontSize: 15,
                    color: R.theme.color500,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: LocaleKeys.terms_of_use.tr,
                      fontSize: 15,
                      color: R.theme.orange,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                    6.sbw,
                    MyText(
                      text: LocaleKeys.and.tr,
                      fontSize: 15,
                      color: R.theme.color500,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                    ),
                    6.sbw,
                    MyText(
                      text: LocaleKeys.privacy_policy.tr,
                      fontSize: 15,
                      color: R.theme.red,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                  ],
                ),
                (AppConfig.defaultPadding).sbh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: LocaleKeys.already_have_an_account.tr,
                      fontSize: 16,
                      color: R.theme.color500,
                      fontWeight: FontWeight.w400,
                    ),
                    6.sbw,
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: MyText(
                        text: LocaleKeys.sign_in.tr,
                        fontSize: 16,
                        color: R.theme.green,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
