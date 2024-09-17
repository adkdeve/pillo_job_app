import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var isButtonEnabled = true.obs;
  @override
  void onInit() {
    super.onInit();

    // emailController.addListener(_updateButtonState);
    passController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    isButtonEnabled.value =
        (passController.text.isEmpty && emailController.text.isEmpty)
            ? true
            : false;
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    isButtonEnabled.value = true;
    super.dispose();
  }
}
