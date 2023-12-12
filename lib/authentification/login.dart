import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wie/containers/widgets.dart';
import 'package:wie/ui/colors.dart';
import 'package:wie/ui/font_weight.dart';
import 'package:wie/views/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // late TextEditingController email;
  // late TextEditingController password;
  // @override
  // void initState() {
  //   email = TextEditingController();
  //   password = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 200.w,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.themeColor.withOpacity(0.0),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 180.h,
                        width: 180.h,
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              image: AssetImage("assets/icons/logo.png"),
                            )),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: appText("Welcome!", AppColors.titleColor,
                      FontWeight.bold, 20.sp, TextDecoration.none),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      appTextArea(
                        "email",
                        12.sp,
                        "enter your email address",
                        false,
                        TextInputType.emailAddress,
                        AppColors.textColor,
                        12.sp,
                        Icons.person,
                        (value) {},
                      ),
                      SizedBox(height: 5.h),
                      appTextArea(
                        "password",
                        12.sp,
                        "enter your password",
                        true,
                        TextInputType.text,
                        AppColors.textColor,
                        12.sp,
                        Icons.lock,
                        (value) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Container(
                          child: appTextButton(
                              "Forgot password?",
                              AppColors.themeColor,
                              FontWeight.bold,
                              12.sp,
                              TextDecoration.none),
                        ),
                      ),
                      SizedBox(height: 15.sp),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            // String email1 = email.text;
                            // String password1 = password.text;
                            // String error;
                          },
                          child: SizedBox(
                            height: 50.h,
                            width: 180.w,
                            child: ElevatedButton(
                                onPressed: () {
                                  navigate(context, const HomeView());
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.backgroundColor)),
                                child: const Text(
                                  "LOG IN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: AppFontWeights.buttonTextFW),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: appRichText(
                            context,
                            "Not a member? ",
                            "Register now",
                            AppColors.textColor.withOpacity(0.3),
                            AppColors.themeColor,
                            FontWeight.bold,
                            12.sp,
                            TextDecoration.none),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
