import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/core/core.dart';
import '../../app/routes/app_pages.dart';

class NotificationBtn extends StatelessWidget {
  const NotificationBtn({super.key, this.light});

  final bool? light;  // Optional boolean parameter

  @override
  Widget build(BuildContext context) {
    // If `light` is provided, use it; otherwise, fallback to Get.isDarkMode
    bool isDarkMode = light ?? Get.isDarkMode;

    return IconButton(
      onPressed: () {
        Get.toNamed(Routes.NOTIFICATION);
      },
      icon: SvgPicture.asset(
        isDarkMode ? R.image.ic_notification : R.image.ic_notification_dark,
        key: ValueKey(isDarkMode ? 'dark' : 'light'),
      ),
    );
  }
}