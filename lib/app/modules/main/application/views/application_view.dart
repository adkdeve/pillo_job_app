import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';
import 'package:pinput/pinput.dart';

import '../controllers/application_controller.dart';

class ApplicationView extends GetView<ApplicationController> {
  const ApplicationView({super.key});
    @override
    Widget build(BuildContext context) {
      var selectedIndex = 0.obs;
      var noData = false.obs;
      var category = [
        'All Status',
        'Applied',
        'Reviewed',
        'Interview',
        'Offer',
        'Denied',
      ];

      final List<Job> jobs = [
        Job(
          title: 'Product Designer',
          location: 'Kingston, St. Andrew',
          type: 'Full-Time',
          jobType: 'Remote',
          posted: '2d ago',
          applications: 1,
          img: ic_product_designer, // Image asset path
        ),
        Job(
          title: 'Software Engineer',
          location: 'New York, NY',
          type: 'Part-Time',
          jobType: 'On-site',
          posted: '3d ago',
          applications: 2,
          img: ic_amazon,
        ),
        Job(
          title: 'UX/UI Designer',
          location: 'San Francisco, CA',
          type: 'Full-Time',
          jobType: 'Hybrid',
          posted: 'Today',
          applications: 3,
          img: ic_netflix,
        ),
        Job(
          title: 'Product Designer',
          location: 'Kingston, St. Andrew',
          type: 'Full-Time',
          jobType: 'Remote',
          posted: '2d ago',
          applications: 4,
          img: ic_product_designer, // Image asset path
        ),
        Job(
          title: 'Software Engineer',
          location: 'New York, NY',
          type: 'Part-Time',
          jobType: 'On-site',
          posted: '3d ago',
          applications: 5,
          img: ic_amazon,
        ),
      ];

      return Scaffold(
        backgroundColor: color100,
        appBar: AppBar(
          backgroundColor: color100,
          surfaceTintColor: color100,
          centerTitle: true,
          title: const MyText(
            text: 'Applications 📋‍️',
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
                            ic_no_job,
                            height: 150,
                          ),
                          30.sbh,
                          const MyText(
                            text: 'You haven’t applied for  any jobs️',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          8.sbh,
                          const MyText(
                            text:
                                'Once you start applying for\njobs, they will appear here‍️',
                            fontSize: 14,
                            height: 1.5,
                            color: color500,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.1,
                          ),
                          defaultPadding.sbh,
                          PrimaryButton(
                            small: true,
                            text: 'Apply Now',
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
                                itemCount: jobs.length,
                                itemBuilder: (c, i) {
                                  var data = jobs[i];
                                  var process = category[data.applications];

                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 8),
                                    // width: 100,
                                    padding: const EdgeInsets.all(defaultPadding),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius:
                                          BorderRadius.circular(defaultPadding),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: ShapeDecoration(
                                                color: color100,
                                                shape: SmoothRectangleBorder(
                                                  smoothness: 1,
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                MyText(
                                                  text: data.location,
                                                  fontSize: 14,
                                                  height: 2,
                                                  color: const Color(0xff0A6375),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            ProcessText(
                                              text: process,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 5),
                                              decoration: ShapeDecoration(
                                                color: color100,
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
                                                  text: data.type,
                                                  fontSize: 11,
                                                  color:
                                                      blackColor.withOpacity(.7),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            (defaultPadding / 2).sbw,
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 5),
                                              decoration: ShapeDecoration(
                                                color: color100,
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
                                                  text: data.jobType,
                                                  fontSize: 11,
                                                  color:
                                                      blackColor.withOpacity(.7),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            (defaultPadding / 2).sbw,
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 5),
                                              decoration: ShapeDecoration(
                                                color: color100,
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
                                                  text: data.posted,
                                                  fontSize: 11,
                                                  color:
                                                      blackColor.withOpacity(.7),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText(
                                                  text: 'Applied on',
                                                  fontSize: 13,
                                                  color:
                                                      blackColor.withOpacity(.7),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                4.sbh,
                                                const MyText(
                                                  text: 'Jan 10,2024',
                                                  fontSize: 12,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        defaultPadding.sbh,
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              // horizontal: 14,
                                              vertical: 10),
                                          decoration: ShapeDecoration(
                                            color: color100,
                                            shape: SmoothRectangleBorder(
                                              smoothness: 1,
                                              borderRadius: BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: List.generate(4, (index) {
                                                return Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    MyText(
                                                      text: category[index + 1],
                                                      fontSize: 14,
                                                      color: (data.applications >=
                                                              index + 1)
                                                          ? textColor
                                                          : const Color(
                                                              0xff8E9AA7),
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                    4.sbw,
                                                    Visibility(
                                                      visible: index != 3,
                                                      child: Icon(
                                                        size: 16,
                                                        color:
                                                            (data.applications >=
                                                                    index + 1)
                                                                ? textColor
                                                                : const Color(
                                                                    0xff8E9AA7),
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                      ),
                                                    )
                                                  ],
                                                );
                                              })),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      );
    }
  }

class ProcessText extends StatelessWidget {
  const ProcessText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xff0A6375);

    if (text == 'Applied') {
      color = const Color(0xff0A6375);
    } else if (text == 'Reviewed') {
      color = const Color(0xff7339F5);
    } else if (text == 'Interview') {
      color = const Color(0xff004EE4);
    } else if (text == 'Denied') {
      color = const Color(0xffD0624C);
    } else if (text == 'Offer') {
      color = const Color(0xff34A853);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: ShapeDecoration(
        color: color.withOpacity(.1),
        shape: SmoothRectangleBorder(
          smoothness: 1,
          borderRadius: BorderRadius.circular(
            defaultPadding,
          ),
        ),
      ),
      child: Center(
        child: MyText(
          text: text,
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
