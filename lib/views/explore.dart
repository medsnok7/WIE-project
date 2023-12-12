import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:wie/containers/widgets.dart';
import 'package:wie/ui/colors.dart';
import 'package:wie/ui/font_weight.dart';
import 'package:wie/ui/sizes.dart';
import 'package:wie/views/competition_page.dart';
import 'package:wie/views/forum_page.dart';
import 'package:wie/views/student_page.dart';
import 'package:wie/views/tutorial_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<String> containers = [
    "COURSES",
    "STUDENTS",
    "FORUM",
    "COMPETITIONS"
  ];
  final List<String> labels = [
    "Video tutorials & links",
    "Rate Students",
    "Chat with the instructors",
    "Upcoming competitons"
  ];
  final List<String> images = [
    "assets/icons/tutorial.png",
    "assets/icons/student.png",
    "assets/icons/forum.png",
    "assets/icons/competition.png",
  ];
  final List<Widget> pages = [
    const TutorialView(),
    const StudentsView(),
    const ForumView(),
    const CompetitionsView()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: 100.h,
            width: double.infinity,
            child: DigitalClock(
              digitAnimationStyle: Curves.elasticInOut,
              is24HourTimeFormat: false,
              showSecondsDigit: true,
              areaDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.themeColor.withOpacity(0.2)),
              amPmDigitTextStyle: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
              hourMinuteDigitTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
              secondDigitTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            height: 350.h,
            width: double.infinity,
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 40,
                shrinkWrap: true,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    height: 250.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.themeColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        navigate(context, pages[index]);
                      },
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Positioned(
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            height: 80.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(images[index]),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 45.h,
                            width: 155.w,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                color: Colors.grey[100]),
                            child: Padding(
                              padding: MediaQuery.of(context).padding,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  appText(
                                      containers[index],
                                      AppColors.backgroundColor,
                                      AppFontWeights.midTextFW,
                                      AppSizes.textSize,
                                      TextDecoration.none),
                                  appText(
                                      labels[index],
                                      AppColors.textColor,
                                      AppFontWeights.textFW,
                                      AppSizes.textSize,
                                      TextDecoration.none),
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
