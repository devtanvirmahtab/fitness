import 'package:fitness/app/core/constants/app_constant.dart';
import 'package:fitness/app/core/constants/app_text_style.dart';
import 'package:fitness/app/core/constants/asset_constants.dart';
import 'package:fitness/app/core/widgets/horizontal_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/header_text.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBg,
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
              ),
              gapH(10),
              popularWorkOut(),
              gapH(20),
              const HeaderText(
                title: 'Today Plan',
              ),
              gapH(10),
              todayPlan(),
            ],
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
          ),
          gapH(10),
          Text(
            'Pramuditya Uzumaki',
            style: text20Style(),
          ),
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
            hintStyle: text14Style(color: AppColor.liteGray)),
      ),
    );
  }

  Widget popularWorkOut() {
    return SizedBox(
      height: 210,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Get.toNamed(Routes.WORKOUT);
            },
            child: SizedBox(
              width: 310,
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
                      color: Colors.black
                          .withOpacity(0.5), // Adjust opacity as needed
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
                                style: text20Style(isWhiteColor: true),
                              ),
                              gapH(20),
                              iconText(
                                  icon: Icons.local_fire_department,
                                  text: '500 Kcal'),
                              gapH(15),
                              iconText(
                                  icon: Icons.access_time_outlined,
                                  text: '500 Kcal'),
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
        return Container(
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    welcomeBg,
                    width: 100,
                    height: 110,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          decoration: const BoxDecoration(
                            color: AppColor.secondaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            'Beginner',
                            style: text14Style(isWhiteColor: true),
                          ),
                        ),
                      ),
                      Text(
                        'Sit Up',
                        style: text18Style(color: AppColor.secondaryColor),
                      ),
                      Text(
                        '20 Sit up a day',
                        style: text18Style(color: AppColor.liteGray),
                      ),
                      gapH(10),
                      SizedBox(
                        height: 25,
                        child: Stack(
                          children: <Widget>[
                            SizedBox.expand(
                              child: LinearProgressIndicator(
                                borderRadius: BorderRadius.circular(5),
                                value: 0.75,
                                backgroundColor: AppColor.mainBg,
                                valueColor: const AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
                              ),
                            ),
                            Center(child: Text("75%",style: text12Style(),)),
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
      },
      separatorBuilder: (context, index) {
        return gapH(20);
      },
      itemCount: 10,
    );
  }
}
