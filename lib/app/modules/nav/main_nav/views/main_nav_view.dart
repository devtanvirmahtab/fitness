import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constant.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../explore/views/explore_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/main_nav_controller.dart';

class MainNavView extends GetView<MainNavController> {
  const MainNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            return IndexedStack(
              index: controller.selectedIndex.value,
              children: const [
                HomeView(),
                ExploreView(),
                HomeView(),
                ExploreView(),
              ],
            );
          }),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: myBottomNavigationBar(),
          ).animate().fadeIn(delay: 1000.ms,duration:500.ms,),
        ],
      ),
    );
  }

  Widget myBottomNavigationBar() {
    double paddingVertical = 12;
    double paddingHorizontal = 12;

    return Obx(() {
      return Container(
        color: AppColor.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: GNav(
            selectedIndex: controller.selectedIndex.value,
            onTabChange: (index) {
              controller.selectedIndex.value = index;
              switch (index) {
                case 0:
                  // Get.find<HomeController>().onManualInit();
                  break;
                case 1:
                  // Get.find<TrainingController>().onManualInit();
                  break;
                case 2:
                  // Get.find<JobsController>().onManualInit();
                  break;
                case 3:
                  // Get.find<ProfileController>().onInit();
                  break;
                default:
              }
            },
            gap: 5,
            color: AppColor.white,
            activeColor: AppColor.black,
            tabBackgroundColor: AppColor.primaryColor,
            tabBorderRadius: 50,
            style: GnavStyle.google,
            duration: const Duration(milliseconds: 500),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            tabs: [
              GButton(
                // leading: Image.asset(
                //   homeIcon,
                //   width: 25,
                //   color: controller.currentIndex.value == 0
                //       ? AppColor.white
                //       : AppColor.primaryColor,
                // ),
                icon: Icons.home_filled,
                text: 'Home',
                padding: EdgeInsets.symmetric(
                  vertical: paddingVertical,
                  horizontal: paddingHorizontal,
                ),
              ),
              GButton(
                // leading: Image.asset(
                //   bookMarkIcon,
                //   width: 25,
                //   color: controller.currentIndex.value == 1
                //       ? AppColor.white
                //       : AppColor.primaryColor,
                // ),
                icon: Icons.rocket_launch_outlined,
                text: "Explore",
                padding: EdgeInsets.symmetric(
                  vertical: paddingVertical,
                  horizontal: paddingHorizontal,
                ),
              ),
              GButton(
                // leading: Image.asset(
                //   capIcon,
                //   width: 25,
                //   color: controller.currentIndex.value == 1
                //       ? AppColor.white
                //       : AppColor.primaryColor,
                // ),
                icon: Icons.insert_chart_outlined_rounded,
                text: 'Graph',
                padding: EdgeInsets.symmetric(
                  vertical: paddingVertical,
                  horizontal: paddingHorizontal,
                ),
              ),
              GButton(
                // leading: Image.asset(
                //   jobIcon,
                //   width: 25,
                //   color: controller.currentIndex.value == 2
                //       ? AppColor.white
                //       : AppColor.primaryColor,
                // ),
                icon: Icons.person_2_outlined,
                text: 'person',
                padding: EdgeInsets.symmetric(
                  vertical: paddingVertical,
                  horizontal: paddingHorizontal,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget iconText({
    required String title,
    required IconData icon,
    required onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColor.black,
            ),
            gapW(8),
            Text(
              title,
              style: text14Style(
                isWeight600: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
