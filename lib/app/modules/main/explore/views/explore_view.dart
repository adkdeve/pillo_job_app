import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/filter_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/explore_controller.dart';

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
    var filter = false.obs;
    RxList<String> tags = ['Remote', 'Portmore', 'Health Care'].obs;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: color100,
      appBar: AppBar(
        backgroundColor: color100,
        surfaceTintColor: color100,
        centerTitle: true,
        title: const MyText(
          text: 'Explore Jobs 🕵🏽‍️',
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
                    GestureDetector(
                        onTap: () async {
                          var data = await Get.to(() => const FilterView());
                          if (data != null) {
                            filter.value = true;
                          }
                        },
                        child: SvgPicture.asset(ic_filter)),
                  ],
                ),
              ),
            ),
          
            filter.value
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 23),
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
                  )
                : const Padding(
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
            filter.value
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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

class TagItem extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const TagItem({super.key, required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: green.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyText(
            text: label,
            fontSize: 12,
            color: green,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close_rounded,
              size: 20,
              color: red,
            ),
          ),
        ],
      ),
    );
  }
}
