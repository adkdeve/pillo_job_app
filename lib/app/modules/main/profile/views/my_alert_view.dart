import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/list_item.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/search_with_filter.dart';
import '../../explore/views/filter_view.dart';
import '../controllers/profile_controller.dart';
import 'my_view_alert_view.dart';

class MyAlertView extends GetView<ProfileController> {
  const MyAlertView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color25,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding,
            horizontal: AppConfig.defaultPadding * 1.5,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    MyBackBtn(),
                    Spacer(),
                    MyText(
                      text: LocaleKeys.alerts_title.tr,
                      fontSize: 22,
                      // color: R.theme.primary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.1,
                    ),
                    const Spacer(),
                    NotificationBtn(),
                  ],
                ),
                AppConfig.defaultPadding.sbh,
                SearchFilterInput(
                  hintText: LocaleKeys.search_alert.tr,
                  onFilterTap: () async {
                    var data = await Get.to(() => const FilterView());
                    if (data != null) {
                    }
                  },
                  onTextChanged: () {

                  },
                ),
                40.sbh,
                MyListItem(
                  title: 'Linstead Jobs',
                  subtitle: 'Marketing Positions',
                  date: 'Aug 10, 2024',
                  buttonText: 'View',
                  statusColor: const Color(0xff004EE4),
                  statusBgColor: const Color(0xff004EE4),
                  leadingIcon:  R.image.ic_notification2,
                  onTap: () {
                    Get.to(() => const MyViewAlertView());
                  },
                ),
                16.sbh,
                MyListItem(
                  title: 'Call Center Openings',
                  subtitle: 'Customer Support',
                  date: 'Aug 5, 2024',
                  buttonText: 'View',
                  statusColor: const Color(0xff004EE4),
                  statusBgColor: const Color(0xff004EE4),
                  leadingIcon: R.image.ic_notification2,
                  onTap: () {
                    Get.to(() => const MyViewAlertView());
                  },
                ),
                16.sbh,
                MyListItem(
                  title: 'Management Roles',
                  subtitle: 'Operations & Admin',
                  date: 'July 28, 2024',
                  buttonText: 'View',
                  statusColor: const Color(0xff004EE4),
                  statusBgColor: const Color(0xff004EE4),
                  leadingIcon: R.image.ic_notification2,
                  onTap: () {
                    Get.to(() => const MyViewAlertView());
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

