// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/controllers/auth_controller.dart';
import 'package:pillo/app/modules/auth/views/signin_view.dart';
import 'package:pillo/app/routes/app_pages.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';

class ChooseIndustryView extends GetView<AuthController> {
  const ChooseIndustryView({super.key});
  @override
  Widget build(BuildContext context) {
    final RxList<Map<String, dynamic>> items = [
      {'label': 'Creative & Design', 'value': true},
      {'label': 'Computer & Technology', 'value': false},
      {'label': 'Sales & Marketing', 'value': false},
      {'label': 'Compliance & Finance', 'value': false},
      {'label': 'Health Care', 'value': false},
      {'label': 'Tourism & Hospitality', 'value': false},
      {'label': 'Education', 'value': false},
      {'label': 'Transportation', 'value': false},
      {'label': 'Support & Management', 'value': false},
      {'label': 'Human Resources', 'value': false},
      {'label': 'Government', 'value': false},
      {'label': 'Legal', 'value': false},
      {'label': 'Warehouse & Operations', 'value': false},
      {'label': 'Beauty & Wellness', 'value': false},
    ].obs;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                text: 'What industry are you interested in? 👩🏽‍💻 ',
                textAlign: TextAlign.left,
                fontSize: 24,
                color: primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
              ),
              (defaultPadding / 1.5).sbh,
              const MyText(
                text:
                    "Please select the industry(s) you are interested in finding job opportunities within. ",
                textAlign: TextAlign.left,
                fontSize: 14,
                color: textlightColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.1,
              ),
              (defaultPadding * 1.5).sbh,
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        side: const BorderSide(width: 1, color: color300),
                        contentPadding: const EdgeInsets.all(0),
                        controlAffinity: ListTileControlAffinity.leading,
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -2,
                        ),
                        title: MyText(
                          text: items[index]['label'],
                          fontSize: 16,
                          color: blackColor,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4,
                        ),
                        value: items[index]['value'],
                        onChanged: (bool? newValue) {
                          items[index]['value'] = newValue!;
                          items.refresh();
                        },
                      );
                    },
                  ),
                ),
              ),
              (defaultPadding * 2).sbh,
              PrimaryButton(
                text: 'Continue',
                onPressed: () {
                  SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.light.copyWith(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: primaryColor,
                  ));
                  Get.toNamed(Routes.MAIN);
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
