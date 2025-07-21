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
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../controllers/profile_controller.dart';

class HelpChatView extends GetView<ProfileController> {
  const HelpChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color25,
      body: Column(
        children: [
          Container(
            color: R.theme.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConfig.defaultPadding * 1.5,
                vertical: AppConfig.defaultPadding,
              ),
              child: Column(
                children: [
                  Get.mediaQuery.padding.top.sbh,
                  Row(
                    children: [
                      MyBackBtn(),
                      Spacer(),
                      MyText(
                        text: LocaleKeys.pillo_help.tr,
                        fontSize: 22,
                        color: R.theme.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                      Spacer(),
                      NotificationBtn(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 15,
                ),
                child: SizedBox(
                  width: 1.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(R.image.ic_bot),
                      16.sbh,
                      Container(
                        width: .7.sw,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: R.theme.color50,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Expanded(
                          child: MyText(
                            text:
                                'Hello! my name is Pilly before we start, what is your name?',
                            fontSize: 14,
                            height: 1.4,
                            color: R.theme.color900,
                            textAlign: TextAlign.left,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      24.sbh,
                      Align(
                        alignment: Alignment.centerRight,
                        child: IntrinsicWidth(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: R.theme.primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            child: Expanded(
                              child: MyText(
                                text: 'Jane Doe',
                                fontSize: 14,
                                height: 1.4,
                                color: R.theme.white,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      24.sbh,
                      Container(
                        width: .55.sw,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: R.theme.color50,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Expanded(
                          child: MyText(
                            text:
                                'Hello! Jane 👋.  How\nmay I help you today?  ',
                            fontSize: 14,
                            height: 1.4,
                            color: R.theme.color900,
                            textAlign: TextAlign.left,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      24.sbh,
                      Align(
                        alignment: Alignment.centerRight,
                        child: IntrinsicWidth(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: R.theme.primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            child: Expanded(
                              child: MyText(
                                text: 'Report a fraudulent\nJob Posting',
                                fontSize: 14,
                                height: 1.4,
                                color: R.theme.white,
                                textAlign: TextAlign.left,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  height: 56,
                  decoration: ShapeDecoration(
                    color: R.theme.color50,
                    shape: SmoothRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                  child: SvgPicture.asset(R.image.ic_link),
                ),
                12.sbw,
                Expanded(
                  child: Container(
                    height: 56,
                    padding: const EdgeInsets.all(2),
                    decoration: ShapeDecoration(
                      color: R.theme.color50,
                      shape: SmoothRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                    child: TextFormField(
                      cursorColor: R.theme.primary,
                      maxLines: 1,
                      minLines: 1,
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
                        hintText: LocaleKeys.type_here.tr,
                        hintStyle: GoogleFonts.inter().copyWith(
                          color: R.theme.color400,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.3,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(R.image.ic_send),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     left: AppConfig.defaultPadding,
                        //     right: AppConfig.defaultPadding / 2,
                        //   ),
                        //   child: SvgPicture.asset(
                        //     ic_send,
                        //   ),
                        // ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          20.sbh,
        ],
      ),
    );
  }
}
