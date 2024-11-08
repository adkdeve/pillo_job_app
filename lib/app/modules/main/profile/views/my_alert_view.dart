import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/filter_view.dart';
import 'package:pillo/app/modules/main/explore/views/job_details_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/modules/main/profile/views/my_view_alert_view.dart';
import 'package:pillo/app/modules/main/profile/views/resume_pro_card_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class MyAlertView extends GetView<ProfileController> {
  const MyAlertView({super.key});
  @override
  Widget build(BuildContext context) {
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
                    text: 'My Alerts',
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn()
                ],
              ),
              defaultPadding.sbh,
              Container(
                width: 1.sw,
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: color400),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ic_search),
                    Expanded(
                      child: TextFormField(
                        maxLines: 1,
                        style: GoogleFonts.inter().copyWith(
                          color: primaryColor,
                          // fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding / 1.5,
                            vertical: 12,
                          ),
                          hintText: 'Search alerts',
                          hintStyle: GoogleFonts.inter().copyWith(
                            color: color400,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.1,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                          var data = await Get.to(() => const FilterView());
                          if (data != null) {
                            // filter.value = true;
                          }
                        },
                        child: SvgPicture.asset(ic_filter)),
                  ],
                ),
              ),
              40.sbh,
              const MyAlertItem(
                title: 'Linstead Jobs',
              ),
              16.sbh,
              const MyAlertItem(
                title: 'Call Center',
              ),
              16.sbh,
              const MyAlertItem(
                title: 'Manager Jobs',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAlertItem extends StatelessWidget {
  const MyAlertItem({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const MyViewAlertView());
      },
      child: Container(
        width: 1.sw,
        padding: const EdgeInsets.only(
          top: 17,
          bottom: 11,
          right: 24,
          left: 14,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 50,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: const Color(0xffF9FAFB),
                shape: SmoothRectangleBorder(
                  smoothness: 1,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  ic_notification2,
                  width: 20,
                  height: 20,
                  color: green,
                ),
              ),
            ),
            16.sbw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: title,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
                5.sbh,
                const MyText(
                  text: 'Job Alerts',
                  fontSize: 12,
                  color: Color(0xff747A80),
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Container(
                  width: 90,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: ShapeDecoration(
                    color: const Color(0xff004EE4).withOpacity(.1),
                    shape: SmoothRectangleBorder(
                      smoothness: 1,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Center(
                    child: MyText(
                      text: 'View',
                      fontSize: 12,
                      color: Color(0xff004EE4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                8.sbh,
                const MyText(
                  text: 'Aug 10, 2024',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff747A80),
                ),
              ],
            )
          ],
        ),
      ),
   
    );
  }
}
