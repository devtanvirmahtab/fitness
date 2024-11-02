import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/app_text_style.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          controller.title,
          style: text20Style(
            isPrimaryColor: true,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
