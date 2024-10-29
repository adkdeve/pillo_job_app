import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/job_details_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class AccountEditView extends GetView<ProfileController> {
  const AccountEditView({super.key});
  @override
  Widget build(BuildContext context) {
    var isSwitched = true.obs;
    return Scaffold(
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            horizontal: defaultPadding * 1.5,
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  MyBackBtn(),
                  Spacer(),
                  MyText(
                    text: 'Edit account',
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn()
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    26.sbh,
                    const Textedit2(
                      title: 'First name',
                      titleTextColor: color500,
                      text: 'Jane',
                    ),
                    24.sbh,
                    const Textedit2(
                      title: 'Last name',
                      titleTextColor: color500,
                      text: 'Doe',
                    ),
                    24.sbh,
                    const Textedit2(
                      title: 'Date of Birth',
                      titleTextColor: color500,
                      text: 'March 12, 1995',
                    ),
                    24.sbh,
                    const Textedit2(
                      title: 'Gender',
                      icon: ic_arrow_down,
                      titleTextColor: color500,
                      text: 'Female',
                    ),
                    24.sbh,
                    const Textedit2(
                      title: 'Phone number',
                      titleTextColor: color500,
                      text: '1876 - 123 - 4567',
                    ),
                    24.sbh,
                    const Textedit2(
                      title: 'Email',
                      titleTextColor: color500,
                      text: 'janedoe@test.com',
                    ),
                    24.sbh,
                    const Textedit2(
                      title: 'Country',
                      titleTextColor: color500,
                      text: 'Jamaica',
                    ),
                    42.sbh,
                    PrimaryButton(text: 'Save', onPressed: () {}),
                    20.sbh,
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
