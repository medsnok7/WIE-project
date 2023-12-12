import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wie/authentification/login.dart';
import 'package:wie/authentification/register.dart';
import 'package:wie/ui/colors.dart';
import 'package:wie/ui/font_weight.dart';
import 'package:wie/ui/sizes.dart';

Future<dynamic> navigate(context, Widget page) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var tween = Tween(begin: begin, end: end);
        var fadeAnimation = animation.drive(tween);
        return FadeTransition(
          opacity: fadeAnimation,
          child: child,
        );
      },
    ),
  );
}

Widget appRichText(
    BuildContext context,
    String text,
    String textButton,
    Color color1,
    Color color2,
    FontWeight fontWeight,
    double size,
    textDecoration) {
  return RichText(
    text: TextSpan(
      text: text,
      style: TextStyle(
          color: color1,
          fontSize: size,
          fontWeight: fontWeight,
          decorationColor: AppColors.themeColor,
          decoration: textDecoration),
      children: <TextSpan>[
        TextSpan(
          text: textButton,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              if (textButton == "Login") {
                navigate(context, const LoginView());
              } else {
                navigate(context, const RegisterView());
              }
            },
          style: TextStyle(
              color: color2,
              fontSize: size,
              fontWeight: fontWeight,
              decorationColor: AppColors.themeColor,
              decoration: textDecoration),
        ),
      ],
    ),
  );
}

Widget appTextArea(
  String text,
  double textSize,
  String hintText,
  bool obscureText,
  TextInputType keyboardType,
  Color color,
  double size,
  IconData icon,
  void Function(String value)? func,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 18.h,
            child: appText(text, color, AppFontWeights.midTextFW, textSize,
                TextDecoration.none)),
        SizedBox(height: 2.h),
        SizedBox(
          width: 320.w,
          height: 50.h,
          child: TextFormField(
            onChanged: (value) {
              return func!(value);
            },
            obscureText: obscureText,
            // controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15.w),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15.w),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15.w),
              ),
              prefixIcon: Icon(icon),
              prefixIconColor: Colors.black,
              hintText: hintText,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget appTextButton(String text, Color color, FontWeight fontWeight,
    double size, TextDecoration textDecoration) {
  return GestureDetector(
    child: appText(text, color, fontWeight, size, textDecoration),
  );
}

String formatDateTime(DateTime dateTime) {
  return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
}

Container textFieldCustomized(
    String title, String hintText, TextInputType texType, int? maxline) {
  return Container(
    padding: const EdgeInsets.all(10),
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(hintText, AppColors.backgroundColor, AppFontWeights.midTextFW,
            AppSizes.midTextSize, TextDecoration.none),
        TextField(
          focusNode: FocusNode(),
          keyboardType: texType,
          cursorColor: AppColors.backgroundColor,
          maxLines: maxline,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              labelText: title,
              prefixStyle: const TextStyle(color: AppColors.backgroundColor)),
        ),
      ],
    ),
  );
}

void addTask(BuildContext context, TextEditingController titleController,
    bool addOrMod) {
  showModalBottomSheet(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (addOrMod == true) ? 'Add a course' : "Modify a course",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              (addOrMod == true)
                  ? textFieldCustomized("Enter the section title", "Section",
                      TextInputType.text, 1)
                  : textFieldCustomized("Modify the section title", "Section",
                      TextInputType.text, 1),
              (addOrMod == true)
                  ? textFieldCustomized(
                      "Enter the course title", "Course", TextInputType.text, 1)
                  : textFieldCustomized("Modify the course title", "Course",
                      TextInputType.text, 1),
              textFieldCustomized("Links", "Enter the tutorial links",
                  TextInputType.multiline, null),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        (addOrMod) ? "ADD" : "Modify",
                        style: const TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: AppFontWeights.titleFW,
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: AppFontWeights.titleFW,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Container ratingBar(double rate) {
  return Container(
    width: 175.w,
    child: RatingBar.builder(
      initialRating: rate,
      itemCount: 5,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.red,
              size: 10.sp,
            );
          case 1:
            return Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.redAccent,
              size: 10.sp,
            );
          case 2:
            return Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
              size: 10.sp,
            );
          case 3:
            return Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
              size: 10.sp,
            );
          default:
            return Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
              size: 10.sp,
            );
        }
      },
      onRatingUpdate: (rating) {
        print(rating);
      },
    ),
  );
}

void addStudent(BuildContext context, TextEditingController titleController) {
  showModalBottomSheet(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Student',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              textFieldCustomized(
                  "Enter the student name", "Name", TextInputType.text, 1),
              textFieldCustomized("Rate the student from a scale 1 to 5",
                  "Rate", TextInputType.text, 1),
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "ADD",
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: AppFontWeights.titleFW,
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: AppFontWeights.titleFW,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget appText(String text, Color color, FontWeight fontWeight, double size,
    textDecoration) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        decorationColor: AppColors.textButtonColor,
        decoration: textDecoration),
  );
}

Widget appButton(
  String textButton,
  Color color,
  Color textColor,
  Color borderColor,
  double width,
  double height,
  double borderRadius,
  void Function()? func,
) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: borderColor,
            offset: const Offset(0, 0),
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        textButton,
        style: TextStyle(
            color: textColor,
            fontWeight: AppFontWeights.buttonTextFW,
            fontSize: AppSizes.buttonTextSize),
      ),
    ),
  );
}
