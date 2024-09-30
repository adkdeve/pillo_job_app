import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/main/application/views/application_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/heart_controller.dart';

class HeartView extends GetView<HeartController> {
  const HeartView({super.key});
  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0.obs;
    var noData = false.obs;
    var category = [
      'All Jobs',
      'Remote',
      'Full Time',
      'Part Time',
      'Freelance',
      'Contract',
    ];

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

    return Scaffold(
      backgroundColor: color100,
      appBar: AppBar(
        backgroundColor: color100,
        surfaceTintColor: color100,
        centerTitle: true,
        title: const MyText(
          text: 'My Favorites 🫶',
          fontSize: 22,
          color: primaryColor,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
        actions: const [NotificationBtn()],
      ),
      body: Obx(
        () => Column(
          children: [
            defaultPadding.sbh,
            Padding(
              padding: const EdgeInsets.only(left: defaultPadding),
              child: SizedBox(
                height: 36,
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
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: ShapeDecoration(
                                color: isSelected ? green : null,
                                shape: SmoothRectangleBorder(
                                  smoothness: 1,
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  side: BorderSide(
                                    color: isSelected ? green : color200,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: MyText(
                                  text: category[i],
                                  fontSize: 14,
                                  color: isSelected ? whiteColor : color400,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ),
            noData.value
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ic_no_save,
                          height: 200,
                        ),
                        30.sbh,
                        const MyText(
                          text: 'You haven’t saved any jobs',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        8.sbh,
                        const MyText(
                          text: 'Once you saving jobs, they will appear here',
                          fontSize: 14,
                          height: 1.5,
                          color: color500,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.1,
                        ),
                        defaultPadding.sbh,
                        PrimaryButton(
                          small: true,
                          text: 'Explore Jobs',
                          width: .5,
                          fontSize: 16,
                          onPressed: () {
                            noData.value = false;
                          },
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 21, vertical: 23),
                          child: Row(
                            children: [
                              const MyText(
                                text: 'Total',
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
      ),
    );
  }
}
