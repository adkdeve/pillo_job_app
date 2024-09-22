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
          color: whiteColor,
          padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
          child: Row(
            children: [
              const Spacer(),
              MyBottomNavItem(
                icon: ic_home,
                active: true,
                onTap: () {
                  controller.index.value = 0;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: ic_explore,
                active: false,
                onTap: () {
                  controller.index.value = 1;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: ic_application,
                active: false,
                onTap: () {
                  controller.index.value = 2;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: ic_heart,
                active: false,
                onTap: () {
                  controller.index.value = 3;
                },
              ),
              const Spacer(),
              MyBottomNavItem(
                icon: ic_profile,
                active: false,
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
  });
  final String icon;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      iconSize: 24,
      isSelected: active,
      icon: SvgPicture.asset(
        icon,
        width: 25,
        height: 24,
        color: active ? green : blackColor.withOpacity(.7),
      ),
    );
  }
}
