import 'package:get/get.dart';

import '../../explore/views/explore_view.dart';
import '../../home/views/home_view.dart';

class MainNavController extends GetxController {
  final selectedIndex = 0.obs;

  final pageList = [
    const HomeView(),
    const ExploreView(),
    const HomeView(),
    const ExploreView()
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
