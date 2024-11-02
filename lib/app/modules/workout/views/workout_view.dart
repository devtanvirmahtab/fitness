import 'dart:ui';

import 'package:fitness/app/core/widgets/app_button.dart';
import 'package:fitness/app/core/widgets/header_text.dart';
import 'package:fitness/app/core/widgets/horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constant.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../core/constants/asset_constants.dart';
import '../controllers/workout_controller.dart';

class WorkoutView extends GetView<WorkoutController> {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: HorizontalPadding(
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH(20),
                    workoutImageCard(),
                    gapH(20),
                    titleDescription(),
                    gapH(20),
                    const HeaderText(
                      title: 'Rounds',
                      color: AppColor.white,
                      padding: 0,
                    ),
                    roundList(),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: AppButton(
                text: 'Lets Workout',
                onTap: () {},
                backgroundColor: AppColor.primaryColor,
                textColor: AppColor.secondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget workoutImageCard() {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(23),
            child: Positioned.fill(
              child: SizedBox(
                height: 230,
                width: double.infinity,
                child: Image.asset(
                  welcomeBg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 50,
            right: 50,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.primaryColor,
                    AppColor.secondaryColor,
                    AppColor.primaryColor,
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        blurTimeCard(),
                        VerticalDivider(
                          color: Colors.white.withOpacity(0.25),
                          thickness: 2,
                          width: 10,
                          endIndent: 0,
                          indent: 0,
                        ),
                        blurTimeCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget blurTimeCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(5)),
          child: const Icon(
            Icons.access_alarm,
            color: AppColor.secondaryColor,
          ),
        ),
        gapW(8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Time',
              style: text14Style(isWhiteColor: true),
            ),
            Text(
              '20 min',
              style: text14Style(isPrimaryColor: true),
            ),
          ],
        ),
      ],
    );
  }

  Widget titleDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lower Body Training',
          style: text20Style(isWhiteColor: true),
        ),
        gapH(15),
        Text(
          'The Lower abdomen and hips are the most difficult areas fo the body to reduce when we on diet. Even so, in this area especially the legs as a whole, you can reduce weight even if you don\'t use tools',
          style: text14Style(
            color: AppColor.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Widget roundList() {
    return ListView.separated(
      itemCount: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.cardBg,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  welcomeBg,
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              gapW(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jumping Jacks',
                    style: text18Style(isWhiteColor: true),
                  ),
                  Text(
                    '00:30',
                    style: text14Style(
                      color: AppColor.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              gapW(
                20,
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 20,
                backgroundColor: AppColor.secondaryColor,
                child: Icon(
                  Icons.play_arrow,
                  size: 18,
                  color: AppColor.primaryColor,
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return gapH(15);
      },
    );
  }
}
