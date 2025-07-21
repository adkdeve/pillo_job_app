import 'package:get/get.dart';

import '../controllers/heart_controller.dart';

class HeartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HeartController>(
      () => HeartController(),
    );
  }
}
