import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/custom_chip.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/text_edit_field.dart';
import '../controllers/profile_controller.dart';
import 'my_view_alert_view.dart';

class AddMyViewAlertView extends GetView<ProfileController> {
  const AddMyViewAlertView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MyBackBtn(),
                  Spacer(),
                  MyText(
                    text: LocaleKeys.create_alerts.tr,
                    fontSize: 22,
                    // color: R.theme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn(),
                ],
              ),
              30.sbh,
              Wrap(
                // spacing: 16, // Space between chips horizontally
                runSpacing: 24, // Space between chips vertically
                children: [
                  CustomChip(label: LocaleKeys.full_time.tr),
                  CustomChip(label: LocaleKeys.remote.tr),
                  CustomChip(label: "Linstead Jamaica"),
                  CustomChip(label: LocaleKeys.industry_sales_marketing.tr),
                  CustomChip(label: LocaleKeys.contract.tr),
                ],
              ),
              30.sbh,
              // const MyText(
              //   text: 'Alert Name',
              //   fontSize: 16,
              //   fontWeight: FontWeight.w600,
              // ),
              // AppConfig.defaultPadding.sbh,
              // MyTextFormField(
              //   controller: TextEditingController(),
              //   hinttxt: 'Enter alert name',
              // ),
              // 8.sbh,

              // AppConfig.defaultPadding.sbh,
              Textedit2(
                title: LocaleKeys.alert_name.tr,
                titleFontSize: 16,
                titleTextColor: R.theme.color900,
                textFontSize: 14,
                hintText: LocaleKeys.enter_alert_name.tr,
              ),
              8.sbh,
              Textedit2(
                title: LocaleKeys.alert_frequency.tr,
                icon: R.image.ic_arrow_down,
                titleFontSize: 16,
                titleTextColor: R.theme.color900,
                textFontSize: 14,
                text: LocaleKeys.choose_frequency.tr,
              ),
              const Spacer(),
              PrimaryButton(
                text: LocaleKeys.save_alert.tr,
                onPressed: () {
                  // Get.bottomSheet(
                  //   Container(
                  //     width: 1.sw,
                  //     padding: const EdgeInsets.all(26),
                  //     margin: const EdgeInsets.symmetric(
                  //       horizontal: 10,
                  //       vertical: 8,
                  //     ),
                  //     decoration: const BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.all(Radius.circular(40)),
                  //     ),
                  //     child: Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         SvgPicture.asset(
                  //           ic_alert,
                  //           width: 75,
                  //           height: 77,
                  //         ),
                  //         16.sbh,
                  //         const MyText(
                  //           text: 'Are you sure?',
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w700,
                  //           color: blackColor,
                  //         ),
                  //         16.sbh,
                  //         MyText(
                  //           text:
                  //               'Please confirm you would like to\ndelete this alert',
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w400,
                  //           color: blackColor.withOpacity(.8),
                  //         ),
                  //         25.sbh,
                  //         PrimaryButton(
                  //           text: 'Confirm',
                  //           color: green,
                  //           borderRadius: 20,
                  //           onPressed: () {
                  //             Get.back();
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   backgroundColor: Colors.transparent,
                  //   isScrollControlled: true,
                  // );
                },
              ),
              // 10.sbh
              Center(
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: MyText(
                      text: LocaleKeys.close.tr,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      opacity: 0.3,
                      // color: R.theme.color500,
                    ),
                  ),
                ),
              ),
              24.sbh,
            ],
          ),
        ),
      ),
    );
  }
}
