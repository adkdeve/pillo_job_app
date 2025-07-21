import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabcontroller = TabController(vsync: this, length: 2);
  var selectedIndex = 0.obs;
  @override
  void onInit() {
    tabcontroller = TabController(vsync: this, length: 2);
    tabcontroller.addListener(() {
      // Update selectedIndex when tab changes
      selectedIndex.value = tabcontroller.index;
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabcontroller.dispose(); // Dispose of the tab controller when not needed
    super.onClose();
  }
}
