// ignore_for_file: library_private_types_in_public_api


import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/auth/views/choose_industry_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';
import '../controllers/auth_controller.dart';

class ChooseLocationView extends GetView<AuthController> {
  const ChooseLocationView({super.key});
  @override
  Widget build(BuildContext context) {
    var countryname = "".obs;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            horizontal: defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (defaultPadding * 1.5).sbh,
              const MyText(
                text: 'Choose your Country 📍',
                fontSize: 24,
                color: primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
              ),
              (defaultPadding / 1.5).sbh,
              const MyText(
                text:
                    "Please select the location(s) where you are seeking job opportunities. ",
                fontSize: 14,
                color: textlightColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.1,
              ),
              (defaultPadding * 1.5).sbh,
              Container(
                width: 1.sw,
                decoration: const ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    side: BorderSide(color: color200),
                  ),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: false,
                        showSearch: false,
                        countryListTheme: const CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(fontSize: 16, color: blackColor),
                          bottomSheetHeight: 500,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        onSelect: (Country country) {
                          countryname.value = country.name;
                          print('Select country: ${country.name}');
                        },
                      );
                    },
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Row(
                      children: [
                        SvgPicture.asset(ic_location),
                        (defaultPadding / 1.5).sbw,
                        Obx(
                          () => MyText(
                            text: countryname.value.isEmpty
                                ? 'Choose one'
                                : countryname.value,
                            color: countryname.value.isEmpty
                                ? color400
                                : primaryColor,
                            fontSize: 14,
                            fontWeight: countryname.value.isEmpty
                                ? FontWeight.w400
                                : FontWeight.w500,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                text: 'Continue',
                onPressed: () {
                  Get.to(() => const ChooseIndustryView());
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
