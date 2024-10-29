// ignore_for_file: unrelated_type_equality_checks

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/apply_job_view.dart';
import 'package:pillo/app/modules/main/explore/views/company_details_view.dart';
import 'package:pillo/app/modules/main/explore/views/filter_view.dart';
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
                                    text: 'Job Details  💼‍️',
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
                                ),
                                defaultPadding.sbw,
                                Column(
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
                                      children: [
                                        Container(
                                          width: 72,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
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
                                          child: Center(
                                            child: MyText(
                                              text: 'Part-Time',
                                              fontSize: 11,
                                              color: blackColor.withOpacity(.7),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        (defaultPadding / 3).sbw,
                                        Container(
                                          width: 72,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
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
                                          child: Center(
                                            child: MyText(
                                              text: '5 Days ago',
                                              fontSize: 11,
                                              color: blackColor.withOpacity(.7),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        (defaultPadding / 3).sbw,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const MyText(
                                              text: 'Application',
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
                    labelColor: green,
                    unselectedLabelColor: blackColor,
                    indicatorColor: green,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorWeight: 2, // Thickness of the underline
                    tabs: const [
                      Tab(text: 'Jobs Description'),
                      Tab(text: 'Company'),
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
                    top: 16, bottom: 16, left: 32, right: 16,
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
                              ? 'See All 12 Jobs'
                              : 'Apply Now',
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
                            fav.value ? ic_heart : ic_heart_un,
                            color: red,
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
      padding: const EdgeInsets.only(
        left: 13,
        right: 13,
        bottom: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyText(
            text:
                'The Brand Designer job description includes the entire process of brainstorming, visualizing and creating design including typography, layouts, illustration and photography.',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
            textAlign: TextAlign.left,
          ),
          20.sbh,
          // Responsibilities Section

          const MyText(
            text: 'Responsibilities',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: green,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          _buildBulletPoint(
              'Maintain brand consistency throughout all our marketing collaterals.'),
          _buildBulletPoint(
              'Assist to generate leads by optimizing the website, rendering our campaign visuals.'),
          _buildBulletPoint(
              'Work closely with the marketing team on improving visual artworks for both online and offline campaigns.'),
          _buildBulletPoint(
              'Stay updated and research on current market trends in design/fashion.'),
          (defaultPadding / 2).sbh,
          const MyText(
            text: 'Important Details',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: green,
            textAlign: TextAlign.left,
          ),
          10.sbh,

          const Row(
            children: [
              MyText(
                text: 'Job Category : ',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: 'Information Technology',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          8.sbh,
          const Row(
            children: [
              MyText(
                text: 'Years of Experience : ',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: '1-3 Years',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          8.sbh,
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Education Required : ',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              Expanded(
                child: MyText(
                  text: 'Associates , Bachelors',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                  letterSpacing: 0.1,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          8.sbh,
          const Row(
            children: [
              MyText(
                text: 'Skills Required : ',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: 'HTML, Figma, Java',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          8.sbh,
          const Row(
            children: [
              MyText(
                text: 'Job Type : ',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: 'Full-Time',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          8.sbh,
          const Row(
            children: [
              MyText(
                text: 'Work Type : ',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: 'Remote',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          8.sbh,

          const Row(
            children: [
              MyText(
                text: 'Salary : ',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
              MyText(
                text: 'none',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: blackColor,
                letterSpacing: 0.1,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          16.sbh,
          const MyText(
            text: 'Ideal Candidate',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          const MyText(
            text:
                'The Brand Designer job description includes the entire process of brainstorming, visualizing and creating design including typography, layouts, illustration and photography.',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
            color: blackColor,
            height: 1.4,
            textAlign: TextAlign.left,
          ),
          16.sbh,
          const MyText(
            text: 'Nice to Haves',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          const MyText(
            text:
                'The Brand Designer job description includes the entire process of brainstorming, visualizing and creating design including typography, layouts, illustration and photography.',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
            color: blackColor,
            height: 1.4,
            textAlign: TextAlign.left,
          ),
          // Location Section
          (defaultPadding).sbh,

          const MyText(
            text: 'Location',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
            color: green,
            textAlign: TextAlign.left,
          ),
          10.sbh,
          Container(
            height: 310,
            decoration: const BoxDecoration(
              color: color200,
              borderRadius: BorderRadius.all(
                Radius.circular(defaultPadding),
              ),
            ),
            child: Column(
              children: [
                const Expanded(
                  child: Center(
                    child: Text('Google Map Placeholder'),
                  ),
                ),
                Container(
                  width: 1.sw,
                  // height: 310,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        text: 'Address',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: blackColor,
                      ),
                      8.sbh,
                      MyText(
                        text:
                            '1254 Brunswick Rd, Kingston 11,\nSt. Andrew, Jamaica.',
                        fontSize: 14,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w400,
                        color: blackColor.withOpacity(.8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
          _buildBulletPoint('Medical insurance'),
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
          const Row(
            children: [
              MyText(
                text: 'Job Opportunities',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
                color: green,
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
          _buildBulletPoint('Medical insurance'),
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

  Widget thiredTab() {
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

class Textedit2 extends StatelessWidget {
  const Textedit2({
    super.key,
    required this.title,
    this.hintText = '',
    this.hintTextColor = color400,
    this.titleTextColor = blackColor,
    this.icon = '',
    this.maxLines = 1,
    this.minLines = 1,
    this.borderRadius = 12.0,
    this.require = false,
    this.text = '',
  });
  final String title;
  final String hintText;
  final Color hintTextColor;
  final Color titleTextColor;
  final String icon;
  final String text;
  final int maxLines;
  final double borderRadius;
  final int minLines;
  final bool require;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          maxLines: 3,
          TextSpan(
            children: [
              TextSpan(
                text: title,
                style: GoogleFonts.inter().copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.3,
                  color: titleTextColor,
                ),
              ),
              TextSpan(
                text: require ? '*' : '',
                style: GoogleFonts.inter().copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.3,
                  color: red,
                ),
              ),
            ],
          ),
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       child: MyText(
        //         textAlign: TextAlign.left,
        //         text: title,
        //         fontSize: 16,
        //         color: blackColor,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //     Visibility(
        //       visible: require,
        //       child: const MyText(
        //         text: '*',
        //         fontSize: 16,
        //         color: red,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //   ],
        // ),
        15.sbh,
        Container(
          padding: const EdgeInsets.all(2),
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              side: const BorderSide(color: color200),
            ),
          ),
          child: TextFormField(
            controller: TextEditingController(text: text),
            cursorColor: primaryColor,
            maxLines: maxLines,
            readOnly: icon != '',
            minLines: minLines,
            style: GoogleFonts.inter().copyWith(
              // color: primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: 12,
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.inter().copyWith(
                color: hintTextColor,
                fontSize: 14,
                fontWeight: hintTextColor == blackColor
                    ? FontWeight.w600
                    : FontWeight.w400,
                letterSpacing: 0.3,
              ),
              suffixIcon: icon == ''
                  ? null
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: SvgPicture.asset(
                        icon,
                      ),
                    ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

class StarRatingComponent extends StatelessWidget {
  final List<int> ratings;

  const StarRatingComponent({super.key, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(ratings.length, (i) {
      final percentage = ratings[i] / 100;
      return Row(
        children: [
          MyText(
            text: '${(i - 5).abs()} star',
            fontSize: 14,
            color: color900,
            fontWeight: FontWeight.w500,
          ),
          10.sbw,
          Expanded(
            child: LinearProgressIndicator(
              value: percentage,
              borderRadius: BorderRadius.circular(100),
              color: selectedStar,
              backgroundColor: unSelectedStar,
            ),
          ),
          10.sbw,
          SizedBox(
            width: 35,
            child: Text(
              ratings[i].toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      );
    })
        //  ratings.map((rating) {
        //   final percentage = rating / 100;
        //   return Row(
        //     children: [
        //       Text('$rating.index star', style: const TextStyle(fontSize: 16)),
        //       Expanded(
        //         child: LinearProgressIndicator(
        //           value: percentage,
        //           color: Colors.brown,
        //           backgroundColor: Colors.grey[300],
        //         ),
        //       ),
        //       Text(rating.toString(), style: const TextStyle(fontSize: 16)),
        //     ],
        //   );
        // }).toList(),
        );
  }
}
