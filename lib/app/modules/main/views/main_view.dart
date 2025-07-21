import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pcom_app/app/core/core.dart';
import '../../../../../app/core/resources/app_images.dart';
import '../../../../common/widgets/bottom_nav_item.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: controller.currentView[controller.index.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            // color: Colors.white, // Background color for the container
            color: Theme.of(context).brightness == Brightness.light
                ? R
                      .theme
                      .white // Use light theme decoration color
                : R.theme.color600, // Use dark theme decoration color
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08), // Color with opacity
                offset: const Offset(
                  0,
                  -10,
                ), // Horizontal: 0px, Vertical: -10px (same as the given CSS)
                blurRadius: 40, // Equivalent to the 'blur radius' in CSS
                spreadRadius: 0, // Equivalent to the 'spread radius' in CSS
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(
            vertical: AppConfig.defaultPadding / 2,
          ),
          child: Row(
            children: [
              const Spacer(),
              MyBottomNavItem(
                icon: R.image.ic_home_un,
                activeicon: R.image.ic_home,
                active: controller.index.value == 0 ? true : false,
                onTap: () {
                  controller.index.value = 0;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: R.image.ic_explore_un,
                activeicon: R.image.ic_explore,
                active: controller.index.value == 1 ? true : false,
                onTap: () {
                  controller.index.value = 1;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: R.image.ic_application_un,
                activeicon: R.image.ic_application,
                active: controller.index.value == 2 ? true : false,
                onTap: () {
                  controller.index.value = 2;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: R.image.ic_heart_un,
                activeicon: R.image.ic_heart,
                active: controller.index.value == 3 ? true : false,
                onTap: () {
                  controller.index.value = 3;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: R.image.ic_profile_un,
                activeicon: R.image.ic_profile,
                active: controller.index.value == 4 ? true : false,
                onTap: () {
                  controller.index.value = 4;
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
