import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../application/views/application_view.dart';
import '../explore/views/explore_view.dart';
import '../heart/views/heart_view.dart';
import '../home/views/home_view.dart';
import '../profile/views/profile_view.dart';

class MainController extends GetxController {
  final index = 0.obs;

  List<Widget> currentView = [
    const HomeView(),
    const ExploreView(),
    const ApplicationView(),
    const HeartView(),
    const ProfileView(),
  ];
}
