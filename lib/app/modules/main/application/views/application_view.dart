import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pcom_app/app/core/core.dart';
import 'package:pinput/pinput.dart';

import '../../../../../common/widgets/job_description_container.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../../data/models/job_model.dart';
import '../../home/views/home_view.dart';
import '../controllers/application_controller.dart';

class ApplicationView extends GetView<ApplicationController> {
  const ApplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0.obs;
    var noData = false.obs;
    var category = [
      LocaleKeys.full_time.tr,
      LocaleKeys.part_time.tr,
      LocaleKeys.remote.tr,
      LocaleKeys.contract.tr,
    ];

    final List<Job> jobs = [
      Job(
        title: 'Product Designer',
        location: 'Kingston, St. Andrew',
        type: 'Full-Time',
        jobType: 'Remote',
        posted: '2d ago',
        applications: 1,
        img: R.image.ic_product_designer, // Image asset path
      ),
      Job(
        title: 'Software Engineer',
        location: 'New York, NY',
        type: 'Part-Time',
        jobType: 'On-site',
        posted: '3d ago',
        applications: 1,
        img: R.image.ic_amazon,
      ),
      Job(
        title: 'UX/UI Designer',
        location: 'San Francisco, CA',
        type: 'Full-Time',
        jobType: 'Hybrid',
        posted: 'Today',
        applications: 1,
        img: R.image.ic_netflix,
      ),
      Job(
        title: 'Product Designer',
        location: 'Kingston, St. Andrew',
        type: 'Full-Time',
        jobType: 'Remote',
        posted: '2d ago',
        applications: 1,
        img: R.image.ic_product_designer, // Image asset path
      ),
      Job(
        title: 'Software Engineer',
        location: 'New York, NY',
        type: 'Part-Time',
        jobType: 'On-site',
        posted: '3d ago',
        applications: 1,
        img: R.image.ic_amazon,
      ),
    ];

    return Scaffold(
      // backgroundColor: R.theme.color100,
      appBar: AppBar(
        // backgroundColor: R.theme.color100,
        // surfaceTintColor: R.theme.color100,
        centerTitle: true,
        title: MyText(
          text: LocaleKeys.applications.tr,
          fontSize: 22,
          // color: R.theme.primary,
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
                        SvgPicture.asset(R.image.ic_no_job, height: 150),
                        30.sbh,
                        MyText(
                          text: LocaleKeys.no_data.tr,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        8.sbh,
                        MyText(
                          text: LocaleKeys.no_data_subtitle.tr,
                          fontSize: 14,
                          height: 1.5,
                          opacity: 0.5,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.1,
                        ),
                        AppConfig.defaultPadding.sbh,
                        PrimaryButton(
                          small: true,
                          text: LocaleKeys.apply_now.tr,
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
                              const Spacer(),
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
                            itemCount: jobs.length,
                            itemBuilder: (c, i) {
                              var data = jobs[i];
                              var process = category[data.applications];

                              return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                // width: 100,
                                padding: const EdgeInsets.all(
                                  AppConfig.defaultPadding,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppThemeData
                                            .lightBoxDecorationColor // Use light theme decoration color
                                      : AppThemeData
                                            .darkBoxDecorationColor, // Use dark theme decoration color
                                  borderRadius: BorderRadius.circular(
                                    AppConfig.defaultPadding,
                                  ),
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
                                            color: R.theme.color100,
                                            shape: SmoothRectangleBorder(
                                              smoothness: 1,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                    AppConfig.defaultPadding,
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
                                        ProcessText(text: process),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        customJobDescriptionContainer(
                                          context: context,
                                          text: data.type,
                                          fontSize: 11,
                                          lightColor: R
                                              .theme
                                              .white, // Light theme decoration color
                                          darkColor: R
                                              .theme
                                              .color600, // Dark theme decoration color
                                          borderRadius:
                                              AppConfig.defaultPadding,
                                        ),
                                        (AppConfig.defaultPadding / 2).sbw,
                                        customJobDescriptionContainer(
                                          context: context,
                                          text: data.jobType,
                                          fontSize: 11,
                                          lightColor: R
                                              .theme
                                              .white, // Light theme decoration color
                                          darkColor: R
                                              .theme
                                              .color600, // Dark theme decoration color
                                          borderRadius:
                                              AppConfig.defaultPadding,
                                        ),
                                        (AppConfig.defaultPadding / 2).sbw,
                                        customJobDescriptionContainer(
                                          context: context,
                                          text: data.posted,
                                          fontSize: 11,
                                          lightColor: R
                                              .theme
                                              .white, // Light theme decoration color
                                          darkColor: R
                                              .theme
                                              .color600, // Dark theme decoration color
                                          borderRadius:
                                              AppConfig.defaultPadding,
                                        ),

                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText(
                                              text: 'Applied on',
                                              fontSize: 13,
                                              opacity: 0.7,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            4.sbh,
                                            MyText(
                                              text: 'Jan 10,2024',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // defaultPadding.sbh,
                                    // Container(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       // horizontal: 14,
                                    //       vertical: 10),
                                    //   decoration: ShapeDecoration(
                                    //     color: color100,
                                    //     shape: SmoothRectangleBorder(
                                    //       smoothness: 1,
                                    //       borderRadius: BorderRadius.circular(
                                    //         10,
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   child: Row(
                                    //       mainAxisAlignment:
                                    //           MainAxisAlignment.spaceEvenly,
                                    //       children: List.generate(4, (index) {
                                    //         return Row(
                                    //           // mainAxisAlignment:
                                    //           //     MainAxisAlignment.spaceEvenly,
                                    //           children: [
                                    //             MyText(
                                    //               text: category[index],
                                    //               fontSize: 14,
                                    //               color: (data.applications >=
                                    //                       index + 1)
                                    //                   ? textColor
                                    //                   : const Color(
                                    //                       0xff8E9AA7),
                                    //               fontWeight: FontWeight.w500,
                                    //             ),
                                    //             4.sbw,
                                    //             Visibility(
                                    //               visible: index != 3,
                                    //               child: Icon(
                                    //                 size: 16,
                                    //                 color:
                                    //                     (data.applications >=
                                    //                             index + 1)
                                    //                         ? textColor
                                    //                         : const Color(
                                    //                             0xff8E9AA7),
                                    //                 Icons
                                    //                     .arrow_forward_ios_rounded,
                                    //               ),
                                    //             )
                                    //           ],
                                    //         );
                                    //       })),
                                    // ),
                                  ],
                                ),
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

class ProcessText extends StatelessWidget {
  const ProcessText({super.key, required this.text});

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
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Center(
        child: MyText(
          text: 'APPLIED',
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
