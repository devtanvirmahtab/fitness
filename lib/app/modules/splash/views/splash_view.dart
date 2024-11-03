import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_style.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: AppColor.primaryColor,
            ).animate()
                .fade(duration: 500.ms)
                .scaleXY(delay: 500.ms)
                .moveX(delay: 1000.ms,begin: 0,end: -80,duration: 500.ms,),
            Text(
              controller.title,
              style: text20Style(
                color: AppColor.secondaryColor,
                fontSize: 40,
              ),
            ).animate()
                .moveY(delay: 1300.ms,begin: -85,end: -85)
                .fade(delay: 1300.ms,duration: 500.ms)
                .scale(delay: 500.ms,duration: 500.ms)
                ,
          ],
        ),
      ),
    );
  }
}
