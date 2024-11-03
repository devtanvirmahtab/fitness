import 'dart:ui';

import 'package:fitness/app/core/widgets/app_button.dart';
import 'package:fitness/app/core/widgets/gradient_border.dart';
import 'package:fitness/app/core/widgets/header_text.dart';
import 'package:fitness/app/core/widgets/horizontal_padding.dart';
import 'package:fitness/app/modules/nav/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
        leading: Padding(
          padding: const EdgeInsets.all(7),
          child: InkWell(
            onTap: (){
              Get.back();
            },
            borderRadius: BorderRadius.circular(100),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: AppColor.white,
            ),
          ),
        ),
        title: Text(
          'Workout',
          style: text16Style(isWhiteColor: true),
        ),
        centerTitle: true,
      ),
      body: HorizontalPadding(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH(20),
                    workoutImageCard(),
                    gapH(20),
                    titleDescription(),
                    gapH(25),
                    roundTitle(),
                    gapH(15),
                    roundList(),
                    gapH(100),
                  ],
                ),
              ),
            ),
            workoutButton(),
          ],
        ),
      ),
    );
  }

  Widget workoutButton() {
    return Positioned(
      bottom: 20,
      height: 50,
      right: 0,
      left: 0,
      child: AppButton(
        text: 'Lets Workout',
        onTap: () {},
        backgroundColor: AppColor.primaryColor,
        textColor: AppColor.secondaryColor,
      ),
    ).animate().fadeIn(delay: 1200.ms,duration: 500.ms);
  }

  Widget roundTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HeaderText(
          title: 'Rounds',
          color: AppColor.white,
          padding: 0,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '1',
                style: text16Style(
                  color: AppColor.white,
                ),
              ),
              TextSpan(
                text: '/',
                style: text14Style(
                  color: AppColor.white,
                ),
              ),
              TextSpan(
                text: '8',
                style: text14Style(
                  color: AppColor.white,
                ),
              ),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(delay: 1100.ms,duration: 500.ms);
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
                  image1,
                  fit: BoxFit.cover,
                ),
              ).animate()
                .scale(duration:300.ms),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 45,
            right: 45,
            child: CustomPaint(
              painter: GradientBorderPainter(
                strokeWidth: 1,
                radius: 15,
                gradient: LinearGradient(
                  colors: [
                    AppColor.primaryColor.withOpacity(0.5),
                    AppColor.secondaryColor.withOpacity(0.5),
                    AppColor.secondaryColor.withOpacity(0.5),
                    AppColor.primaryColor.withOpacity(0.5),
                  ],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(1),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ).animate().fadeIn(delay: 500.ms,duration: 500.ms),
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
        ).animate().fadeIn(delay: 800.ms,duration: 500.ms),
        gapH(15),
        Text(
          'The Lower abdomen and hips are the most difficult areas fo the body to reduce when we on diet. Even so, in this area especially the legs as a whole, you can reduce weight even if you don\'t use tools',
          style: text14Style(
            color: AppColor.white.withOpacity(0.5),
          ),
        ).animate().fadeIn(delay: 800.ms,duration: 500.ms),
      ],
    );
  }

  Widget roundList() {
    return ListView.separated(
      itemCount: controller.roundList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final data = controller.roundList[index];
        return singleRound(
          image: data.image,
          title: data.title,
          subtitle: data.subtitle,
        );
      },
      separatorBuilder: (context, index) {
        return gapH(15);
      },
    ).animate().fadeIn(delay: 1100.ms,duration: 500.ms);
  }

  Widget singleRound({
    required String image,
    required String title,
    required String subtitle,
  }) {
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
              image,
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
                title,
                style: text16Style(isWhiteColor: true),
              ),
              gapH(10),
              Text(
                subtitle,
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
  }
}
