import 'package:fitness/app/core/constants/app_constant.dart';
import 'package:fitness/app/core/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../../core/constants/asset_constants.dart';
import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              workoutImageCard(),
              gapH(20),
              const HeaderText(title: 'Best for you'),
              gapH(20),
              bestFor(),
              gapH(15),
              bestFor(),
              gapH(20),
              const HeaderText(title: 'Challenge'),
              challenge(),
              gapH(10),
              const HeaderText(title: 'Fast Warmup'),
              gapH(20),
              bestFor(),
              gapH(100),
            ],
          ),
        ),
      ),
    );
  }

  Widget workoutImageCard() {
    return Container(
      height: 270,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Stack(
          fit: StackFit.expand,
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(image4),
            ),
            Container(
              color: Colors.black.withOpacity(0.4), // Adjust opacity as needed
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Best Quarantine \nWorkout",
                    style: text20Style(isWhiteColor: true),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'See more',
                        style: text14Style(
                            color: AppColor.primaryColor,
                            isWeight600: true,
                            fontSize: 15),
                      ),
                      gapW(5),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: AppColor.primaryColor,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bestFor() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return singleBestCard(
            image: welcomeBg,
            title: 'Belly fat burner',
            subtitle: '10 min',
            type: 'Beginner',
          );
        },
        separatorBuilder: (context, index) {
          return gapW(20);
        },
        itemCount: 10,
      ),
    );
  }

  Widget bgText({required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.textBG,
      ),
      child: Text(
        text,
        style: text14Style(
          color: AppColor.secondaryColor.withOpacity(0.7),
        ),
      ),
    );
  }

  Widget challenge() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            gapW(20),
            challengeCard(
                text: 'Plan \nChallenge',
                icon: Icons.local_fire_department_outlined),
            gapW(20),
            challengeCard(
              text: 'Sprint \nChallenge',
              icon: Icons.run_circle_outlined,
              background: AppColor.secondaryColor,
              textColor: AppColor.white,
            ),
            gapW(20),
            challengeCard(
                text: 'Squat \n Challenge', icon: Icons.water_drop_outlined),
            gapW(20),
          ],
        ),
      ),
    );
  }

  Widget challengeCard({
    Color? background,textColor,
    required String text,
    required IconData icon,
  }) {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: background ?? AppColor.primaryColor,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 10,
            right: 10,
            child: Icon(
              icon,
              color: AppColor.liteGray.withOpacity(0.6),
              size: 60,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              text,
              style: text14Style(color: textColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget singleBestCard({
    required String image,
    required String title,
    required String subtitle,
    required String type,
    progress,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 100,
              height: 120,
              fit: BoxFit.fitHeight,
            ),
          ),
          gapW(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: text18Style(color: AppColor.secondaryColor),
                  overflow: TextOverflow.ellipsis,
                ),
                gapH(10),
                const Spacer(),
                bgText(text: subtitle),
                gapH(10),
                bgText(text: type),
              ],
            ),
          )
        ],
      ),
    );
  }
}
