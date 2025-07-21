import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../common/widgets/list_item.dart';
import '../../../../../common/widgets/my_back_btn.dart';
import '../../../../../common/widgets/my_text.dart';
import '../../../../../common/widgets/notification_button.dart';
import '../../../../../common/widgets/search_with_filter.dart';
import '../../../../../common/widgets/smooth_rectangle_border.dart';
import '../controllers/profile_controller.dart';
import 'my_order_receipt_view.dart';

class MyOrderView extends GetView<ProfileController> {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: R.theme.color100,
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
                    text: LocaleKeys.my_orders.tr,
                    fontSize: 22,
                    // color: R.theme.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.1,
                  ),
                  Spacer(),
                  NotificationBtn(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.sbh,
                  SearchFilterInput(
                    hintText: LocaleKeys.search_transaction.tr,
                    onFilterTap: () async {
                    },
                    onTextChanged: () {

                    },
                  ),
                  28.sbh,
                  MyListItem(
                    title: 'ResumePro',
                    subtitle: 'Service - Transaction ID: PIL25631',
                    date: 'Aug 10, 2024',
                    buttonText: '\$35.00',
                    status: 'In Progress',
                    leadingIcon: R.image.ic_orderr,
                    statusColor: const Color(0xff004EE4),
                    statusBgColor: const Color(0xff004EE4),
                    onTap: () {
                      Get.to(() => const MyOrderReceiptView());
                    },
                  ),
                  10.sbh,
                  MyListItem(
                    title: 'ResumePro',
                    subtitle: 'Service - Transaction ID: PIL25631',
                    date: 'Aug 10, 2024',
                    buttonText: '\$35.00',
                    status: 'Cancelled',
                    leadingIcon: R.image.ic_orderr,
                    statusColor: const Color(0xffD0624C),
                    statusBgColor: const Color(0xffD0624C),
                    onTap: () {
                      Get.to(() => const MyOrderReceiptView());
                    },
                  ),
                  10.sbh,
                  MyListItem(
                    title: 'ResumePro',
                    subtitle: 'Service - Transaction ID: PIL25631',
                    date: 'Aug 10, 2024',
                    buttonText: '\$35.00',
                    status: 'Completed',
                    leadingIcon: R.image.ic_orderr,
                    statusColor: const Color(0xff0A6375),
                    statusBgColor: const Color(0xff0A6375),
                    onTap: () {
                      Get.to(() => const MyOrderReceiptView());
                    },
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
