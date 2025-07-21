import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pcom_app/app/core/core.dart';

import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../auth/views/signin_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/profile_controller.dart';

class TermOfUseView extends GetView<ProfileController> {
  const TermOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            // horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConfig.defaultPadding * 1.5,
                ),
                child: Row(
                  children: [
                    const MyBackBtn(),
                    const Spacer(),
                    MyText(
                      text: LocaleKeys.terms_of_use.tr,
                      fontSize: 22,
                      // color: R.theme.primary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                    const Spacer(),
                    NotificationBtn(),
                  ],
                ),
              ),
              34.sbh,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: LocaleKeys.introduction.tr,
                        fontSize: 18,
                        // color: R.theme.black,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      10.sbh,
                      MyText(
                        text: LocaleKeys.introduction_content.tr,
                        fontSize: 14,
                        // color: R.theme.black,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                      ),
                      10.sbh,
                      MyText(
                        text: '1. ${LocaleKeys.terms_of_use.tr}',
                        fontSize: 18,
                        // color: R.theme.black,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      19.sbh,
                      MyText(
                        text: '1.1 ${LocaleKeys.eligibility.tr}',
                        fontSize: 14,
                        color: R.theme.green,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      20.sbh,
                      MyText(
                        text: LocaleKeys.eligibility_content.tr,
                        fontSize: 14,
                        // color: R.theme.black,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                      ),
                      20.sbh,
                      MyText(
                        text: '1.2 ${LocaleKeys.user_accounts.tr}',
                        fontSize: 14,
                        color: R.theme.green,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w600,
                      ),
                      20.sbh,
                      MyText(
                        text: LocaleKeys.user_accounts_content.tr,
                        fontSize: 14,
                        // color: R.theme.black,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
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
