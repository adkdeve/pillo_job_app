// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import '../../../../app/core/core.dart';

import '../../../../common/widgets/my_back_btn.dart';
import '../../../../common/widgets/my_text.dart';
import '../../../../common/widgets/primary_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/auth_controller.dart';

class ChooseIndustryView extends GetView<AuthController> {
  const ChooseIndustryView({super.key});
  @override
  Widget build(BuildContext context) {
    final lightMode = Theme.of(context).brightness == Brightness.light;
    final RxList<Map<String, dynamic>> items = [
      {'label': LocaleKeys.industry_creative_design.tr, 'value': true},
      {'label': LocaleKeys.industry_computer_technology.tr, 'value': false},
      {'label': LocaleKeys.industry_sales_marketing.tr, 'value': false},
      {'label': LocaleKeys.industry_compliance_finance.tr, 'value': false},
      {'label': LocaleKeys.industry_health_care.tr, 'value': false},
      {'label': LocaleKeys.industry_tourism_hospitality.tr, 'value': false},
      {'label': LocaleKeys.industry_education.tr, 'value': false},
      {'label': LocaleKeys.industry_transportation.tr, 'value': false},
      {'label': LocaleKeys.industry_support_management.tr, 'value': false},
      {'label': LocaleKeys.industry_human_resources.tr, 'value': false},
      {'label': LocaleKeys.industry_government.tr, 'value': false},
      {'label': LocaleKeys.industry_legal.tr, 'value': false},
      {'label': LocaleKeys.industry_warehouse_operations.tr, 'value': false},
      {'label': LocaleKeys.industry_beauty_wellness.tr, 'value': false},
    ].obs;
    var isAnyItemSelected = true.obs;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyBackBtn(),
              (AppConfig.defaultPadding * 1.8).sbh,
              MyText(
                text: LocaleKeys.what_industry_interested.tr,
                textAlign: TextAlign.left,
                fontSize: 24,
                color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
              ),
              (AppConfig.defaultPadding / 1.5).sbh,
              MyText(
                text: LocaleKeys.select_industry_text.tr,
                textAlign: TextAlign.left,
                fontSize: 14,
                color: R.theme.textLightColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.1,
              ),
              (AppConfig.defaultPadding * 1.5).sbh,
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        side: BorderSide(width: 1, color: R.theme.color300),
                        contentPadding: const EdgeInsets.all(0),
                        fillColor: WidgetStateProperty.resolveWith((states) {
                          if (states.contains(WidgetState.selected)) {
                            return R.theme.green;
                          } else {
                            return Colors.transparent;
                          }
                        }),
                        controlAffinity: ListTileControlAffinity.leading,
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -2,
                        ),
                        title: MyText(
                          text: items[index]['label'],
                          fontSize: 16,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4,
                        ),
                        value: items[index]['value'],
                        onChanged: (bool? newValue) {
                          items[index]['value'] = newValue!;

                          isAnyItemSelected.value = items.any(
                            (item) => item['value'] == true,
                          );

                          items.refresh();
                        },
                      );
                    },
                  ),
                ),
              ),
              (AppConfig.defaultPadding * 2).sbh,
              Obx(
                () => PrimaryButton(
                  color: lightMode ? R.theme.light.primaryColor : R.theme.dark.primaryColor,
                  text: LocaleKeys.t_continue.tr,
                  disabled: !isAnyItemSelected.value,
                  onPressed: () {
                    SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.light.copyWith(
                        statusBarIconBrightness: Brightness.light,
                        statusBarColor: R.theme.primary,
                      ),
                    );
                    Get.toNamed(Routes.MAIN);
                  },
                ),
              ),
              (AppConfig.defaultPadding * 2).sbh,
            ],
          ),
        ),
      ),
    );
  }
}
