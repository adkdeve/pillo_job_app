// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/my_text_form_field.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light,
    ));
    final PageController recomendtionSliderController =
        PageController(viewportFraction: 0.9);

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
      'Full Time',
      'Part Jobs',
      'Freelance',
    ];
    return Scaffold(
      backgroundColor: color100,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: 1.sw,
              color: color100,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 62,
                    child: Image.asset(
                      img_home,
                      width: 1.sw,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SafeArea(
                    child: Positioned.fill(
                      child: Column(
                        children: [
                          const topAppBar(),
                          const Spacer(),
                          seachFilter(),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: defaultPadding * 1.5,
                              right: defaultPadding * 1.5,
                            ),
                            child: Row(
                              children: [
                                const MyText(
                                  text: 'Recommended',
                                  fontSize: 16,
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                                const Spacer(),
                                SmoothPageIndicator(
                                  controller: recomendtionSliderController,
                                  count: 3,
                                  effect: const ExpandingDotsEffect(
                                    activeDotColor: red,
                                    dotColor: color50,
                                    dotHeight: 6,
                                    dotWidth: 12,
                                    expansionFactor: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          defaultPadding.sbh,
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
                                    left: index != 0 ? defaultPadding : 0,
                                  ),
                                  child: JobList(data: data),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21, vertical: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        text: 'Recently Added ️',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      MyText(
                        text: 'View all ️',
                        fontSize: 14,
                        color: red,
                        fontWeight: FontWeight.w700,
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
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: jobs.length,
                    // physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, int index) {
                      var data = jobs[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
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
          color: whiteColor,
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
                  hintText: 'Search job or company',
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
            SvgPicture.asset(ic_filter),
          ],
        ),
      ),
    );
  }
}

class topAppBar extends StatelessWidget {
  const topAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding,
        top: defaultPadding / 2,
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: blackColor,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwRPWpO-12m19irKlg8znjldmcZs5PO97B6A&s'),
          ),
          (defaultPadding / 2).sbw,
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Welcome Back Kelly 👋🏽',
                fontSize: 14,
                color: whiteColor,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
              MyText(
                text: 'Let’s find your dream Job!!',
                fontSize: 16,
                color: whiteColor,
                height: 1.4,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.08,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(ic_notification),
          )
        ],
      ),
    );
  }
}

class Job {
  final String title;
  final String location;
  final String type; // e.g. Full-Time or Part-Time
  final String jobType; // e.g. Remote, On-site, Hybrid
  final String posted; // e.g. '2d ago'
  final int applications; // e.g. number of applications
  final String img; // Image asset path

  Job({
    required this.title,
    required this.location,
    required this.type,
    required this.jobType,
    required this.posted,
    required this.applications,
    required this.img,
  });
}

class JobList extends StatelessWidget {
  const JobList({
    super.key,
    required this.data,
  });

  final Job data;

  @override
  Widget build(BuildContext context) {
    var fav = false.obs;
    return Container(
      // width: 100,

      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultPadding),
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
                  color: color100,
                  shape: SmoothRectangleBorder(
                    smoothness: 1,
                    borderRadius: BorderRadius.circular(
                      defaultPadding,
                    ),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    data.img,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const Spacer(),
              const Column(
                children: [
                  MyText(
                    text: 'Product Designer ️',
                    fontSize: 16,
                    color: blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                  MyText(
                    text: 'Kingston, St.Andrew ️',
                    fontSize: 14,
                    height: 2,
                    color: Color(0xff0A6375),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              GestureDetector(
                onTap: () {
                  fav.value = !fav.value;
                },
                child: Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(
                      right: defaultPadding / 1.5,
                      top: defaultPadding / 2,
                    ),
                    child:
                        SvgPicture.asset(fav.value ? ic_heart_fill : ic_heart),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: ShapeDecoration(
                  color: color100,
                  shape: SmoothRectangleBorder(
                    smoothness: 1,
                    borderRadius: BorderRadius.circular(
                      defaultPadding,
                    ),
                  ),
                ),
                child: Center(
                  child: MyText(
                    text: data.type,
                    fontSize: 11,
                    color: blackColor.withOpacity(.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              (defaultPadding / 2).sbw,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: ShapeDecoration(
                  color: color100,
                  shape: SmoothRectangleBorder(
                    smoothness: 1,
                    borderRadius: BorderRadius.circular(
                      defaultPadding,
                    ),
                  ),
                ),
                child: Center(
                  child: MyText(
                    text: data.jobType,
                    fontSize: 11,
                    color: blackColor.withOpacity(.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              (defaultPadding / 2).sbw,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: ShapeDecoration(
                  color: color100,
                  shape: SmoothRectangleBorder(
                    smoothness: 1,
                    borderRadius: BorderRadius.circular(
                      defaultPadding,
                    ),
                  ),
                ),
                child: Center(
                  child: MyText(
                    text: data.posted,
                    fontSize: 11,
                    color: blackColor.withOpacity(.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: 'Application',
                    fontSize: 12,
                    color: blackColor.withOpacity(.7),
                    fontWeight: FontWeight.w500,
                  ),
                  4.sbh,
                  Row(
                    children: [
                      SvgPicture.asset(
                        ic_application_filled,
                      ),
                      MyText(
                        text: data.applications.toString(),
                        fontSize: 14,
                        letterSpacing: 0.7,
                        color: blackColor,
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
    );
  }
}
