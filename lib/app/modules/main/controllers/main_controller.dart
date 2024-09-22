import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillo/app/modules/main/application/views/application_view.dart';
import 'package:pillo/app/modules/main/explore/views/explore_view.dart';
import 'package:pillo/app/modules/main/heart/views/heart_view.dart';
import 'package:pillo/app/modules/main/home/views/home_view.dart';
import 'package:pillo/app/modules/main/profile/views/profile_view.dart';

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
