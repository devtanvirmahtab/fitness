import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final title = 'Fitness App';

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2),() {
        Get.offAndToNamed(Routes.ONBOARDING);
      },);
    });

    super.onInit();
  }
}
