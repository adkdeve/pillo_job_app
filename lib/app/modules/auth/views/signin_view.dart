import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pcom_app/app/modules/auth/views/reset_password_view.dart';
import 'package:pcom_app/app/modules/auth/views/signup_view.dart';
import '../../../../app/core/core.dart';

import '../../../../common/widgets/my_back_btn.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../../common/widgets/my_text_form_field.dart';
import '../../../../common/widgets/other_login.dart';
import '../../../../common/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';
import 'code_verify_view.dart';

class SigninView extends GetView<AuthController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    var checkbox = false.obs;
    Get.put(AuthController());
    final lightMode = Theme.of(context).brightness == Brightness.light;

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
                  text: LocaleKeys.welcome_back.tr,
                  fontSize: 24,
                  color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1,
                ),
                (AppConfig.defaultPadding / 2).sbh,
                MyText(
                  text: LocaleKeys.signin_message.tr,
                  fontSize: 16,
                  color: R.theme.color500,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                (AppConfig.defaultPadding * 2).sbh,
                MyTextFormField(
                  hinttxt: LocaleKeys.email.tr,
                  controller: controller.emailController,
                  prefixIcon: R.image.ic_mail,
                  keyboardType: TextInputType.emailAddress,

                ),
                (AppConfig.defaultPadding).sbh,
                MyTextFormField(
                  hinttxt: LocaleKeys.password.tr,
                  obscureTxt: true,
                  controller: controller.passController,
                  prefixIcon: R.image.ic_lock,
                  suffixIcon: R.image.ic_eye_lock,
                ),
                (AppConfig.defaultPadding).sbh,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Checkbox(
                        side: BorderSide(width: 1, color: R.theme.color300),
                        value: checkbox.value,
                        fillColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return R.theme.green;
                          } else {
                            return Colors.transparent;
                          }
                        }),
                        onChanged: (val) {
                          checkbox.value = !checkbox.value;
                        },
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                      ),
                    ),
                    MyText(
                      text: LocaleKeys.remember_me.tr,
                      fontSize: 16,
                      color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ResetPasswordView());
                      },
                      child: MyText(
                        text: LocaleKeys.forgot_password.tr,
                        fontSize: 16,
                        color: R.theme.green,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                (AppConfig.defaultPadding * 1.5).sbh,
                Obx(
                  () => PrimaryButton(
                    color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                    smoothness: 0,
                    disabled: !controller.isButtonEnabled.value,
                    text: LocaleKeys.sign_in.tr,
                    onPressed: () {
                      Get.to(() => const CodeVerifyView(), arguments: 'signin');
                    },
                  ),
                ),
                (AppConfig.defaultPadding * 2).sbh,
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
                (AppConfig.defaultPadding * 1.5).sbh,
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
                (AppConfig.defaultPadding * 2).sbh,
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
                      color: R.theme.orange,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                  ],
                ),
                (AppConfig.defaultPadding * 3).sbh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: LocaleKeys.dont_have_an_account.tr,
                      fontSize: 16,
                      color: R.theme.color500,
                      fontWeight: FontWeight.w400,
                    ),
                    6.sbw,
                    GestureDetector(
                      onTap: () => Get.to(() => const SignupView()),
                      child: MyText(
                        text: LocaleKeys.sign_up.tr,
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
