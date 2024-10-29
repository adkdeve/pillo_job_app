import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/application_submit_view.dart';
import 'package:pillo/app/modules/main/explore/views/explore_view.dart';
import 'package:pillo/app/modules/main/explore/views/filter_view.dart';
import 'package:pillo/app/modules/main/explore/views/job_details_view.dart';
import 'package:pillo/app/modules/main/explore/views/review_submit_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/modules/main/profile/views/help_support_view.dart';
import 'package:pillo/app/modules/main/profile/views/privacy_policy_view.dart';
import 'package:pillo/app/modules/main/profile/views/term_of_use_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/explore_controller.dart';

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
                              text: 'Apply 📑️',
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: ShapeDecoration(
                                      color: jobTags,
                                      shape: SmoothRectangleBorder(
                                        smoothness: 1,
                                        borderRadius: BorderRadius.circular(
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
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: ShapeDecoration(
                                      color: jobTags,
                                      shape: SmoothRectangleBorder(
                                        smoothness: 1,
                                        borderRadius: BorderRadius.circular(
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Textedit2(
                      title: 'Full Name ',
                      require: true,
                    ),
                    20.sbh,
                    const Textedit2(
                      title: 'Phone Number ',
                      require: true,
                    ),
                    20.sbh,
                    const Textedit2(
                      title: 'Email Address ',
                      require: true,
                    ),
                    20.sbh,
                    const Textedit2(
                      title: 'Street Address',
                    ),
                    20.sbh,
                    const Textedit2(
                      title: 'City',
                    ),
                    20.sbh,
                    const Textedit2(
                      title: 'State, Province or Parish',
                    ),
                    20.sbh,
                    const Textedit2(
                      title: 'Country',
                    ),
                    20.sbh,
                    Text.rich(
                      maxLines: 3,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Upload Resume & CV',
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.3,
                              color: blackColor,
                            ),
                          ),
                          TextSpan(
                            text: '*',
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.3,
                              color: red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    15.sbh,
                    SvgPicture.asset(ic_upload_cv),
                    20.sbh,
                    const Textedit2(
                      title: 'Additional Comments',
                      minLines: 5,
                      maxLines: 6,
                      hintText: 'Write something...',
                    ),
                    20.sbh,
                    const Textedit2(
                      title: 'What is your Gender? ',
                      require: true,
                      hintTextColor: blackColor,
                      hintText: 'Choose One',
                      icon: ic_arrow_down,
                    ),
                    20.sbh,
                    const MyText(
                      text: 'Voluntary Self Identification of Disability',
                      fontSize: 14,
                      color: red,
                      fontWeight: FontWeight.w600,
                    ),
                    const MyText(
                      text:
                          'We ask all candidate to provide the information below. Submission of this information is voluntary and refusal to provide it will not affect your application. This information is kept confidential. ',
                      fontSize: 14,
                      textAlign: TextAlign.left,
                      height: 1.4,
                      fontWeight: FontWeight.w600,
                    ),
                    20.sbh,
                    const Textedit2(
                      title: 'Please choose one of the options below: ',
                      require: true,
                      hintTextColor: blackColor,
                      hintText: 'Choose One',
                      icon: ic_arrow_down,
                    ),
                    20.sbh,
                    const Textedit2(
                      title: 'Are you a Veteran? ',
                      require: true,
                      hintTextColor: blackColor,
                      hintText: 'Choose One',
                      icon: ic_arrow_down,
                    ),
                    20.sbh,
                    const Textedit2(
                      title:
                          'Please choose the ethnicity which most accurately describe how you identify ',
                      require: true,
                      hintTextColor: blackColor,
                      hintText: 'Choose One',
                      icon: ic_arrow_down,
                    ),
                    20.sbh,
                    const Textedit2(
                      title:
                          'Are you legally authorized to work for any employer in the Jamaica without any restrictions? ',
                      require: true,
                      hintTextColor: blackColor,
                      hintText: 'Choose One',
                      icon: ic_arrow_down,
                    ),
                    20.sbh,
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            side: const BorderSide(width: 1, color: color300),
                            value: checkbox.value,
                            fillColor:
                                WidgetStateProperty.resolveWith((states) {
                              if (states.contains(WidgetState.selected)) {
                                return green;
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
                                  text:
                                      'My data can be used for recruitment process by Pillo and their partners. ',
                                  style: GoogleFonts.inter().copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    letterSpacing: 0.3,
                                    color: blackColor,
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
                          child: const MyText(
                            text: 'Privacy Policy',
                            fontSize: 14,
                            color: red,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        24.sbw,
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const TermOfUseView());
                          },
                          child: const MyText(
                            text: 'Terms of Use',
                            fontSize: 14,
                            color: red,
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
                            text: 'Submit Application',
                            onPressed: () {
                              Get.to(() => const ApplicationSubmitView());
                            }),
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
