import 'package:fitness/app/core/constants/app_text_style.dart';
import 'package:fitness/app/core/constants/asset_constants.dart';
import 'package:fitness/app/modules/splash/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constant.dart';
import '../../../core/widgets/app_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  welcomeBg,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColor.white.withOpacity(0.03),
                          AppColor.white.withOpacity(0.5),
                          AppColor.white.withOpacity(0.9),
                          AppColor.white,
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: AppColor.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                       style: text20Style(),
                      children: [
                        const TextSpan(text: 'Where you are \n',),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  color: AppColor.primaryColor,
                                  width: 65,
                                  height: 15,
                                ),
                              ),
                              Text(
                                'health',
                                style: text20Style(),
                              ),
                            ],
                          ),
                        ),
                        const TextSpan(text: ' is number one'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ).animate()
                    .fadeIn(delay:500.ms,duration: 500.ms),
                  gapH(20),
                  Text(
                    'There is no instant way to a healthy life',
                    style: text14Style(),
                  ).animate()
                    .fade(delay:1000.ms,duration: 500.ms),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AppButton(
                      text: 'Get Started',
                      onTap: () {
                        Get.toNamed(Routes.MAIN_NAV);
                      },
                    ).animate()
                    .fadeIn(delay: 1500.ms,duration: 1000.ms),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
