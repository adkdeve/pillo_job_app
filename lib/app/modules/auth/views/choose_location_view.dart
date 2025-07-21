// ignore_for_file: library_private_types_in_public_api

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import '../../../../app/core/core.dart';
import '../../../../app/core/resources/app_images.dart';

import '../../../../common/widgets/my_text.dart';
import '../../../../common/widgets/primary_button.dart';
import '../../../../common/widgets/smooth_rectangle_border.dart';
import '../controllers/auth_controller.dart';
import 'choose_industry_view.dart';

class ChooseLocationView extends GetView<AuthController> {
  const ChooseLocationView({super.key});
  @override
  Widget build(BuildContext context) {
    var countryname = "".obs;
    final lightMode = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (AppConfig.defaultPadding * 1.5).sbh,
              MyText(
                text: LocaleKeys.choose_your_country.tr,
                fontSize: 24,
                color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
              ),
              (AppConfig.defaultPadding / 1.5).sbh,
              MyText(
                text: LocaleKeys.select_location_text.tr,
                fontSize: 14,
                color: R.theme.textLightColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.1,
              ),
              (AppConfig.defaultPadding * 1.5).sbh,
              Container(
                width: 1.sw,
                decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    side: BorderSide(color: R.theme.color200),
                  ),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: false,
                      showSearch: false,
                      countryListTheme: CountryListThemeData(
                        flagSize: 25,
                        backgroundColor: lightMode ? R.theme.color200 : R.theme.color600,
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
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
                    padding: const EdgeInsets.all(AppConfig.defaultPadding),
                    child: Row(
                      children: [
                        SvgPicture.asset(R.image.ic_location),
                        (AppConfig.defaultPadding / 1.5).sbw,
                        Obx(
                          () => MyText(
                            text: countryname.value.isEmpty
                                ? LocaleKeys.choose_one.tr
                                : countryname.value,
                            color: countryname.value.isEmpty
                                ? R.theme.color400
                                : lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
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
                color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                text: LocaleKeys.t_continue.tr,
                onPressed: () {
                  Get.to(() => const ChooseIndustryView());
                },
              ),
              (AppConfig.defaultPadding * 2).sbh,
            ],
          ),
        ),
      ),
    );
  }
}
