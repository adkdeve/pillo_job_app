// ignore_for_file: unrelated_type_equality_checks

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pcom_app/app/core/core.dart';
import 'package:pcom_app/app/modules/main/explore/views/review_submit_view.dart';
import '../../../../../common/widgets/build_bullet_point.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../../../common/widgets/star_rating.dart';
import '../../../../../common/widgets/text_edit_field.dart';
import '../../profile/views/help_support_view.dart';
import '../controllers/explore_controller.dart';
import 'apply_job_view.dart';
import 'company_details_view.dart';

class JobDetailsView extends GetView<ExploreController> {
  const JobDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ExploreController());
    var fav = false.obs;
    // var controller = Get.put(dExploreController());
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: 260,
                  width: 1.sw,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: Image.asset(
                            R.image.img_home,
                            width: 1.sw,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        right: 25,
                        bottom: 0,
                        top:
                            Get.mediaQuery.padding.top +
                            AppConfig.defaultPadding,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                MyBackBtn(),
                                Expanded(
                                  child: MyText(
                                    text: LocaleKeys.job_details.tr,
                                    fontSize: 22,
                                    color: R.theme.white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.1,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const HelpSupportView());
                                  },
                                  child: SvgPicture.asset(
                                    R.image.ic_dot_more_hor,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const CompanyDetailsView());
                                  },
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: ShapeDecoration(
                                      color: R.theme.color100,
                                      shape: SmoothRectangleBorder(
                                        smoothness: .5,
                                        borderRadius: BorderRadius.circular(
                                          AppConfig.defaultPadding,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        R.image.ic_blockchain,
                                        width: 48,
                                        height: 48,
                                      ),
                                    ),
                                  ),
                                ),
                                AppConfig.defaultPadding.sbw,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: LocaleKeys.blockchain_architect.tr,
                                      fontSize: 20,
                                      color: R.theme.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    (AppConfig.defaultPadding / 1.5).sbh,
                                    Row(
                                      children: [
                                        MyText(
                                          text: LocaleKeys.company_name.tr,
                                          fontSize: 14,
                                          color: R.theme.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        4.sbw,
                                        Icon(
                                          Icons.circle,
                                          color: R.theme.color400,
                                          size: 4,
                                        ),
                                        4.sbw,
                                        MyText(
                                          text: LocaleKeys.job_location.tr,
                                          fontSize: 13,
                                          maxLines: 1,
                                          color: R.theme.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    AppConfig.defaultPadding.sbh,
                                    Row(
                                      children: [
                                        Container(
                                          width: 72,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
                                          decoration: ShapeDecoration(
                                            color: R.theme.jobTags,
                                            shape: SmoothRectangleBorder(
                                              smoothness: 1,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    AppConfig.defaultPadding,
                                                  ),
                                            ),
                                          ),
                                          child: Center(
                                            child: MyText(
                                              text: LocaleKeys.part_time.tr,
                                              fontSize: 11,
                                              color: R.theme.black.withOpacity(
                                                .7,
                                              ),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        (AppConfig.defaultPadding / 3).sbw,
                                        Container(
                                          width: 72,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 5,
                                          ),
                                          decoration: ShapeDecoration(
                                            color: R.theme.jobTags,
                                            shape: SmoothRectangleBorder(
                                              smoothness: 1,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    AppConfig.defaultPadding,
                                                  ),
                                            ),
                                          ),
                                          child: Center(
                                            child: MyText(
                                              text: LocaleKeys.days_ago.tr,
                                              fontSize: 11,
                                              color: R.theme.black.withOpacity(
                                                .7,
                                              ),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        (AppConfig.defaultPadding / 3).sbw,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            MyText(
                                              text: LocaleKeys.application.tr,
                                              fontSize: 12,
                                              color: R.theme.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            4.sbh,
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  R.image.ic_application_filled,
                                                ),
                                                MyText(
                                                  text: LocaleKeys
                                                      .applications_count
                                                      .tr,
                                                  fontSize: 14,
                                                  letterSpacing: 0.7,
                                                  color: R.theme.white,
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
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: TabBar(
                    controller: controller.tabcontroller,
                    // tabAlignment: TabAlignment.fill,
                    // isScrollable: true,
                    labelPadding: EdgeInsets.zero,
                    padding: EdgeInsets.zero,

                    indicatorPadding: EdgeInsets.zero,
                    dividerColor: Colors.transparent,
                    labelColor: R.theme.green,
                    // unselectedLabelColor: R.theme.black,
                    indicatorColor: R.theme.green,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorWeight: 2, // Thickness of the underline
                    tabs: [
                      Tab(text: LocaleKeys.jobs_description.tr),
                      Tab(text: LocaleKeys.company.tr),
                      // Tab(text: 'Review'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabcontroller,
                    children: [
                      // 1st Tab: Job Description
                      firstTab(),
                      // 2nd Tab: Company Information
                      secondTab(),
                      // 3rd Tab: Reviews Section
                      // thiredTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: controller.selectedIndex != 2,
            child: Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Obx(
                () => Container(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                    left: 32,
                    right: 16,
                    // horizontal: 32,
                    // vertical: 16,
                  ),
                  width: 1.sw,
                  decoration: const BoxDecoration(
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Colors.white.withOpacity(0.5),
                    //     Colors.white.withOpacity(0.89),
                    //     Colors.white,
                    //   ],
                    //   stops: const [
                    //     0.0,
                    //     0.9998,
                    //     1.0,
                    //   ],
                    // ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          text: controller.selectedIndex == 1
                              ? LocaleKeys.see_all_jobs.tr
                              : LocaleKeys.apply_now.tr,
                          onPressed: () {
                            if (controller.selectedIndex == 1) {
                              Get.to(() => const CompanyDetailsView());
                            } else {
                              Get.to(() => const ApplyJobView());
                            }
                          },
                        ),
                      ),
                      8.sbw,
                      // SvgPicture.asset(ic_fav),
                      IconButton(
                        onPressed: () {
                          fav.value = !fav.value;
                        },
                        icon: Obx(
                          () => SvgPicture.asset(
                            fav.value ? R.image.ic_heart : R.image.ic_heart_un,
                            color: R.theme.red,
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView firstTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 13, right: 13, bottom: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: LocaleKeys.jobs_description.tr,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
            textAlign: TextAlign.left,
          ),
          20.sbh,
          // Responsibilities Section
          MyText(
            text: LocaleKeys.responsibilities.tr,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          buildBulletPoint(
            'Maintain brand consistency throughout all our marketing collaterals.',
          ),
          buildBulletPoint(
            'Assist to generate leads by optimizing the website, rendering our campaign visuals.',
          ),
          buildBulletPoint(
            'Work closely with the marketing team on improving visual artworks for both online and offline campaigns.',
          ),
          buildBulletPoint(
            'Stay updated and research on current market trends in design/fashion.',
          ),
          (AppConfig.defaultPadding / 2).sbh,
          MyText(
            text: LocaleKeys.important_details.tr,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          Row(
            children: [
              MyText(
                text: LocaleKeys.job_category.tr,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: 'Information Technology',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                opacity: 0.7,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          8.sbh,
          Row(
            children: [
              MyText(
                text: LocaleKeys.years_of_experience.tr,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: '1-3 Years',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                opacity: 0.7,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          8.sbh,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: LocaleKeys.education_required.tr,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: MyText(
                  text: 'Associates, Bachelors',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  opacity: 0.7,
                  // color: R.theme.black,
                  letterSpacing: 0.1,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          8.sbh,
          Row(
            children: [
              MyText(
                text: LocaleKeys.skills_required.tr,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: 'HTML, Figma, Java',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                opacity: 0.7,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          8.sbh,
          Row(
            children: [
              MyText(
                text: LocaleKeys.job_type.tr,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: LocaleKeys.full_time.tr,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                // color: R.theme.black,
                opacity: 0.7,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          8.sbh,
          Row(
            children: [
              MyText(
                text: LocaleKeys.work_type.tr,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: LocaleKeys.work_type_remote.tr,
                fontSize: 16,
                opacity: 0.7,
                fontWeight: FontWeight.w400,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          8.sbh,
          Row(
            children: [
              MyText(
                text: LocaleKeys.salary.tr,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                // color: R.theme.black,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: 'none',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                // color: R.theme.black,
                opacity: 0.7,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          16.sbh,
          MyText(
            text: LocaleKeys.ideal_candidate.tr,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          MyText(
            text: 'The Brand Designer job description includes the entire process of brainstorming, visualizing and creating design including typography, layouts, illustration and photography.',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
            // color: R.theme.black,
            height: 1.4,
            textAlign: TextAlign.left,
          ),
          16.sbh,
          MyText(
            text: LocaleKeys.nice_to_haves.tr,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          MyText(
            text: 'The Brand Designer job description includes the entire process of brainstorming, visualizing and creating design including typography, layouts, illustration and photography.',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
            // color: R.theme.black,
            height: 1.4,
            textAlign: TextAlign.left,
          ),
          // Location Section
          (AppConfig.defaultPadding).sbh,
          MyText(
            text: LocaleKeys.location_section.tr,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          Container(
            height: 310,
            decoration: BoxDecoration(
              color: R.theme.color200,
              borderRadius: BorderRadius.all(
                Radius.circular(AppConfig.defaultPadding),
              ),
            ),
            child: Column(
              children: [
                Expanded(child: Center(child: Text('Google Map Placeholder'))),
                Container(
                  width: 1.sw,
                  // height: 310,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: R.theme.white,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: LocaleKeys.address.tr,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: R.theme.black,
                      ),
                      8.sbh,
                      MyText(
                        text: LocaleKeys.job_location_details.tr,
                        fontSize: 14,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                        color: R.theme.black.withOpacity(.8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          20.sbh,
          MyText(
            text: 'Benefit',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          buildBulletPoint(LocaleKeys.medical_insurance.tr),
          buildBulletPoint(LocaleKeys.device_software_license.tr),
          buildBulletPoint(LocaleKeys.internet_provider.tr),
          buildBulletPoint(LocaleKeys.weekly_entertainment.tr),
          buildBulletPoint(LocaleKeys.flexible_working_hours.tr),
          (AppConfig.defaultPadding / 2).sbh,
          MyText(
            text: LocaleKeys.gallery.tr,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          14.sbh,
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(R.image.img_gallery, fit: BoxFit.cover),
              );
            },
          ),
          80.sbh,
          // SizedBox(
          //   height: 170,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Image.asset(
          //         img_dp,
          //         height: 170,
          //         // width: 170,
          //       ),
          //       Image.asset(
          //         img_dp,
          //         height: 170,
          //         // width: 170,
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  SingleChildScrollView secondTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 13, right: 13, bottom: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: 1.sw,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffDDE4EC)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(11),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: R.theme.green,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.location_on_rounded,
                          color: R.theme.white,
                        ),
                      ),
                      12.sbw,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: LocaleKeys.location.tr,
                              fontSize: 12,
                              textAlign: TextAlign.left,
                              color: R.theme.green,
                              fontWeight: FontWeight.w400,
                            ),
                            3.sbh,
                            Expanded(
                              child: MyText(
                                text: LocaleKeys.address.tr,
                                fontSize: 16,
                                textAlign: TextAlign.left,
                                // color: R.theme.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                16.sbh,
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(11),
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: R.theme.green,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          R.image.ic_profile,
                          color: R.theme.white,
                        ),
                      ),
                      12.sbw,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: LocaleKeys.employees.tr,
                              fontSize: 12,
                              textAlign: TextAlign.left,
                              color: R.theme.green,
                              fontWeight: FontWeight.w400,
                            ),
                            3.sbh,
                            Expanded(
                              child: MyText(
                                text: '50 - 100 Employees',
                                fontSize: 16,
                                textAlign: TextAlign.left,
                                // color: R.theme.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          16.sbh,
          MyText(
            text: LocaleKeys.about_company.tr,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          MyText(
            text: LocaleKeys.about_company_details.tr,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
            textAlign: TextAlign.left,
          ),
          20.sbh,
          Row(
            children: [
              MyText(
                text: LocaleKeys.job_opportunities.tr,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
                color: R.theme.green,
                textAlign: TextAlign.left,
              ),
              Spacer(),
              MyText(
                text: LocaleKeys.view_all.tr,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
                color: R.theme.red,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          14.sbh,
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: LocaleKeys.job_senior_brand_designer.tr,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      textAlign: TextAlign.left,
                    ),
                    4.sbh,
                    MyText(
                      text: LocaleKeys.job_salary.tr,
                      fontSize: 15,
                      color: R.theme.green,
                      fontWeight: FontWeight.w400,
                    ),
                    8.sbh,
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: R.theme.green,
                          size: 16,
                        ),
                        4.sbw,
                        MyText(
                          text: LocaleKeys.job_location.tr,
                          fontSize: 12,
                          opacity: 0.7,
                          // color: R.theme.black.withOpacity(.7),
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 72,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: ShapeDecoration(
                    color: R.theme.jobTags,
                    shape: SmoothRectangleBorder(
                      smoothness: 1,
                      borderRadius: BorderRadius.circular(
                        AppConfig.defaultPadding,
                      ),
                    ),
                  ),
                  child: Center(
                    child: MyText(
                      text: LocaleKeys.part_time.tr,
                      fontSize: 12,
                      color: R.theme.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          14.sbh,
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: LocaleKeys.job_front_end_engineer.tr,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      textAlign: TextAlign.left,
                    ),
                    4.sbh,
                    MyText(
                      text: LocaleKeys.job_no_salary.tr,
                      fontSize: 15,
                      color: R.theme.green,
                      fontWeight: FontWeight.w400,
                    ),
                    8.sbh,
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: R.theme.green,
                          size: 16,
                        ),
                        4.sbw,
                        MyText(
                          text: LocaleKeys.job_remote_location.tr,
                          fontSize: 12,
                          opacity: 0.7,
                          // color: R.theme.black.withOpacity(.7),
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 72,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: ShapeDecoration(
                    color: R.theme.jobTags,
                    shape: SmoothRectangleBorder(
                      smoothness: 1,
                      borderRadius: BorderRadius.circular(
                        AppConfig.defaultPadding,
                      ),
                    ),
                  ),
                  child: Center(
                    child: MyText(
                      text: LocaleKeys.full_time.tr,
                      fontSize: 12,
                      color: R.theme.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          14.sbh,
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: LocaleKeys.job_junior_graphic_designer.tr,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      textAlign: TextAlign.left,
                    ),
                    4.sbh,
                    MyText(
                      text: LocaleKeys.job_junior_salary.tr,
                      fontSize: 15,
                      color: R.theme.green,
                      fontWeight: FontWeight.w400,
                    ),
                    8.sbh,
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: R.theme.green,
                          size: 16,
                        ),
                        4.sbw,
                        MyText(
                          text: LocaleKeys.job_junior_location.tr,
                          fontSize: 12,
                          opacity: 0.7,
                          // color: R.theme.black.withOpacity(.7),
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 72,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: ShapeDecoration(
                    color: R.theme.jobTags,
                    shape: SmoothRectangleBorder(
                      smoothness: 1,
                      borderRadius: BorderRadius.circular(
                        AppConfig.defaultPadding,
                      ),
                    ),
                  ),
                  child: Center(
                    child: MyText(
                      text: LocaleKeys.part_time.tr,
                      fontSize: 12,
                      color: R.theme.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          20.sbh,
          MyText(
            text: 'Benefit',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          buildBulletPoint(LocaleKeys.medical_insurance.tr),
          buildBulletPoint(LocaleKeys.device_software_license.tr),
          buildBulletPoint(LocaleKeys.internet_provider.tr),
          buildBulletPoint(LocaleKeys.weekly_entertainment.tr),
          buildBulletPoint(LocaleKeys.flexible_working_hours.tr),
          (AppConfig.defaultPadding / 2).sbh,
          MyText(
            text: LocaleKeys.gallery.tr,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          14.sbh,
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(R.image.img_gallery, fit: BoxFit.cover),
              );
            },
          ),
          80.sbh,
        ],
      ),
    );
  }

  Widget thiredTab() {
    final ratings = [0, 0, 0, 0, 0];
    var writeReview = false.obs;

    return Obx(
      () => SingleChildScrollView(
        padding: const EdgeInsets.only(left: 13, right: 13, bottom: 13),
        child: writeReview.value
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: LocaleKeys.overall_rating.tr,
                    fontSize: 16,
                    color: R.theme.black,
                    fontWeight: FontWeight.w600,
                  ),
                  21.sbh,
                  RatingBar(
                    size: 30,
                    filledColor: R.theme.selectedStar,
                    emptyColor: R.theme.selectedStar,
                    filledIcon: Icons.star_rounded,
                    emptyIcon: Icons.star_border_rounded,
                    onRatingChanged: (value) => debugPrint('$value'),
                    initialRating: 3,
                    maxRating: 5,
                  ),
                  24.sbh,
                  Textedit2(
                    title: LocaleKeys.current_or_former_employee.tr,
                    icon: R.image.ic_arrow_down,
                    hintText: LocaleKeys.choose_one.tr,
                  ),
                  16.sbh,
                  Textedit2(title: LocaleKeys.job_title.tr),
                  16.sbh,
                  Textedit2(title: LocaleKeys.review_title.tr),
                  16.sbh,
                  Textedit2(
                    title: LocaleKeys.review_title.tr,
                    minLines: 6,
                    maxLines: 8,
                  ),
                  100.sbh,
                  PrimaryButton(
                    text: LocaleKeys.submit_review.tr,
                    onPressed: () {
                      writeReview.value = false;
                      Get.to(() => const ReviewSubmitView());
                    },
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: MyText(
                        text: LocaleKeys.cancel.tr,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: R.theme.color500,
                      ),
                    ),
                  ),
                  32.sbh,
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              MyText(
                                text: '4.5',
                                fontSize: 48,
                                color: R.theme.color900,
                                fontWeight: FontWeight.w600,
                              ),
                              SvgPicture.asset(
                                R.image.ic_star,
                                width: 32,
                                height: 32,
                                color: R.theme.unSelectedStar,
                              ),
                            ],
                          ),
                          MyText(
                            text: LocaleKeys.no_reviews.tr,
                            fontSize: 16,
                            color: R.theme.color900,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      32.sbw,
                      Expanded(child: StarRatingComponent(ratings: ratings)),
                    ],
                  ),
                  28.sbh,
                  PrimaryButton(
                    outlined: true,
                    textcolor: R.theme.green,
                    color: R.theme.green,
                    text: LocaleKeys.write_review.tr,
                    onPressed: () {
                      writeReview.value = true;
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
