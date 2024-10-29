import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/explore_view.dart';
import 'package:pillo/app/modules/main/explore/views/filter_view.dart';
import 'package:pillo/app/modules/main/explore/views/job_details_view.dart';
import 'package:pillo/app/modules/main/explore/views/review_submit_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/modules/main/profile/views/help_support_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

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
                        img_home,
                        width: 1.sw,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    right: 25,
                    bottom: 0,
                    top: Get.mediaQuery.padding.top + defaultPadding,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const MyBackBtn(
                              light: true,
                            ),
                            const Expanded(
                              child: MyText(
                                text: 'Company Overview ️',
                                fontSize: 22,
                                color: whiteColor,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const HelpSupportView());
                              },
                              child: SvgPicture.asset(ic_dot_more_hor),
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
                                  color: color100,
                                  shape: SmoothRectangleBorder(
                                    smoothness: .5,
                                    borderRadius: BorderRadius.circular(
                                      defaultPadding,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    ic_blockchain,
                                    width: 48,
                                    height: 48,
                                  ),
                                ),
                              ),
                              defaultPadding.sbw,
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const MyText(
                                      text: 'Blockchain Architect ️',
                                      fontSize: 20,
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    (defaultPadding / 1.5).sbh,
                                    Row(
                                      children: [
                                        const MyText(
                                          text: 'Crypto.com',
                                          fontSize: 14,
                                          color: whiteColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        4.sbw,
                                        const Icon(
                                          Icons.circle,
                                          color: color400,
                                          size: 4,
                                        ),
                                        4.sbw,
                                        const MyText(
                                          text: 'St.James, Jamaica',
                                          fontSize: 14,
                                          color: whiteColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    defaultPadding.sbh,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // width: 108,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 5),
                                          decoration: ShapeDecoration(
                                            color: jobTags,
                                            shape: SmoothRectangleBorder(
                                              smoothness: 1,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                defaultPadding,
                                              ),
                                            ),
                                          ),
                                          child: const Center(
                                            child: MyText(
                                              text: 'Verified Employer',
                                              fontSize: 12,
                                              color: whiteColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const MyText(
                                              text: 'Job Opening',
                                              fontSize: 12,
                                              color: whiteColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            4.sbh,
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  ic_application_filled,
                                                ),
                                                const MyText(
                                                  text: '56',
                                                  fontSize: 14,
                                                  letterSpacing: 0.7,
                                                  color: whiteColor,
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
            const Padding(
              padding: EdgeInsets.all(13),
              child: TabBar(
                // tabAlignment: TabAlignment.fill,
                // isScrollable: true,
                labelPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,

                indicatorPadding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                labelColor: green,
                unselectedLabelColor: blackColor,
                indicatorColor: green,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                indicatorWeight: 2, // Thickness of the underline
                tabs: [
                  Tab(text: 'Home'),
                  // Tab(text: 'About'),
                  Tab(text: 'Job Listing'),
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
      padding: const EdgeInsets.only(
        left: 13,
        right: 13,
        bottom: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 28,
              horizontal: 18,
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffE4E6E8).withOpacity(.6),
                ),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyText(
                  text: 'About company',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.1,
                  textAlign: TextAlign.left,
                ),
                8.sbh,
                const MyText(
                  text:
                      "Crypto.com has transformed business communication. It’s the leading channel-based messaging platform, used by millions to align their teams, unify their systems, and drive their businesses forward. ",
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
                      const MyText(
                        text: 'Company website',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 7, top: 12),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.link,
                              size: 18,
                              color: red,
                            ),
                            8.sbw,
                            const MyText(
                              text: 'https://www.crypto.com',
                              fontSize: 14,
                              color: red,
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
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      MyText(
                        text: 'Latest jobs',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1,
                        color: blackColor,
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      MyText(
                        text: 'View all',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1,
                        color: red,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                14.sbh,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: 'Senior Brand Designer',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1,
                              textAlign: TextAlign.left,
                            ),
                            4.sbh,
                            const MyText(
                              text: '\$200,000/month',
                              fontSize: 15,
                              color: green,
                              fontWeight: FontWeight.w400,
                            ),
                            8.sbh,
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: green,
                                  size: 16,
                                ),
                                4.sbw,
                                MyText(
                                  text: 'Montego Bay, St.James',
                                  fontSize: 12,
                                  color: blackColor.withOpacity(.7),
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
                            color: jobTags,
                            shape: SmoothRectangleBorder(
                              smoothness: 1,
                              borderRadius: BorderRadius.circular(
                                defaultPadding,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: MyText(
                              text: 'Part-Time',
                              fontSize: 12,
                              color: blackColor,
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
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: 'Front-End Engineer',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1,
                              textAlign: TextAlign.left,
                            ),
                            4.sbh,
                            const MyText(
                              text: 'No Salary available',
                              fontSize: 15,
                              color: green,
                              fontWeight: FontWeight.w400,
                            ),
                            8.sbh,
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: green,
                                  size: 16,
                                ),
                                4.sbw,
                                MyText(
                                  text: 'Remote, Jamaica',
                                  fontSize: 12,
                                  color: blackColor.withOpacity(.7),
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
                            color: jobTags,
                            shape: SmoothRectangleBorder(
                              smoothness: 1,
                              borderRadius: BorderRadius.circular(
                                defaultPadding,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: MyText(
                              text: 'Full-Time',
                              fontSize: 12,
                              color: blackColor,
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
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: 'Junior Graphic Designer',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1,
                              textAlign: TextAlign.left,
                            ),
                            4.sbh,
                            const MyText(
                              text: '\$200,000/month',
                              fontSize: 15,
                              color: green,
                              fontWeight: FontWeight.w400,
                            ),
                            8.sbh,
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: green,
                                  size: 16,
                                ),
                                4.sbw,
                                MyText(
                                  text: 'Linstead, St.Catherine',
                                  fontSize: 12,
                                  color: blackColor.withOpacity(.7),
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
                            color: jobTags,
                            shape: SmoothRectangleBorder(
                              smoothness: 1,
                              borderRadius: BorderRadius.circular(
                                defaultPadding,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: MyText(
                              text: 'Part-Time',
                              fontSize: 12,
                              color: blackColor,
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
      padding: const EdgeInsets.only(
        left: 13,
        right: 13,
        bottom: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: 1.sw,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffDDE4EC),
              ),
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
                        decoration: const BoxDecoration(
                          color: green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.location_on_rounded,
                          color: whiteColor,
                        ),
                      ),
                      12.sbw,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: 'Address',
                              fontSize: 12,
                              textAlign: TextAlign.left,
                              color: green,
                              fontWeight: FontWeight.w400,
                            ),
                            3.sbh,
                            const Expanded(
                              child: MyText(
                                text:
                                    '34 New Brunswick Ave, Spanish Town, ST.Catherine, Jamaica',
                                fontSize: 16,
                                textAlign: TextAlign.left,
                                color: blackColor,
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
                        decoration: const BoxDecoration(
                          color: green,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          ic_profile,
                          color: whiteColor,
                        ),
                      ),
                      12.sbw,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: 'Employees',
                              fontSize: 12,
                              textAlign: TextAlign.left,
                              color: green,
                              fontWeight: FontWeight.w400,
                            ),
                            3.sbh,
                            const Expanded(
                              child: MyText(
                                text: '50 - 100 Employees',
                                fontSize: 16,
                                textAlign: TextAlign.left,
                                color: blackColor,
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
                        decoration: const BoxDecoration(
                          color: green,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            ic_web,
                            width: 20,
                            height: 20,
                            color: whiteColor,
                          ),
                        ),
                      ),
                      12.sbw,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: 'Website',
                              fontSize: 12,
                              textAlign: TextAlign.left,
                              color: green,
                              fontWeight: FontWeight.w400,
                            ),
                            3.sbh,
                            const Expanded(
                              child: MyText(
                                text: 'https://www.crypto.com',
                                fontSize: 14,
                                textAlign: TextAlign.left,
                                color: red,
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
          const MyText(
            text: 'About Company',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: green,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          const MyText(
            text:
                "Spotify is a digital music, podcast, and video service that gives you access to millions of songs and other content from creators all over the world.\n\nSpotify was founded in 2006 in Stockholm, Sweden, by Daniel Ek, former CTO of Stardoll, and Martin Lorentzon, co-founder of Tradedoubler. According to Ek, the company's title was initially misheard from a name shouted by Lorentzon. Later they thought out a portmanteau of \"spot\" and \"identify\"",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
            textAlign: TextAlign.left,
          ),
          20.sbh,
          const MyText(
            text: 'Benefit',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          _buildBulletPoint('Medical xinsurance'),
          _buildBulletPoint('Device and Software License'),
          _buildBulletPoint('Internet Provider'),
          _buildBulletPoint('Weekly Entertainment'),
          _buildBulletPoint('Flexible Working Hours'),
          (defaultPadding / 2).sbh,
          const MyText(
            text: 'Gallery',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: green,
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
                  child: Image.asset(
                    img_gallery,
                    fit: BoxFit.cover,
                  ),
                );
              }),
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
        padding: const EdgeInsets.only(
          left: 13,
          right: 13,
          bottom: 13,
        ),
        child: writeReview.value
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyText(
                    text: 'Overall Rating',
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                  21.sbh,
                  RatingBar(
                    size: 30,
                    filledColor: selectedStar,
                    emptyColor: selectedStar,
                    filledIcon: Icons.star_rounded,
                    emptyIcon: Icons.star_border_rounded,
                    onRatingChanged: (value) => debugPrint('$value'),
                    initialRating: 3,
                    maxRating: 5,
                  ),
                  24.sbh,
                  const Textedit2(
                    title: 'Are you a current or Former Employee?',
                    icon: ic_arrow_down,
                    hintText: 'Choose One',
                  ),
                  16.sbh,
                  const Textedit2(
                    title: 'Job Title',
                  ),
                  16.sbh,
                  const Textedit2(
                    title: 'Review Title',
                  ),
                  16.sbh,
                  const Textedit2(
                    title: 'Review Title',
                    minLines: 6,
                    maxLines: 8,
                  ),
                  100.sbh,
                  PrimaryButton(
                    text: 'Submit Review',
                    onPressed: () {
                      writeReview.value = false;
                      Get.to(() => const ReviewSubmitView());
                    },
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const MyText(
                        text: 'Cancel',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: color500,
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
                              const MyText(
                                text: '4.5',
                                fontSize: 48,
                                color: color900,
                                fontWeight: FontWeight.w600,
                              ),
                              SvgPicture.asset(
                                ic_star,
                                width: 32,
                                height: 32,
                                color: unSelectedStar,
                              ),
                            ],
                          ),
                          const MyText(
                            text: '0 reviews',
                            fontSize: 16,
                            color: color900,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      32.sbw,
                      Expanded(
                        child: StarRatingComponent(ratings: ratings),
                      ),
                    ],
                  ),
                  28.sbh,
                  PrimaryButton(
                    outlined: true,
                    textcolor: green,
                    color: green,
                    text: 'Write A Review',
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
        img: ic_product_designer, // Image asset path
      ),
      Job(
        title: 'Software Engineer',
        location: 'New York, NY',
        type: 'Part-Time',
        jobType: 'On-site',
        posted: '3d ago',
        applications: 56,
        img: ic_amazon,
      ),
      Job(
        title: 'UX/UI Designer',
        location: 'San Francisco, CA',
        type: 'Full-Time',
        jobType: 'Hybrid',
        posted: 'Today',
        applications: 77,
        img: ic_netflix,
      ),
    ];

    var selectedIndex = 0.obs;
    var category = [
      'All Jobs',
      'Remote',
      'Full Time',
      'Part Time',
      'Freelance',
      'Contract',
    ];
    // RxList<String> tags = ['Remote', 'Portmore', 'Health Care'].obs;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: defaultPadding,
              right: defaultPadding,
            ),
            child: Container(
              margin: const EdgeInsets.all(defaultPadding / 2),
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
                        hintText: 'Search crypto.com',
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
                const MyText(
                  text: 'Result',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                const MyText(
                  text: ' 30',
                  fontSize: 16,
                  color: red,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                const MyText(
                  text: 'Sort By',
                  fontSize: 14,
                  color: Color(0xff78828A),
                  fontWeight: FontWeight.w500,
                ),
                8.sbw,
                const MyText(
                  text: 'Most Recent',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                4.sbw,
                SvgPicture.asset(
                  ic_arrow_down,
                  width: 12,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: SizedBox(
              height: 34,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (c, i) {
                    return Obx(
                      () {
                        var isSelected = i == selectedIndex.value;
                        return GestureDetector(
                          onTap: () {
                            selectedIndex.value = i;
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            decoration: ShapeDecoration(
                              color: isSelected
                                  ? green.withOpacity(.1)
                                  : green.withOpacity(.03),
                              shape: SmoothRectangleBorder(
                                smoothness: 1,
                                borderRadius: BorderRadius.circular(
                                  defaultPadding,
                                ),
                              ),
                            ),
                            child: Center(
                              child: MyText(
                                text: category[i],
                                fontSize: 14,
                                color: isSelected ? green : color400,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ),
          defaultPadding.sbh,
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            itemCount: jobs.length,
            // physics: const BouncingScrollPhysics(),
            itemBuilder: (context, int index) {
              var data = jobs[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: JobList(data: data),
              );
            },
          ),
          defaultPadding.sbh,
        ],
      ),
    );
  }

  // Helper widget for bullet points
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              8.sbh,
              Icon(
                Icons.circle,
                size: 7,
                color: blackColor.withOpacity(.8),
              ),
            ],
          ),
          12.sbw,
          Expanded(
            child: MyText(
              text: text,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.1,
              height: 1.4,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
