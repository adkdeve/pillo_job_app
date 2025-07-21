import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../../../../../common/widgets/text_edit_field.dart';
import '../controllers/profile_controller.dart';

class AccountEditView extends GetView<ProfileController> {
  const AccountEditView({super.key});

  @override
  Widget build(BuildContext context) {
    var isSwitched = true.obs;
    var countryname = "Jamaica".obs;

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
                    text: LocaleKeys.edit_account.tr,
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
                      Textedit2(
                        title: LocaleKeys.first_name.tr,
                        titleTextColor: R.theme.color500,
                        text: 'Jane',
                      ),
                      24.sbh,
                      Textedit2(
                        title: LocaleKeys.last_name.tr,
                        titleTextColor: R.theme.color500,
                        text: 'Doe',
                      ),
                      24.sbh,
                      Textedit2(
                        title: LocaleKeys.date_of_birth.tr,
                        titleTextColor: R.theme.color500,
                        text: 'March 12, 1995',
                      ),
                      24.sbh,
                      Textedit2(
                        title: LocaleKeys.gender.tr,
                        icon: R.image.ic_arrow_down,
                        titleTextColor: R.theme.color500,
                        text: 'Female',
                      ),
                      24.sbh,
                      Textedit2(
                        title: LocaleKeys.phone_number.tr,
                        titleTextColor: R.theme.color500,
                        text: '1876 - 123 - 4567',
                      ),
                      24.sbh,
                      Textedit2(
                        title: LocaleKeys.email.tr,
                        titleTextColor: R.theme.color500,
                        text: 'janedoe@test.com',
                      ),
                      24.sbh,
                      Text.rich(
                        maxLines: 3,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: LocaleKeys.country.tr,
                              style: GoogleFonts.inter().copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                letterSpacing: 0.3,
                                // color: R.theme.color500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      15.sbh,
                      Container(
                        width: 1.sw,
                        decoration: ShapeDecoration(
                          shape: SmoothRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            side: BorderSide(color: R.theme.color200),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: false,
                              showSearch: false,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  color: R.theme.black,
                                ),
                                bottomSheetHeight: 500,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              onSelect: (Country country) {
                                countryname.value = country.name;
                                print('Select country: ${country.name}');
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(
                              AppConfig.defaultPadding,
                            ),
                            child: Row(
                              children: [
                                // SvgPicture.asset(ic_location),
                                // (AppConfig.defaultPadding / 1.5).sbw,
                                Obx(
                                  () => MyText(
                                    text: countryname.value.isEmpty
                                        ? ''
                                        : countryname.value,
                                    // color: R.theme.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const Textedit2(
                      //   title: 'Country',
                      //   titleTextColor: color500,
                      //   text: 'Jamaica',
                      // ),
                      42.sbh,
                      PrimaryButton(text: LocaleKeys.save.tr, onPressed: () {}),
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
