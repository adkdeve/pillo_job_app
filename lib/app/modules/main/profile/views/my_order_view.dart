import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/filter_view.dart';
import 'package:pillo/app/modules/main/explore/views/job_details_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/modules/main/profile/views/my_order_receipt_view.dart';
import 'package:pillo/app/modules/main/profile/views/resume_pro_card_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class MyOrderView extends GetView<ProfileController> {
  const MyOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color100,
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            horizontal: defaultPadding * 1.5,
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  MyBackBtn(),
                  Spacer(),
                  MyText(
                    text: 'My Orders',
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn()
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.sbh,
                  Container(
                    margin: const EdgeInsets.all(defaultPadding / 2),
                    width: 1.sw,
                    height: 52,
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
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
                              hintText: 'Search transaction',
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
                              // var data = await Get.to(() => const FilterView());
                              // if (data != null) {
                              //   filter.value = true;
                              // }
                            },
                            child: SvgPicture.asset(ic_filter)),
                      ],
                    ),
                  ),
                  28.sbh,
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const MyOrderReceiptView());
                    },
                    child: Container(
                      width: 1.sw,
                      padding: const EdgeInsets.only(
                        top: 13,
                        right: 24,
                        left: 18,
                        bottom: 18,
                      ),
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              6.sbw,
                              const MyText(
                                text: 'Aug 10, 2024',
                                fontSize: 12,
                                color: Color(0xff747A80),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1,
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: ShapeDecoration(
                                  color:
                                      const Color(0xff004EE4).withOpacity(.1),
                                  shape: SmoothRectangleBorder(
                                    smoothness: 1,
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                  ),
                                ),
                                child: const Center(
                                  child: MyText(
                                    text: 'In Progress',
                                    fontSize: 12,
                                    color: Color(0xff004EE4),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                          11.sbh,
                          SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xffF9FAFB),
                                    shape: SmoothRectangleBorder(
                                      smoothness: 1,
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      ic_cash,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                                16.sbw,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'ResumePro',
                                            fontSize: 14,
                                            color: blackColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          // Spacer(),
                                          MyText(
                                            text: '\$35.00',
                                            fontSize: 14,
                                            color: Color(0xff0A6375),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                      6.sbh,
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'Service',
                                            fontSize: 12,
                                            color: Color(0xff747A80),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          MyText(
                                            text: 'Transaction ID: PIL25631',
                                            fontSize: 12,
                                            color: Color(0xff747A80),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  10.sbh,
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const MyOrderReceiptView());
                    },
                    child: Container(
                      width: 1.sw,
                      padding: const EdgeInsets.only(
                        top: 13,
                        right: 24,
                        left: 18,
                        bottom: 18,
                      ),
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              6.sbw,
                              const MyText(
                                text: 'Aug 10, 2024',
                                fontSize: 12,
                                color: Color(0xff747A80),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1,
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: ShapeDecoration(
                                  color:
                                      const Color(0xffD0624C).withOpacity(.1),
                                  shape: SmoothRectangleBorder(
                                    smoothness: 1,
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                  ),
                                ),
                                child: const Center(
                                  child: MyText(
                                    text: 'Cancel',
                                    fontSize: 12,
                                    color: Color(0xffD0624C),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                          11.sbh,
                          SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xffF9FAFB),
                                    shape: SmoothRectangleBorder(
                                      smoothness: 1,
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      ic_cash,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                                16.sbw,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'ResumePro',
                                            fontSize: 14,
                                            color: blackColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          // Spacer(),
                                          MyText(
                                            text: '\$35.00',
                                            fontSize: 14,
                                            color: Color(0xff0A6375),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                      6.sbh,
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'Service',
                                            fontSize: 12,
                                            color: Color(0xff747A80),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          MyText(
                                            text: 'Transaction ID: PIL25631',
                                            fontSize: 12,
                                            color: Color(0xff747A80),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  10.sbh,
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const MyOrderReceiptView());
                    },
                    child: Container(
                      width: 1.sw,
                      padding: const EdgeInsets.only(
                        top: 13,
                        right: 24,
                        left: 18,
                        bottom: 18,
                      ),
                      decoration: const BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              6.sbw,
                              const MyText(
                                text: 'Aug 10, 2024',
                                fontSize: 12,
                                color: Color(0xff747A80),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.1,
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: ShapeDecoration(
                                  color:
                                      const Color(0xff0A6375).withOpacity(.1),
                                  shape: SmoothRectangleBorder(
                                    smoothness: 1,
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ),
                                  ),
                                ),
                                child: const Center(
                                  child: MyText(
                                    text: 'Completed',
                                    fontSize: 12,
                                    color: Color(0xff0A6375),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                          11.sbh,
                          SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xffF9FAFB),
                                    shape: SmoothRectangleBorder(
                                      smoothness: 1,
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      ic_cash,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                                16.sbw,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'ResumePro',
                                            fontSize: 14,
                                            color: blackColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          // Spacer(),
                                          MyText(
                                            text: '\$35.00',
                                            fontSize: 14,
                                            color: Color(0xff0A6375),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ],
                                      ),
                                      6.sbh,
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            text: 'Service',
                                            fontSize: 12,
                                            color: Color(0xff747A80),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          MyText(
                                            text: 'Transaction ID: PIL25631',
                                            fontSize: 12,
                                            color: Color(0xff747A80),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
