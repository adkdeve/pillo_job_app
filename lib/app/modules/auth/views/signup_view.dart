import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/views/code_verify_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/my_text_form_field.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';
import '../controllers/auth_controller.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    var passText = ''.obs;
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
                  text: 'Join us! 👩🏽‍💻',
                  fontSize: 24,
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1,
                ),
                (defaultPadding / 2).sbh,
                const MyText(
                  text: 'Create an account to start your job search.',
                  fontSize: 16,
                  color: color500,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                (defaultPadding * 2).sbh,
                MyTextFormField(
                  hinttxt: 'First name',
                  controller: TextEditingController(),
                  prefixIcon: ic_person,
                ),
                (defaultPadding).sbh,
                MyTextFormField(
                  hinttxt: 'Last name',
                  controller: TextEditingController(),
                  prefixIcon: ic_person,
                ),
                (defaultPadding).sbh,
                MyTextFormField(
                  hinttxt: 'Email',
                  controller: TextEditingController(),
                  prefixIcon: ic_mail,
                ),
                (defaultPadding).sbh,
                MyTextFormField(
                  hinttxt: 'Password',
                  obscureTxt: true,
                  controller: TextEditingController(),
                  prefixIcon: ic_lock,
                  suffixIcon: ic_eye_lock,
                  onChange: (str) {
                    passText.value = str;
                  },
                ),
                Obx(
                  () => Visibility(
                    visible: passText.value.isNotEmpty,
                    child: Column(
                      children: [
                        (defaultPadding / 1.3).sbh,
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: passText.value.length < 8 ? red : green,
                              size: 8,
                            ),
                            (defaultPadding / 2).sbw,
                            MyText(
                              text: 'Minimum 8 characters',
                              fontSize: 12,
                              color: passText.value.length < 8 ? red : green,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        (defaultPadding / 2).sbh,
                        Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: green,
                              size: 8,
                            ),
                            (defaultPadding / 2).sbw,
                            const MyText(
                              text: 'One uppercase and lowercase character',
                              fontSize: 12,
                              color: green,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        (defaultPadding / 2).sbh,
                        Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: green,
                              size: 8,
                            ),
                            (defaultPadding / 2).sbw,
                            const MyText(
                              text: 'One number',
                              fontSize: 12,
                              color: green,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        (defaultPadding / 2).sbh,
                        Row(
                          children: [
                            const Icon(
                              Icons.trip_origin,
                              color: color400,
                              size: 8,
                            ),
                            (defaultPadding / 2).sbw,
                            const MyText(
                              text: 'One special character',
                              fontSize: 12,
                              color: color400,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                (defaultPadding * 1.5).sbh,
                PrimaryButton(
                  smoothness: 0,
                  // disabled: controller.isButtonEnabled.value,
                  text: 'Sign Up',
                  onPressed: () {
                    Get.to(() => const CodeVerifyView(), arguments: 'signup');
                  },
                ),
                (defaultPadding * 1.5).sbh,
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
                (defaultPadding / 1.5).sbh,
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
                (defaultPadding).sbh,
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
                (defaultPadding).sbh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MyText(
                      text: 'Already have an account? ',
                      fontSize: 16,
                      color: color500,
                      fontWeight: FontWeight.w400,
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const MyText(
                        text: 'Sign In',
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
    this.icon = ic_arrow_bck,
    this.light = false,
  });
  final VoidCallback? onTap;
  final bool light;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: SmoothRectangleBorder(
          smoothness: 1,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          side: BorderSide(color: light ? whiteColor : color200),
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
            icon,

            color: light ? whiteColor : null,
            // color: light? whiteColor:nul,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
