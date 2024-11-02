import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final title = 'Fitness App';

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1),() {
        Get.offAndToNamed(Routes.ONBOARDING);
      },);
    });

    super.onInit();
  }
}
