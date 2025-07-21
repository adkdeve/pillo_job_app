import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcom_app/app/core/core.dart';
import 'package:pcom_app/app/modules/main/explore/views/review_submit_view.dart';
import '../../../../../common/widgets/build_bullet_point.dart';
import '../../../../../common/widgets/job_list.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../../../common/widgets/star_rating.dart';
import '../../../../../common/widgets/text_edit_field.dart';
import '../../../../data/models/job_model.dart';
import '../../profile/views/help_support_view.dart';
import '../controllers/explore_controller.dart';

class CompanyDetailsView extends GetView<ExploreController> {
  const CompanyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
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
                    top: Get.mediaQuery.padding.top + AppConfig.defaultPadding,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MyBackBtn(),
                            Expanded(
                              child: MyText(
                                text: LocaleKeys.company_overview.tr,
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
                              child: SvgPicture.asset(R.image.ic_dot_more_hor),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 1.sw,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
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
                              AppConfig.defaultPadding.sbw,
                              Expanded(
                                child: Column(
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
                                          text: LocaleKeys
                                              .job_location
                                              .tr,
                                          fontSize: 14,
                                          color: R.theme.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    AppConfig.defaultPadding.sbh,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // width: 108,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
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
                                              text: 'Verified Employer',
                                              fontSize: 12,
                                              color: R.theme.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            MyText(
                                              text: 'Job Opening',
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
                                                8.sbw,
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
                              ),
                            ],
                          ),
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
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                indicatorWeight: 2, // Thickness of the underline
                tabs: [
                  Tab(
                    text: LocaleKeys.home.tr,
                  ),
                  // Tab(text: 'About'),
                  Tab(text: LocaleKeys.job_listing_title.tr),
                  // Tab(text: 'Review'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // firstTab(),
                  secondTab(),
                  thiredTab(),
                  // fourthTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView firstTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 13, right: 13, bottom: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffE4E6E8).withOpacity(.6),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyText(
                  text: LocaleKeys.about_company,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.1,
                  textAlign: TextAlign.left,
                ),
                8.sbh,
                const MyText(
                  text: LocaleKeys.crypto_description,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.1,
                  textAlign: TextAlign.left,
                ),
                22.sbh,
                Container(
                  width: 1.sw,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 21,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(218, 218, 218, 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: LocaleKeys.company_website_label.tr,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 7, top: 12),
                        child: Row(
                          children: [
                            Icon(Icons.link, size: 18, color: R.theme.red),
                            8.sbw,
                            MyText(
                              text: LocaleKeys.company_website_link.tr,
                              fontSize: 14,
                              color: R.theme.red,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.left,
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
          20.sbh,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(218, 218, 218, 0.15),
              border: Border.all(
                color: const Color(0xffE4E6E8).withOpacity(.6),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      MyText(
                        text: LocaleKeys.latest_jobs.tr,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1,
                        color: R.theme.black,
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
                ),
                14.sbh,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: R.theme.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
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
                                  color: R.theme.black.withOpacity(.7),
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
                ),
                14.sbh,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: R.theme.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
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
                                  color: R.theme.black.withOpacity(.7),
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
                ),
                14.sbh,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: R.theme.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
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
                                  color: R.theme.black.withOpacity(.7),
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
                ),
                20.sbh,
              ],
            ),
          ),
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
                                opacity: 0.7,
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
                                opacity: 0.7,
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
                        child: Center(
                          child: SvgPicture.asset(
                            R.image.ic_web,
                            width: 20,
                            height: 20,
                            color: R.theme.white,
                          ),
                        ),
                      ),
                      12.sbw,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: LocaleKeys.website_label.tr,
                              fontSize: 12,
                              textAlign: TextAlign.left,
                              color: R.theme.green,
                              fontWeight: FontWeight.w400,
                            ),
                            3.sbh,
                            Expanded(
                              child: MyText(
                                text: LocaleKeys.company_website.tr,
                                fontSize: 14,
                                opacity: 0.7,
                                textAlign: TextAlign.left,
                                color: R.theme.red,
                                fontWeight: FontWeight.w700,
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
            opacity: 0.9,
            textAlign: TextAlign.left,
          ),
          20.sbh,
          MyText(
            text: LocaleKeys.benefit_title.tr,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: R.theme.green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          buildBulletPoint(LocaleKeys.benefits_medical_insurance.tr),
          buildBulletPoint(LocaleKeys.benefits_device_software_license.tr),
          buildBulletPoint(LocaleKeys.benefits_internet_provider.tr),
          buildBulletPoint(LocaleKeys.benefits_weekly_entertainment.tr),
          buildBulletPoint(LocaleKeys.benefits_flexible_hours.tr),
          (AppConfig.defaultPadding / 2).sbh,
          MyText(
            text: LocaleKeys.gallery_label.tr,
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

  Widget fourthTab() {
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

  Widget thiredTab() {
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
      LocaleKeys.category_full_time.tr,
      LocaleKeys.category_part_jobs.tr,
      LocaleKeys.category_freelance.tr,
      LocaleKeys.contract.tr,
    ];
    // RxList<String> tags = ['Remote', 'Portmore', 'Health Care'].obs;

    return SingleChildScrollView(
      child: Column(
        children: [
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
                        // color: R.theme.primary,
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
                        hintText: LocaleKeys.search_placeholder.tr,
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
                  // GestureDetector(
                  //     onTap: () async {
                  //       var data = await Get.to(() => const FilterView());
                  //       if (data != null) {
                  //         filter.value = true;
                  //       }
                  //     },
                  //     child: SvgPicture.asset(ic_filter)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 23),
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
                  color: Color(0xff78828A),
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppConfig.defaultPadding),
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
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
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
          AppConfig.defaultPadding.sbh,
        ],
      ),
    );
  }
}
