import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/primary_button.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class DeactiveConfirmView extends GetView<ProfileController> {
  const DeactiveConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: color25,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: 24,
          ),
          child: Column(
            children: [
              const Spacer(),
              Center(child: Image.asset(R.image.img_exit, height: 160, width: 190)),
              25.sbh,
              MyText(
                text: LocaleKeys.sorry_to_see_you_go.tr,
                fontSize: 24,
                // color: R.theme.color900,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.1,
              ),
              12.sbh,
              MyText(
                text: LocaleKeys.account_deactivated_info.tr,
                fontSize: 14,
                color: R.theme.color500,
                fontWeight: FontWeight.w400,
              ),
              const Spacer(flex: 2),
              PrimaryButton(
                text: LocaleKeys.exit.tr,
                onPressed: () {
                  Get.offAllNamed(Routes.AUTH);
                  // Get.to(() => const CodeVerifyView(), arguments: 'signin');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
