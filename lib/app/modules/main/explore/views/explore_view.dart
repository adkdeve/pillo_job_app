import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../app/core/resources/app_images.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcom_app/app/core/core.dart';

import '../../../../../common/widgets/job_list.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../../../common/widgets/tag_item.dart';
import '../../../../data/models/job_model.dart';
import '../../home/views/home_view.dart';
import '../controllers/explore_controller.dart';
import 'filter_view.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
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

    var selectedIndex = 0.obs;
    var category = [
      LocaleKeys.category_all_jobs.tr,
      LocaleKeys.remote.tr,
      LocaleKeys.full_time.tr,
      LocaleKeys.part_time.tr,
      LocaleKeys.freelance.tr,
      LocaleKeys.contract.tr,
    ];
    var filter = true.obs;
    RxList<String> tags = ['Remote', 'Portmore', 'Health Care'].obs;
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.light.copyWith(
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );
    return Scaffold(
      // backgroundColor: R.theme.color100,
      appBar: AppBar(
        // backgroundColor: R.theme.color100,
        // surfaceTintColor: R.theme.color100,
        centerTitle: true,
        title: MyText(
          text: LocaleKeys.explore_jobs.tr,
          fontSize: 22,
          // color: R.theme.primary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
        actions: [NotificationBtn()],
      ),
      body: Obx(
        () => Column(
          children: [
            AppConfig.defaultPadding.sbh,
            Padding(
              padding: const EdgeInsets.only(
                left: AppConfig.defaultPadding,
                right: AppConfig.defaultPadding,
              ),
              child: Container(
                margin: const EdgeInsets.all(AppConfig.defaultPadding / 2),
                width: 1.sw,
                height: 52,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConfig.defaultPadding,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: R.theme.color400),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(R.image.ic_search),
                    Expanded(
                      child: TextFormField(
                        maxLines: 1,
                        style: GoogleFonts.inter().copyWith(
                          color: R.theme.primary,
                          // fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: AppConfig.defaultPadding / 1.5,
                            vertical: 12,
                          ),
                          hintText: LocaleKeys.search_job_or_company.tr,
                          hintStyle: GoogleFonts.inter().copyWith(
                            color: R.theme.color400,
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
                          filter.value = true;
                        }
                      },
                      child: SvgPicture.asset(R.image.ic_filter),
                    ),
                  ],
                ),
              ),
            ),
            filter.value
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 21,
                      vertical: 23,
                    ),
                    child: Row(
                      children: [
                        MyText(
                          text: LocaleKeys.result_label.tr,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        MyText(
                          text: LocaleKeys.result_count.tr,
                          fontSize: 16,
                          color: R.theme.red,
                          fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                        MyText(
                          text: LocaleKeys.sort_by_label.tr,
                          fontSize: 14,
                          opacity: 0.7,
                          // color: Color(0xff78828A),
                          fontWeight: FontWeight.w500,
                        ),
                        8.sbw,
                        MyText(
                          text: LocaleKeys.sort_most_recent.tr,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        4.sbw,
                        SvgPicture.asset(R.image.ic_arrow_down, width: 12),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 21, vertical: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: LocaleKeys.recently_added.tr,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        MyText(
                          text: LocaleKeys.view_all_jobs.tr,
                          fontSize: 14,
                          color: R.theme.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
            filter.value
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConfig.defaultPadding,
                    ),
                    child: Obx(
                      () => Container(
                        alignment: Alignment.centerLeft,
                        width: 1.sw,
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: tags.map((tag) {
                            return TagItem(
                              label: tag,
                              onRemove: () {
                                tags.remove(tag);
                                if (tags.isEmpty) {
                                  filter.value = false;
                                }
                                // tags.refresh();
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                      left: AppConfig.defaultPadding,
                    ),
                    child: SizedBox(
                      height: 34,
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
                                  vertical: 6,
                                ),
                                decoration: ShapeDecoration(
                                  color: isSelected
                                      ? R.theme.green.withOpacity(.1)
                                      : R.theme.green.withOpacity(.03),
                                  shape: SmoothRectangleBorder(
                                    smoothness: 1,
                                    borderRadius: BorderRadius.circular(
                                      AppConfig.defaultPadding,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: MyText(
                                    text:
                                        category[i], // TODO: Localize category if needed
                                    fontSize: 14,
                                    color: isSelected
                                        ? R.theme.green
                                        : R.theme.color400,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ),
            AppConfig.defaultPadding.sbh,
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
    );
  }
}
