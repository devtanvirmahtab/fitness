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
              const HeaderText(title: 'Fast Warmup'),
              gapH(20),
              bestFor(),
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
              child: Image.asset(welcomeBg),
            ),
            Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
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
          return Container(
            width: 300,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    welcomeBg,
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
                        'Belly fat burner',
                        style: text18Style(color: AppColor.secondaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      gapH(10),
                      const Spacer(),
                      bgText(text: '10 min'),
                      gapH(10),
                      bgText(text: 'Beginner'),
                    ],
                  ),
                )
              ],
            ),
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
        color: AppColor.mainBg,
      ),
      child: Text(
        text,
        style: text18Style(color: AppColor.liteGray),
      ),
    );
  }

  Widget challenge() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          challengeCard(),
          gapW(20),
          challengeCard(),
          gapW(20),
          challengeCard(),
        ],
      ),
    );
  }

  Widget challengeCard(){
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.primaryColor,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 10,
            right: 10,
            child: Icon(
              Icons.local_fire_department_outlined,
              color: AppColor.liteGray.withOpacity(0.6),
              size: 60,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              'Plan \nChallenge',
              style: text14Style(),
            ),
          ),
        ],
      ),
    );
  }
}
