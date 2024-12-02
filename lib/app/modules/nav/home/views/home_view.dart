import 'dart:ui';

import 'package:fitness/app/core/constants/app_constant.dart';
import 'package:fitness/app/core/constants/app_text_style.dart';
import 'package:fitness/app/core/constants/asset_constants.dart';
import 'package:fitness/app/core/widgets/horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/header_text.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Colors.purple.withOpacity(0.2),
              Colors.deepPurpleAccent.withOpacity(0.1),
              Colors.purple.shade50,
            ],
          tileMode: TileMode.clamp,begin: Alignment.bottomLeft,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          // color: AppColor.infoColor.withOpacity(0.5),
          child: Scaffold(
            backgroundColor: AppColor.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH(20),
                    grettingAndName(),
                    gapH(20),
                    searchInput(),
                    gapH(20),
                    const HeaderText(
                      title: 'Popular Workouts',
                    ).animate().fadeIn(
                          delay: 1000.ms,
                          duration: 500.ms,
                        ),
                    gapH(10),
                    popularWorkOut(),
                    gapH(20),
                    const HeaderText(
                      title: 'Today Plan',
                    ).animate().fadeIn(
                          delay: 1200.ms,
                          duration: 500.ms,
                        ),
                    gapH(10),
                    todayPlan().animate().fadeIn(
                          delay: 1200.ms,
                          duration: 500.ms,
                        ),
                    gapH(100),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget grettingAndName() {
    return HorizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Good Morning',
                style: text14Style(),
              ),
              gapW(10),
              const Icon(
                Icons.local_fire_department_rounded,
                color: Colors.amber,
              ),
            ],
          ).animate().fadeIn(duration: 500.ms),
          gapH(10),
          Text(
            'Pramuditya Uzumaki',
            style: text20Style(fontSize: 24),
          ).animate().fadeIn(delay: 300.ms, duration: 500.ms),
        ],
      ),
    );
  }

  Widget searchInput() {
    return HorizontalPadding(
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColor.liteGray,
          ),
          hintText: 'Search',
          hintStyle: text14Style(
            color: AppColor.liteGray,
          ),
        ),
      ).animate().fadeIn(delay: 800.ms, duration: 500.ms),
    );
  }

  Widget popularWorkOut() {
    return SizedBox(
      height: 212,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(Routes.WORKOUT,);
            },
            child: SizedBox(
              width: 280,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(image1),
                    ),
                    Container(
                      color: Colors.black
                          .withOpacity(0.4), // Adjust opacity as needed
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lower Body \nTraining",
                                style: text20Style(
                                    isWhiteColor: true, fontSize: 22),
                              ),
                              gapH(20),
                              iconText(
                                icon: Icons.local_fire_department,
                                text: '500 Kcal',
                              ),
                              gapH(15),
                              iconText(
                                icon: Icons.access_time_outlined,
                                text: '500 Kcal',
                              ),
                            ],
                          ),
                          const CircleAvatar(
                            backgroundColor: AppColor.primaryColor,
                            radius: 25,
                            child: Icon(
                              Icons.play_arrow,
                              color: AppColor.secondaryColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return gapW(10);
        },
        itemCount: 10,
      ).animate().fadeIn(
            delay: 1000.ms,
            duration: 500.ms,
          ),
    );
  }

  Widget iconText({
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: AppColor.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(9)),
      child: Row(
        children: [
          Icon(icon),
          gapW(8),
          Text(
            text,
            style: text14Style(),
          )
        ],
      ),
    );
  }

  Widget todayPlan() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final data = controller.planList[index];
        return singlePlan(
          image: data.image,
          title: data.title,
          subtitle: data.subtitle,
          progress: data.progress,
          type: data.type,
        );
      },
      separatorBuilder: (context, index) {
        return gapH(20);
      },
      itemCount: controller.planList.length,
    );
  }

  Widget singlePlan({
    required String image,
    required String title,
    required String subtitle,
    required String type,
    required int progress,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.white)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                width: 94,
                height: 94,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: const BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                      child: Text(
                        type,
                        style: text14Style(isWhiteColor: true),
                      ),
                    ),
                  ),
                  gapH(10),
                  Text(
                    title,
                    style: text16Style(color: AppColor.secondaryColor),
                  ),
                  Text(
                    subtitle,
                    style: text14Style(color: AppColor.liteGray),
                  ),
                  gapH(10),
                  SizedBox(
                    height: 20,
                    child: Stack(
                      children: <Widget>[
                        SizedBox.expand(
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(5),
                            value: progress / 100,
                            backgroundColor: AppColor.mainBg,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColor.primaryColor),
                          ),
                        ),
                        Center(
                            child: Text(
                          "$progress%",
                          style: text12Style(),
                        )),
                      ],
                    ),
                  ),
                  gapH(15),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
