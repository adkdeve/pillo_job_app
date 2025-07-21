import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../app/core/resources/app_images.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcom_app/app/core/core.dart';

import '../../../../../common/widgets/check_box.dart';
import '../../../../../common/widgets/drop_down.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/range_slider.dart';
import '../../../auth/views/signin_view.dart';
import '../../profile/views/add_my_view_alert_view.dart';
import '../controllers/explore_controller.dart';

class FilterView extends GetView<ExploreController> {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    var locContoller = TextEditingController(text: 'St.Catherine, Jamaica');
    return Scaffold(
      // backgroundColor: R.theme.color100,
      appBar: AppBar(
        // backgroundColor: R.theme.color100,
        surfaceTintColor: R.theme.color100,
        leading: const Padding(
          padding: EdgeInsets.only(top: 8, left: 16, bottom: 8),
          child: MyBackBtn(),
        ),
        centerTitle: true,
        title: MyText(
          text: LocaleKeys.filter_and_create_alerts.tr,
          fontSize: 22,
          color: R.theme.primary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConfig.defaultPadding * 2,
                    vertical: AppConfig.defaultPadding * 1.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: LocaleKeys.category.tr,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      AppConfig.defaultPadding.sbh,
                      const DropdownWidget(),

                      // Container(
                      //   width: 1.sw,
                      //   height: 52,
                      //   padding: const EdgeInsets.symmetric(horizontal: AppConfig.defaultPadding),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(16),
                      //     border: Border.all(color: color200),
                      //   ),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       SvgPicture.asset(
                      //         ic_job,
                      //         color: green,
                      //       ),
                      //       12.sbw,
                      //       const Expanded(
                      //         child: MyText(
                      //           text: 'Sales & Marketing',
                      //           fontSize: 14,
                      //           textAlign: TextAlign.left,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //       SvgPicture.asset(
                      //         ic_arrow_down,
                      //         color: color500,
                      //         width: 16,
                      //         height: 16,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      AppConfig.defaultPadding.sbh,
                      MyText(
                        text: LocaleKeys.location.tr,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      AppConfig.defaultPadding.sbh,
                      Container(
                        width: 1.sw,
                        height: 52,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConfig.defaultPadding,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: R.theme.color200),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              R.image.ic_location,
                              color: R.theme.green,
                            ),
                            12.sbw,
                            Expanded(
                              child: TextField(
                                controller: locContoller,
                                // cursorColor: R.theme.primary,
                                maxLines: 1,
                                style: GoogleFonts.inter().copyWith(
                                  // color: R.theme.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                                decoration: const InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0),
                                  border: InputBorder.none,
                                ),
                                // text: 'St.Catherine, Jamaica',
                                // fontSize: 14,
                                // textAlign: TextAlign.left,
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      (AppConfig.defaultPadding * 2).sbh,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: LocaleKeys.min_salary.tr,
                            fontSize: 14,
                            opacity: 0.3,
                            // color: R.theme.color600,
                            fontWeight: FontWeight.w500,
                          ),
                          MyText(
                            text: LocaleKeys.max_salary.tr,
                            fontSize: 14,
                            opacity: 0.3,
                            // color: R.theme.color600,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const MyRangeSlider(),
                      (AppConfig.defaultPadding).sbh,
                      MyText(
                        text: LocaleKeys.job_type.tr,
                        fontSize: 16,
                        textAlign: TextAlign.left,
                        fontWeight: FontWeight.w700,
                      ),
                      (AppConfig.defaultPadding).sbh,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                JobTypeCheckBox(text: LocaleKeys.full_time.tr),
                                JobTypeCheckBox(text: LocaleKeys.part_time.tr),
                                JobTypeCheckBox(text: LocaleKeys.freelance.tr),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                JobTypeCheckBox(text: LocaleKeys.remote.tr),
                                JobTypeCheckBox(text: LocaleKeys.contract.tr),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      36.sbh,
                      PrimaryButton(
                        text: LocaleKeys.apply_filter.tr,
                        onPressed: () {
                          Get.back(result: true);
                        },
                      ),
                      // 8.sbh,
                      Center(
                        child: GestureDetector(
                          onTap: () => Get.to(() => const AddMyViewAlertView()),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: MyText(
                              text: LocaleKeys.create_alerts.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: R.theme.green,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      AppConfig.defaultPadding.sbh,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
