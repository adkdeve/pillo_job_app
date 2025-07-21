import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../controllers/profile_controller.dart';

class MyOrderReceiptView extends GetView<ProfileController> {
  const MyOrderReceiptView({super.key});
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
            children: [
              Row(
                children: [
                  MyBackBtn(),
                  Spacer(),
                  MyText(
                    text: LocaleKeys.my_orders.tr,
                    fontSize: 22,
                    // color: R.theme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn(),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      26.sbh,
                      Image.asset(width: 1.sw, R.image.img_card3),
                      67.sbh,
                      PrimaryButton(
                        text: 'Email Invoice',
                        onPressed: () {
                          // Get.to(() => const ResumeProCardView());
                        },
                      ),
                      10.sbh,
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: MyText(
                            text: LocaleKeys.cancel.tr,
                            fontSize: 16,
                            color: R.theme.color500,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      20.sbh,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
