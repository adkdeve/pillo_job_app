// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/add_new_password_view.dart';
import 'package:pillo/app/modules/auth/views/choose_location_view.dart';
import 'package:pillo/app/modules/auth/views/signin_view.dart';
import 'package:pillo/app/routes/app_pages.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pinput/pinput.dart';
import '../controllers/auth_controller.dart';

class CodeVerifyView extends GetView<AuthController> {
  const CodeVerifyView({super.key});
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyBackBtn(),
              (defaultPadding * 1.8).sbh,
              const MyText(
                text: 'Verify it’s you 🔓 ',
                fontSize: 24,
                color: primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
              ),
              (defaultPadding / 1.5).sbh,
              Text.rich(
                maxLines: 2,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'We send a code to (',
                      style: GoogleFonts.inter().copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 0.3,
                        color: color500,
                      ),
                    ),
                    TextSpan(
                      text: ' *****@pillo.com ',
                      style: GoogleFonts.inter().copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 0.3,
                        color: red,
                      ),
                    ),
                    TextSpan(
                      text: ').\nEnter it here to verify your identity',
                      style: GoogleFonts.inter().copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 0.3,
                        color: color500,
                      ),
                    ),
                  ],
                ),
              ),
              (defaultPadding * 2).sbh,
              Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                submittedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                    fontSize: 24,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: color50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xffE5E7EB),
                      width: 1.5,
                    ),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: color50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: green,
                      width: 1.5,
                    ),
                  ),
                ),
                pinAnimationType: PinAnimationType.scale,
                length: 5,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: color50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xffE5E7EB),
                      width: 1.5,
                    ),
                  ),
                ),
                onCompleted: (String verificationCode) {},
                onChanged: (code) {
                  // debugPrint('onChanged: $value');
                },
                // cursor: const Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Container(
                //       margin: EdgeInsets.only(bottom: 9),
                //       width: 22,
                //       height: 1,
                //       color: Colors.red,
                //     ),
                //   ],
                // ),
              ),
              (defaultPadding * 2).sbh,
              const ResendCodeWidget(),
              const Spacer(),
              PrimaryButton(
                text: 'Confirm',
                onPressed: () {
                  String type = Get.arguments ?? '';
                  if (type == 'reset') {
                    Get.to(() => const AddNewPasswordView());
                  } else if (type == 'signin') {
                    SystemChrome.setSystemUIOverlayStyle(
                        SystemUiOverlayStyle.light.copyWith(
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: primaryColor,
                    ));
                    Get.toNamed(Routes.MAIN);
                  } else if (type == 'signup') {
                    Get.to(() => const ChooseLocationView());
                  }
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

class ResendCodeWidget extends StatefulWidget {
  const ResendCodeWidget({super.key});

  @override
  _ResendCodeWidgetState createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  int _seconds = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer(); // Start the countdown when the widget is initialized
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  // Function to start the timer and update the countdown
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--; // Decrement seconds every second
        } else {
          _timer?.cancel(); // Stop the timer at 0
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText(
        text: _seconds > 0 ? 'Resend Code $_seconds s' : 'Resend Code',
        fontSize: 16,
        color: green,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
