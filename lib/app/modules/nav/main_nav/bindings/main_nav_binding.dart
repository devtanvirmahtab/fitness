import 'package:fitness/app/modules/nav/explore/controllers/explore_controller.dart';
import 'package:fitness/app/modules/nav/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_nav_controller.dart';

class MainNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavController>(
      () => MainNavController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<ExploreController>(
          () => ExploreController(),
    );
  }
}
