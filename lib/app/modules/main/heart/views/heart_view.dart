import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../app/core/resources/app_images.dart';

import '../../../../../common/widgets/job_list.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../../data/models/job_model.dart';
import '../../home/views/home_view.dart';
import '../controllers/heart_controller.dart';
import '../../../../core/localization/locales.g.dart';

class HeartView extends GetView<HeartController> {
  const HeartView({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0.obs;
    var noData = false.obs;
    var category = [
      LocaleKeys.category_all_jobs.tr,
      LocaleKeys.remote.tr,
      LocaleKeys.category_full_time.tr,
      LocaleKeys.category_part_jobs.tr,
      LocaleKeys.category_freelance.tr,
      LocaleKeys.contract.tr,
    ];

    final List<Job> jobs = [
      Job(
        title: 'Product Designer',
        location: 'Kingston, St. Andrew',
        type: 'Full-Time',
        jobType: 'Remote',
        posted: '2d ago',
        applications: 957,
        img: R.image.ic_product_designer, // Image asset path
      ),
      Job(
        title: 'Software Engineer',
        location: 'New York, NY',
        type: 'Part-Time',
        jobType: 'On-site',
        posted: '3d ago',
        applications: 56,
        img: R.image.ic_amazon,
      ),
      Job(
        title: 'UX/UI Designer',
        location: 'San Francisco, CA',
        type: 'Full-Time',
        jobType: 'Hybrid',
        posted: 'Today',
        applications: 77,
        img: R.image.ic_netflix,
      ),
    ];

    return Scaffold(
      // backgroundColor: R.theme.color100,
      appBar: AppBar(
        // backgroundColor: R.theme.color100,
        // surfaceTintColor: R.theme.color100,
        centerTitle: true,
        title: MyText(
          text: LocaleKeys.my_favorites.tr,
          fontSize: 22,
          // color: R.theme.white,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
        actions: const [NotificationBtn()],
      ),
      body: Obx(
        () => Column(
          children: [
            AppConfig.defaultPadding.sbh,
            Padding(
              padding: const EdgeInsets.only(left: AppConfig.defaultPadding),
              child: SizedBox(
                height: 36,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (c, i) {
                    return Obx(() {
                      var isSelected = i == selectedIndex.value;
                      return GestureDetector(
                        onTap: () {
                          selectedIndex.value = i;
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: ShapeDecoration(
                            color: isSelected ? R.theme.green : null,
                            shape: SmoothRectangleBorder(
                              smoothness: 1,
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: isSelected
                                    ? R.theme.green
                                    : R.theme.color200,
                              ),
                            ),
                          ),
                          child: Center(
                            child: MyText(
                              text: category[i],
                              fontSize: 14,
                              color: isSelected
                                  ? R.theme.white
                                  : R.theme.color400,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
            ),
            noData.value
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(R.image.ic_no_save, height: 200),
                        30.sbh,
                        MyText(
                          text: LocaleKeys.no_saved_jobs_title.tr,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        8.sbh,
                        MyText(
                          text: LocaleKeys.no_saved_jobs_subtitle.tr,
                          fontSize: 14,
                          height: 1.5,
                          opacity: 0.5,
                          // color: R.theme.color500,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.1,
                        ),
                        AppConfig.defaultPadding.sbh,
                        PrimaryButton(
                          small: true,
                          text: LocaleKeys.explore_jobs.tr,
                          width: .5,
                          fontSize: 16,
                          onPressed: () {
                            noData.value = false;
                          },
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 21,
                            vertical: 23,
                          ),
                          child: Row(
                            children: [
                              MyText(
                                text: LocaleKeys.total.tr,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              MyText(
                                text: ' 30',
                                fontSize: 16,
                                color: R.theme.red,
                                fontWeight: FontWeight.w600,
                              ),
                              Spacer(),
                              MyText(
                                text: LocaleKeys.sort_by.tr,
                                fontSize: 14,
                                opacity: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                              8.sbw,
                              MyText(
                                text: LocaleKeys.most_recent.tr,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              4.sbw,
                              SvgPicture.asset(
                                R.image.ic_arrow_down,
                                width: 12,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: jobs.length,
                            // physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, int index) {
                              var data = jobs[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                child: JobList(data: data),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
