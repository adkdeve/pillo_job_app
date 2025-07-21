import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pcom_app/app/core/core.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var isButtonEnabled = false.obs;

  // final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(_updateButtonState);
    passController.addListener(_updateButtonState);

  }

  void _updateButtonState() {

    if (passController.text != '' &&
        emailController.text != ''
        // && StringExtensions(emailController.text).isEmail
        // && passController.text.isValidPassword
    ) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }

  }



  // Future<void> signIn() async {
  //   try {
  //     // Call Firebase service to sign in
  //     var user = await _firebaseAuthService.firebaseSignIn(
  //       emailController.text,
  //       passController.text,
  //     );
  //
  //     if (user != null) {
  //       Get.offAllNamed(
  //         Routes.HOME,
  //       ); // Redirect to home page upon successful login
  //     } else {
  //       Get.snackbar('Error', 'Invalid credentials');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }
  //
  // Future<void> signUp() async {
  //   try {
  //     var user = await _firebaseAuthService.firebaseRegister(
  //       emailController.text,
  //       passController.text,
  //     );
  //
  //     if (user != null) {
  //       Get.offAllNamed(
  //         Routes.HOME,
  //       ); // Redirect to home page upon successful registration
  //     } else {
  //       Get.snackbar('Error', 'Failed to register');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    isButtonEnabled.value = false;
    super.dispose();
  }
}
