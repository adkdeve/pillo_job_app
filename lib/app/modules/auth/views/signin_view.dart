import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/views/code_verify_view.dart';
import 'package:pillo/app/modules/auth/views/reset_password_view.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/my_text_form_field.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';
import '../controllers/auth_controller.dart';

class SigninView extends GetView<AuthController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    var checkbox = false.obs;
    Get.put(AuthController());

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: defaultPadding,
              horizontal: defaultPadding * 1.5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyBackBtn(),
                (defaultPadding * 1.8).sbh,
                const MyText(
                  text: 'Welcome back! 👋🏽',
                  fontSize: 24,
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1,
                ),
                (defaultPadding / 2).sbh,
                const MyText(
                  text: 'Sign in and continue your job search.',
                  fontSize: 16,
                  color: color500,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                (defaultPadding * 2).sbh,
                MyTextFormField(
                  hinttxt: 'Email',
                  controller: controller.emailController,
                  prefixIcon: ic_mail,
                  keyboardType: TextInputType.emailAddress,
                ),
                (defaultPadding).sbh,
                MyTextFormField(
                  hinttxt: 'Password',
                  obscureTxt: true,
                  controller: controller.passController,
                  prefixIcon: ic_lock,
                  suffixIcon: ic_eye_lock,
                ),
                (defaultPadding).sbh,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Checkbox(
                        side: const BorderSide(width: 1, color: color300),
                        value: checkbox.value,
                        fillColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return green;
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
                    const MyText(
                      text: 'Remember me',
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ResetPasswordView());
                      },
                      child: const MyText(
                        text: 'Forgot Password?',
                        fontSize: 16,
                        color: green,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                (defaultPadding * 1.5).sbh,
                Obx(
                  () => PrimaryButton(
                    smoothness: 0,
                    disabled: !controller.isButtonEnabled.value,
                    text: 'Sign In',
                    onPressed: () {
                      Get.to(() => const CodeVerifyView(), arguments: 'signin');
                    },
                  ),
                ),
                (defaultPadding * 2).sbh,
                Row(
                  children: [
                    SvgPicture.asset(ic_divider),
                    const Spacer(),
                    const MyText(
                      text: 'OR',
                      fontSize: 14,
                      color: color500,
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
                (defaultPadding * 1.5).sbh,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          border: Border.all(color: color200),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding,
                            ),
                            child: SvgPicture.asset(
                              ic_google,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    defaultPadding.sbw,
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          border: Border.all(color: color200),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding,
                            ),
                            child: SvgPicture.asset(
                              ic_apple,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                (defaultPadding * 2).sbh,
                const Center(
                  child: MyText(
                    text: 'By using our mobile app, you agree to our',
                    fontSize: 15,
                    color: color500,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: 'Terms of Use',
                      fontSize: 15,
                      color: red,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                    MyText(
                      text: ' and ',
                      fontSize: 15,
                      color: color500,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                    ),
                    MyText(
                      text: 'Privacy Policy',
                      fontSize: 15,
                      color: red,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                  ],
                ),
                (defaultPadding * 3).sbh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MyText(
                      text: 'Don’t have an account? ',
                      fontSize: 16,
                      color: color500,
                      fontWeight: FontWeight.w400,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => const SignupView()),
                      child: const MyText(
                        text: 'Sign Up',
                        fontSize: 16,
                        color: green,
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

class MyBackBtn extends StatelessWidget {
  const MyBackBtn({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: SmoothRectangleBorder(
          smoothness: 1,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          side: BorderSide(color: color200),
        ),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        onTap: onTap ??
            () {
              Get.back();
            },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            ic_arrow_bck,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
