import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var isButtonEnabled = false.obs;
  @override
  void onInit() {
    super.onInit();

    emailController.addListener(_updateButtonState);
    passController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    if (passController.text != '' &&
        emailController.text != '' &&
        emailController.text.isEmail) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    isButtonEnabled.value = false;
    super.dispose();
  }
}
