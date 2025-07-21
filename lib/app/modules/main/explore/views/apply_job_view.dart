import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../app/core/resources/app_images.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcom_app/app/core/core.dart';

import '../../../../../common/widgets/job_description_container.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../../../common/widgets/text_edit_field.dart';
import '../../profile/views/help_support_view.dart';
import '../../profile/views/privacy_policy_view.dart';
import '../../profile/views/term_of_use_view.dart';
import '../controllers/explore_controller.dart';
import 'application_submit_view.dart';
import 'job_details_view.dart';

class ApplyJobView extends GetView<ExploreController> {
  const ApplyJobView({super.key});

  @override
  Widget build(BuildContext context) {
    var checkbox = false.obs;
    return Scaffold(
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
                              text: LocaleKeys.apply.tr,
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
                      Row(
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
                                children: [
                                  customJobDescriptionContainer(
                                    context: context,
                                    text: LocaleKeys.part_time.tr,
                                    fontSize: 11,
                                    lightColor: R.theme.jobTags,
                                    darkColor: R.theme.jobTags,
                                    borderRadius: AppConfig.defaultPadding,
                                  ),
                                  (AppConfig.defaultPadding / 3).sbw,
                                  customJobDescriptionContainer(
                                    context: context,
                                    text: LocaleKeys.days_ago.tr,
                                    fontSize: 11,
                                    lightColor: R.theme.jobTags,
                                    darkColor: R.theme.jobTags,
                                    borderRadius: AppConfig.defaultPadding,
                                  ),
                                  (AppConfig.defaultPadding).sbw,
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
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textedit2(title: LocaleKeys.full_name.tr, require: true),
                    20.sbh,
                    Textedit2(title: LocaleKeys.phone_number.tr, require: true),
                    20.sbh,
                    Textedit2(
                      title: LocaleKeys.email_address.tr,
                      require: true,
                    ),
                    20.sbh,
                    Textedit2(title: LocaleKeys.street_address.tr),
                    20.sbh,
                    Textedit2(title: LocaleKeys.city.tr),
                    20.sbh,
                    Textedit2(title: LocaleKeys.state_province_parish.tr),
                    20.sbh,
                    Textedit2(title: LocaleKeys.country.tr),
                    20.sbh,
                    Text.rich(
                      maxLines: 3,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: LocaleKeys.upload_resume_cv.tr,
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.3,
                              // color: R.theme.black,
                            ),
                          ),
                          TextSpan(
                            text: '*',
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.3,
                              color: R.theme.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    15.sbh,
                    SvgPicture.asset(R.image.ic_upload_cv),
                    20.sbh,
                    Textedit2(
                      title: LocaleKeys.additional_comments.tr,
                      minLines: 5,
                      maxLines: 6,
                      hintText: 'Write something...',
                    ),
                    20.sbh,
                    Textedit2(
                      title: LocaleKeys.gender.tr,
                      require: true,
                      hintText: LocaleKeys.choose_one.tr,
                      icon: R.image.ic_arrow_down,
                    ),
                    20.sbh,
                    MyText(
                      text: LocaleKeys
                          .voluntary_self_identification_of_disability
                          .tr,
                      fontSize: 14,
                      color: R.theme.red,
                      fontWeight: FontWeight.w600,
                    ),
                    MyText(
                      text: LocaleKeys.self_identification_message.tr,
                      fontSize: 14,
                      textAlign: TextAlign.left,
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                    ),
                    20.sbh,
                    Textedit2(
                      title: 'Please choose one of the options below: ',
                      require: true,
                      hintText: LocaleKeys.choose_one.tr,
                      icon: R.image.ic_arrow_down,
                    ),
                    20.sbh,
                    Textedit2(
                      title: LocaleKeys.veteran.tr,
                      require: true,
                      hintText: LocaleKeys.choose_one.tr,
                      icon: R.image.ic_arrow_down,
                    ),
                    20.sbh,
                    Textedit2(
                      title: LocaleKeys.ethnicity.tr,
                      require: true,
                      hintText: LocaleKeys.choose_one.tr,
                      icon: R.image.ic_arrow_down,
                    ),
                    20.sbh,
                    Textedit2(
                      title: LocaleKeys.work_authorization.tr,
                      require: true,
                      hintText: LocaleKeys.choose_one.tr,
                      icon: R.image.ic_arrow_down,
                    ),
                    20.sbh,
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            side: BorderSide(width: 1, color: R.theme.color300),
                            value: checkbox.value,
                            fillColor: WidgetStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.contains(WidgetState.selected)) {
                                return R.theme.green;
                              } else {
                                return Colors.transparent;
                              }
                            }),
                            onChanged: (val) {
                              checkbox.value = !checkbox.value;
                            },
                            visualDensity: const VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text.rich(
                            maxLines: 3,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: LocaleKeys.checkbox_message.tr,
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                // TextSpan(
                                //   text: ' Pillo ',
                                //   style: GoogleFonts.inter().copyWith(
                                //     fontWeight: FontWeight.w600,
                                //     fontSize: 16,
                                //     letterSpacing: 0.3,
                                //     color: red,
                                //   ),
                                // ),
                                // TextSpan(
                                //   text: 'or their subsidiaries.',
                                //   style: GoogleFonts.inter().copyWith(
                                //     fontWeight: FontWeight.w600,
                                //     fontSize: 16,
                                //     letterSpacing: 0.3,
                                //     color: blackColor,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    35.sbh,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const PrivacyPolicyView());
                          },
                          child: MyText(
                            text: LocaleKeys
                                .privacy_policy
                                .tr,
                            fontSize: 14,
                            color: R.theme.red,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        24.sbw,
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const TermOfUseView());
                          },
                          child: MyText(
                            text: LocaleKeys
                                .terms_of_use
                                .tr,
                            fontSize: 14,
                            color: R.theme.red,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    35.sbh,
                    Center(
                      child: SizedBox(
                        width: .8.sw,
                        child: PrimaryButton(
                          text: LocaleKeys
                              .submit_application
                              .tr,
                          onPressed: () {
                            Get.to(() => const ApplicationSubmitView());
                          },
                        ),
                      ),
                    ),
                    32.sbh,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
