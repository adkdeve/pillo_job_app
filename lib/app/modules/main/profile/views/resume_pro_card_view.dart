import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pillo/app/modules/auth/views/signup_view.dart';
import 'package:pillo/app/modules/main/explore/views/job_details_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_extension.dart';
import 'package:pillo/app/utils/app_images.dart';
import 'package:pillo/components/my_text.dart';
import 'package:pillo/components/primary_button.dart';
import 'package:pillo/components/smooth_rectangle_border.dart';

import '../controllers/profile_controller.dart';

class ResumeProCardView extends GetView<ProfileController> {
  const ResumeProCardView({super.key});
  @override
  Widget build(BuildContext context) {
    var checkbox = true.obs;

    return Scaffold(
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
                    text: 'Resume Pro',
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn()
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    26.sbh,
                    Image.asset(
                      width: 1.sw,
                      img_card2,
                    ),
                    16.sbh,
                    const Textedit2(
                      title: 'Card Holder Name',
                      titleTextColor: color500,
                      borderRadius: 16,
                      text: 'Jane Doe',
                    ),
                    10.sbh,
                    const Textedit2(
                      title: 'Billing address',
                      titleTextColor: color500,
                      borderRadius: 16,
                      text: '25 New Works Street',
                    ),
                    10.sbh,
                    Row(
                      children: [
                        const Expanded(
                          child: Textedit2(
                            title: 'Apt / Ste',
                            titleTextColor: color500,
                            text: '2B',
                            borderRadius: 16,
                          ),
                        ),
                        13.sbw,
                        const Expanded(
                          child: Textedit2(
                            title: 'City',
                            titleTextColor: color500,
                            borderRadius: 16,
                            text: 'Linstead',
                          ),
                        ),
                      ],
                    ),
                    10.sbh,
                    const Textedit2(
                      title: 'State / Province',
                      titleTextColor: color500,
                      icon: ic_arrow_down,
                      borderRadius: 16,
                      text: 'St.Catherine',
                    ),
                    10.sbh,
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Textedit2(
                            title: 'Country',
                            titleTextColor: color500,
                            icon: ic_arrow_down,
                            borderRadius: 16,
                            text: 'Jamaica',
                          ),
                        ),
                        13.sbw,
                        const Expanded(
                          child: Textedit2(
                            title: 'Zip /Postal',
                            titleTextColor: color500,
                            text: '00000',
                            borderRadius: 16,
                          ),
                        ),
                      ],
                    ),
                    16.sbh,
                    const MyText(
                      text: 'Card Detail',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    16.sbh,
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: ShapeDecoration(
                        color: blackColor.withOpacity(0.04),
                        shape: const SmoothRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          // side: BorderSide(color: color200),
                        ),
                      ),
                      child: TextFormField(
                        cursorColor: primaryColor,
                        maxLines: 1,
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
                          hintText: 'Card number',
                          hintStyle: GoogleFonts.inter().copyWith(
                            color: blackColor.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                            ),
                            child: SvgPicture.asset(
                              ic_card,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    16.sbh,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: ShapeDecoration(
                              color: blackColor.withOpacity(0.04),
                              shape: const SmoothRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                // side: BorderSide(color: color200),
                              ),
                            ),
                            child: TextFormField(
                              cursorColor: primaryColor,
                              maxLines: 1,
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
                                hintText: 'Expiry date',
                                hintStyle: GoogleFonts.inter().copyWith(
                                  color: blackColor.withOpacity(.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        12.sbw,
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: ShapeDecoration(
                              color: blackColor.withOpacity(0.04),
                              shape: const SmoothRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                // side: BorderSide(color: color200),
                              ),
                            ),
                            child: TextFormField(
                              cursorColor: primaryColor,
                              maxLines: 1,
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
                                hintText: 'CVV',
                                hintStyle: GoogleFonts.inter().copyWith(
                                  color: blackColor.withOpacity(.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    16.sbh,
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: ShapeDecoration(
                        color: blackColor.withOpacity(0.04),
                        shape: const SmoothRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          // side: BorderSide(color: color200),
                        ),
                      ),
                      child: TextFormField(
                        cursorColor: primaryColor,
                        maxLines: 1,
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
                          hintText: 'Card holder',
                          hintStyle: GoogleFonts.inter().copyWith(
                            color: blackColor.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.3,
                          ),
                          // suffixIcon: Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //     horizontal: defaultPadding,
                          //   ),
                          //   child: SvgPicture.asset(
                          //     ic_card,
                          //   ),
                          // ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    24.sbh,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Checkbox(
                            side: const BorderSide(width: 1, color: color300),
                            value: checkbox.value,
                            fillColor:
                                WidgetStateProperty.resolveWith((states) {
                              if (states.contains(WidgetState.selected)) {
                                return const Color(0xffD0624C);
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
                        8.sbw,
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: MyText(
                              text:
                                  'I acknowledge this is a non-refundable consultation fee. ',
                              fontSize: 16,
                              textAlign: TextAlign.left,
                              color: Color(0xff23262D),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    33.sbh,
                    PrimaryButton(text: 'Pay Now', onPressed: () {}),
                    10.sbh,
                    const Center(
                      child: MyText(
                        text: 'Cancel',
                        fontSize: 16,
                        color: color500,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    20.sbh,
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
