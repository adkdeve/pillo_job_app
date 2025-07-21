import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pcom_app/common/widgets/smooth_rectangle_border.dart';

import '../../app/core/core.dart';
import '../../app/data/models/job_model.dart';
import '../../app/modules/main/explore/views/job_details_view.dart';
import 'job_description_container.dart';
import 'my_text.dart';

class JobList extends StatelessWidget {
  const JobList({super.key, required this.data});

  final Job data;

  @override
  Widget build(BuildContext context) {
    var fav = false.obs;
    return GestureDetector(
      onTap: () {
        Get.to(() => const JobDetailsView());
      },
      child: Container(
        // width: 100,
        padding: const EdgeInsets.all(AppConfig.defaultPadding),
        decoration: BoxDecoration (
          // color: R.theme.white,
          color: Theme.of(context).brightness == Brightness.light
              ? AppThemeData.lightBoxDecorationColor // Use light theme decoration color
              : AppThemeData.darkBoxDecorationColor, // Use dark theme decoration color
          borderRadius: BorderRadius.circular(AppConfig.defaultPadding),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: ShapeDecoration(
                    color: R.theme.color100,
                    shape: SmoothRectangleBorder(
                      smoothness: 1,
                      borderRadius: BorderRadius.circular(
                        AppConfig.defaultPadding,
                      ),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(data.img, width: 24, height: 24),
                  ),
                ),
                23.sbw,
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: data.title,
                      fontSize: 16,
                      // color: R.theme.black,
                      fontWeight: FontWeight.w600,
                    ),
                    MyText(
                      text: data.location,
                      fontSize: 14,
                      height: 2,
                      color: Color(0xff0A6375),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    fav.value = !fav.value;
                  },
                  child: Obx(
                        () => Padding(
                      padding: const EdgeInsets.only(
                        right: AppConfig.defaultPadding / 1.5,
                        top: AppConfig.defaultPadding / 2,
                      ),
                      child: SvgPicture.asset(
                        color: Colors.white,
                        fav.value ? R.image.ic_heart : R.image.ic_heart_un,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                customJobDescriptionContainer(
                  context: context,
                  text: data.type,
                  fontSize: 11,
                  lightColor: R.theme.white, // Light theme decoration color
                  darkColor: R.theme.color600, // Dark theme decoration color
                  borderRadius: AppConfig.defaultPadding,
                ),
                (AppConfig.defaultPadding / 2).sbw,
                customJobDescriptionContainer(
                  context: context,
                  text: data.jobType,
                  fontSize: 11,
                  lightColor: R.theme.white, // Light theme decoration color
                  darkColor: R.theme.color600, // Dark theme decoration color
                  borderRadius: AppConfig.defaultPadding,
                ),
                (AppConfig.defaultPadding / 2).sbw,
                customJobDescriptionContainer(
                  context: context,
                  text: data.posted,
                  fontSize: 11,
                  lightColor: R.theme.white, // Light theme decoration color
                  darkColor: R.theme.color600, // Dark theme decoration color
                  borderRadius: AppConfig.defaultPadding,
                ),

                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'Application',
                      fontSize: 12,
                      opacity: 0.7,
                      // color: R.theme.black.withOpacity(.7),
                      fontWeight: FontWeight.w500,
                    ),
                    8.sbh,
                    Row(
                      children: [
                        SvgPicture.asset(R.image.ic_application_filled),
                        8.sbw,
                        MyText(
                          text: data.applications.toString(),
                          fontSize: 14,
                          letterSpacing: 0.7,
                          // color: R.theme.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
