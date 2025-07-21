import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../../../common/widgets/text_edit_field.dart';
import '../controllers/profile_controller.dart';

class ResumeProCardView extends GetView<ProfileController> {
  const ResumeProCardView({super.key});
  @override
  Widget build(BuildContext context) {
    var checkbox = true.obs;
    bool isDarkMode = Get.isDarkMode;

    return Scaffold(
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  MyBackBtn(),
                  Spacer(),
                  MyText(
                    text: LocaleKeys.resume_pro_title.tr,
                    fontSize: 22,
                    // color: R.theme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn(),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      26.sbh,
                      Image.asset(width: 1.sw, R.image.img_card2),
                      16.sbh,
                      Textedit2(
                        title: LocaleKeys.card_holder_name.tr,
                        titleTextColor: R.theme.color500,
                        borderRadius: 16,
                        text: 'Jane Doe',
                      ),
                      10.sbh,
                      Textedit2(
                        title: LocaleKeys.billing_address.tr,
                        titleTextColor: R.theme.color500,
                        borderRadius: 16,
                        text: '25 New Works Street',
                      ),
                      10.sbh,
                      Row(
                        children: [
                          Expanded(
                            child: Textedit2(
                              title: LocaleKeys.apt_ste.tr,
                              titleTextColor: R.theme.color500,
                              text: '2B',
                              borderRadius: 16,
                            ),
                          ),
                          13.sbw,
                          Expanded(
                            child: Textedit2(
                              title: LocaleKeys.city.tr,
                              titleTextColor: R.theme.color500,
                              borderRadius: 16,
                              text: 'Linstead',
                            ),
                          ),
                        ],
                      ),
                      10.sbh,
                      Textedit2(
                        title: LocaleKeys.state_province.tr,
                        titleTextColor: R.theme.color500,
                        icon: R.image.ic_arrow_down,
                        borderRadius: 16,
                        text: 'St.Catherine',
                      ),
                      10.sbh,
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Textedit2(
                              title: LocaleKeys.country.tr,
                              titleTextColor: R.theme.color500,
                              icon: R.image.ic_arrow_down,
                              borderRadius: 16,
                              text: 'Jamaica',
                            ),
                          ),
                          13.sbw,
                          Expanded(
                            child: Textedit2(
                              title: LocaleKeys.zip_postal.tr,
                              titleTextColor: R.theme.color500,
                              text: '00000',
                              borderRadius: 16,
                            ),
                          ),
                        ],
                      ),
                      16.sbh,
                      MyText(
                        text: LocaleKeys.card_detail.tr,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      16.sbh,
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: ShapeDecoration(
                          color: isDarkMode ? R.theme.white.withOpacity(0.08) : R.theme.black.withOpacity(0.04),
                          shape: const SmoothRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            // side: BorderSide(color: color200),
                          ),
                        ),
                        child: TextFormField(
                          cursorColor: R.theme.primary,
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
                              horizontal: AppConfig.defaultPadding,
                              vertical: 12,
                            ),
                            hintText: LocaleKeys.card_number.tr,
                            hintStyle: GoogleFonts.inter().copyWith(
                              // color: R.theme.black.withOpacity(.8),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.3,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConfig.defaultPadding,
                              ),
                              child: SvgPicture.asset(R.image.ic_card),
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
                                color: isDarkMode ? R.theme.white.withOpacity(0.08) : R.theme.black.withOpacity(0.04),
                                shape: const SmoothRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  // side: BorderSide(color: color200),
                                ),
                              ),
                              child: TextFormField(
                                cursorColor: R.theme.primary,
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
                                    horizontal: AppConfig.defaultPadding,
                                    vertical: 12,
                                  ),
                                  hintText: LocaleKeys.expiry_date.tr,
                                  hintStyle: GoogleFonts.inter().copyWith(
                                    // color: R.theme.black.withOpacity(.8),
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
                                color: isDarkMode ? R.theme.white.withOpacity(0.08) : R.theme.black.withOpacity(0.04),
                                shape: const SmoothRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  // side: BorderSide(color: color200),
                                ),
                              ),
                              child: TextFormField(
                                cursorColor: R.theme.primary,
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
                                    horizontal: AppConfig.defaultPadding,
                                    vertical: 12,
                                  ),
                                  hintText: LocaleKeys.cvv.tr,
                                  hintStyle: GoogleFonts.inter().copyWith(
                                    // color: R.theme.black.withOpacity(.8),
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
                          color: isDarkMode ? R.theme.white.withOpacity(0.08) : R.theme.black.withOpacity(0.04),
                          shape: const SmoothRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            // side: BorderSide(color: color200),
                          ),
                        ),
                        child: TextFormField(
                          cursorColor: R.theme.primary,
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
                              horizontal: AppConfig.defaultPadding,
                              vertical: 12,
                            ),
                            hintText: LocaleKeys.card_holder.tr,
                            hintStyle: GoogleFonts.inter().copyWith(
                              // color: R.theme.black.withOpacity(.8),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.3,
                            ),
                            // suffixIcon: Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //     horizontal: AppConfig.defaultPadding,
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
                              side: BorderSide(
                                width: 1,
                                color: R.theme.color300,
                              ),
                              value: checkbox.value,
                              fillColor: WidgetStateProperty.resolveWith((
                                states,
                              ) {
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
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: MyText(
                                text: LocaleKeys.acknowledge_text.tr,
                                fontSize: 16,
                                textAlign: TextAlign.left,
                                opacity: 0.2,
                                // color: Color(0xff23262D),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      33.sbh,
                      PrimaryButton(text: LocaleKeys.pay_now.tr, onPressed: () {}),
                      10.sbh,
                      Center(
                        child: MyText(
                          text: LocaleKeys.cancel.tr,
                          fontSize: 16,
                          color: R.theme.color500,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      20.sbh,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
