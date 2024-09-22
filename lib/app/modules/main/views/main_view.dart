import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pillo/app/utils/app_colors.dart';
import 'package:pillo/app/utils/app_config.dart';
import 'package:pillo/app/utils/app_images.dart';

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
            color: Colors.white, // Background color for the container
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08), // Color with opacity
                offset: const Offset(0,
                    -10), // Horizontal: 0px, Vertical: -10px (same as the given CSS)
                blurRadius: 40, // Equivalent to the 'blur radius' in CSS
                spreadRadius: 0, // Equivalent to the 'spread radius' in CSS
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
          child: Row(
            children: [
              const Spacer(),
              MyBottomNavItem(
                icon: ic_home_un,
                activeicon: ic_home,
                active: controller.index.value == 0 ? true : false,
                onTap: () {
                  controller.index.value = 0;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: ic_explore_un,
                activeicon: ic_explore,
                active: controller.index.value == 1 ? true : false,
                onTap: () {
                  controller.index.value = 1;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: ic_application_un,
                activeicon: ic_application,
                active: controller.index.value == 2 ? true : false,
                onTap: () {
                  controller.index.value = 2;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: ic_heart_un,
                activeicon: ic_heart,
                active: controller.index.value == 3 ? true : false,
                onTap: () {
                  controller.index.value = 3;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: ic_profile_un,
                activeicon: ic_profile,
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

class MyBottomNavItem extends StatelessWidget {
  const MyBottomNavItem({
    super.key,
    required this.icon,
    required this.active,
    required this.onTap,
    required this.activeicon,
  });
  final String icon;
  final String activeicon;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      iconSize: 24,
      isSelected: active,
      icon: SvgPicture.asset(
        active ? activeicon : icon,
        width: 25,
        height: 24,
        color: active ? green : blackColor.withOpacity(.7),
      ),
    );
  }
}
