// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcom_app/app/core/core.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../app/core/resources/app_images.dart';

import '../../../../../common/widgets/job_description_container.dart';
import '../../../../../common/widgets/job_list.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../../data/models/job_model.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/main_controller.dart';
import '../../explore/views/filter_view.dart';
import '../../explore/views/job_details_view.dart';
import '../controllers/home_controller.dart';
import '../../../../core/localization/locales.g.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    final PageController recomendtionSliderController = PageController(
      viewportFraction: 0.9,
    );

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
      LocaleKeys.category_full_time.tr,
      LocaleKeys.category_part_jobs.tr,
      LocaleKeys.category_freelance.tr,
    ];
    return Scaffold(
      // backgroundColor: R.theme.color100,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              width: 1.sw,
              // color: R.theme.color100,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 42,
                    child: Image.asset(
                      R.image.img_home,
                      width: 1.sw,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                    child: SafeArea(
                      child: Column(
                        children: [
                          const topAppBar(),
                          const Spacer(),
                          seachFilter(),
                          const Spacer(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: AppConfig.defaultPadding * 1.5,
                                right: AppConfig.defaultPadding * 1.5,
                              ),
                              child: Row(
                                children: [
                                  MyText(
                                    text: LocaleKeys.recommended.tr,
                                    fontSize: 16,
                                    color: R.theme.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.3,
                                  ),
                                  const Spacer(),
                                  SmoothPageIndicator(
                                    controller: recomendtionSliderController,
                                    count: 3,
                                    effect: ExpandingDotsEffect(
                                      activeDotColor: R.theme.red,
                                      dotColor: R.theme.color50,
                                      dotHeight: 6,
                                      dotWidth: 12,
                                      expansionFactor: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AppConfig.defaultPadding.sbh,
                          SizedBox(
                            height: 124,
                            child: PageView.builder(
                              itemCount: jobs.length,
                              physics: const BouncingScrollPhysics(),
                              controller: recomendtionSliderController,
                              onPageChanged: (int page) {},
                              itemBuilder: (context, int index) {
                                var data = jobs[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: index != 0
                                        ? AppConfig.defaultPadding
                                        : 0,
                                  ),
                                  child: JobList(data: data),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          4.sbh,
          Expanded(
            flex: 8,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 21,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: LocaleKeys.recently_added.tr,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<MainController>().index.value = 1;
                        },
                        child: MyText(
                          text: LocaleKeys.view_all_jobs.tr,
                          fontSize: 14,
                          color: R.theme.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
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
                                  text: category[i],
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
                4.sbh,
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
    );
  }

  Padding seachFilter() {
    return Padding(
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
          color: R.theme.white,
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
                if (data != null) {}
              },
              child: SvgPicture.asset(R.image.ic_filter),
            ),
          ],
        ),
      ),
    );
  }
}

class topAppBar extends StatelessWidget {
  const topAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppConfig.defaultPadding,
        right: AppConfig.defaultPadding,
        top: AppConfig.defaultPadding,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: R.theme.black,
            backgroundImage: AssetImage(R.image.img_dp),
          ),
          (AppConfig.defaultPadding / 2).sbw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: '${LocaleKeys.welcome_back.tr} Kelly',
                fontSize: 13,
                color: R.theme.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
              MyText(
                text: LocaleKeys.find_your_dream_job.tr,
                fontSize: 14,
                color: R.theme.white,
                height: 1.4,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.08,
              ),
            ],
          ),
          const Spacer(),
          NotificationBtn(light: true),
        ],
      ),
    );
  }
}
