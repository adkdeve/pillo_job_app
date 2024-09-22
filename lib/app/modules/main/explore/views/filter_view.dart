import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/explore_controller.dart';

class FilterView extends GetView<ExploreController> {
  const FilterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color100,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 8),
              child: Row(
                children: [
                  const MyBackBtn(),
                  const Spacer(),
                  const MyText(
                    text: 'Explore Jobs 🕵🏽‍️',
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    ic_notification_dark,
                  )
                ],
              ),
            ),
            defaultPadding.sbh,
          ],
        ),
      ),
    );
  }
}
