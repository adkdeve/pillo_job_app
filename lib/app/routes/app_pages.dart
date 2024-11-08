import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/main/application/bindings/application_binding.dart';
import '../modules/main/application/views/application_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/explore/bindings/explore_binding.dart';
import '../modules/main/explore/views/explore_view.dart';
import '../modules/main/heart/bindings/heart_binding.dart';
import '../modules/main/heart/views/heart_view.dart';
import '../modules/main/home/bindings/home_binding.dart';
import '../modules/main/home/views/home_view.dart';
import '../modules/main/notification/bindings/notification_binding.dart';
import '../modules/main/notification/views/notification_view.dart';
import '../modules/main/profile/bindings/profile_binding.dart';
import '../modules/main/profile/views/profile_view.dart';
import '../modules/main/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(), 
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: _Paths.EXPLORE,
          page: () => const ExploreView(),
          binding: ExploreBinding(),
        ),
        GetPage(
          name: _Paths.HEART,
          page: () => const HeartView(),
          binding: HeartBinding(),
        ),
        GetPage(
          name: _Paths.APPLICATION,
          page: () => const ApplicationView(),
          binding: ApplicationBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.NOTIFICATION,
          page: () => const NotificationView(),
          binding: NotificationBinding(),
        ),
      ],
    ),
  ];
}
