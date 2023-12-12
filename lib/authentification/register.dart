import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:wie/containers/customized_app_bar.dart';
import 'package:wie/containers/widgets.dart';
import 'package:wie/models/user.dart';
import 'package:wie/services/auth_services.dart';
import 'package:wie/ui/colors.dart';
import 'package:wie/ui/font_weight.dart';
import 'package:wie/ui/sizes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  UsersService get service => GetIt.instance<UsersService>();
  List<User> users = [];
  @override
  void initState() {
    users = service.getUserList();
    super.initState();
  }

  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController rePassword;

  // @override
  // void initState() {
  //   userName = TextEditingController();
  //   email = TextEditingController();
  //   password = TextEditingController();
  //   rePassword = TextEditingController();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   userName.dispose();
  //   email.dispose();
  //   password.dispose();
  //   rePassword.dispose();

  //   super.dispose();
  // }

  final _formKey = GlobalKey<FormState>();

  bool isSame = false;
  bool isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        top: true,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: customizedAppBar(context, "SIGN UP", true, false, false),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40.0, bottom: 5, left: 20.0),
                    child: appText(
                        "Don't have an account? Register now",
                        AppColors.textColor,
                        AppFontWeights.textFW,
                        AppSizes.midTextSize,
                        TextDecoration.none),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0, bottom: 30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          appTextArea(
                            "First Name",
                            12.sp,
                            "John",
                            false,
                            TextInputType.text,
                            AppColors.textColor,
                            12.sp,
                            Icons.supervised_user_circle,
                            (value) {},
                          ),
                          appTextArea(
                            "Last Name",
                            12.sp,
                            "Doe",
                            false,
                            TextInputType.text,
                            AppColors.textColor,
                            12.sp,
                            Icons.home,
                            (value) {},
                          ),
                          appTextArea(
                            "Email",
                            12.sp,
                            "john.doe@gmail.com",
                            false,
                            TextInputType.emailAddress,
                            AppColors.textColor,
                            12.sp,
                            Icons.person,
                            (value) {},
                          ),
                          appTextArea(
                            "Create a password",
                            12.sp,
                            "password",
                            true,
                            TextInputType.text,
                            AppColors.textColor,
                            12.sp,
                            Icons.lock,
                            (value) {},
                          ),
                          appTextArea(
                            "Confirm password",
                            12.sp,
                            "password",
                            true,
                            TextInputType.text,
                            AppColors.textColor,
                            12.sp,
                            Icons.lock,
                            (value) {},
                          ),
                          SizedBox(height: 10.h),
                          GestureDetector(
                            onTap: () async {
                              // String email1 = email.text;
                              // String password1 = password.text;
                              // String error;
                            },
                            child: SizedBox(
                              height: 50.h,
                              width: 180.w,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.backgroundColor)),
                                  child: const Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight:
                                            AppFontWeights.buttonTextFW),
                                  )),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          appRichText(
                              context,
                              "Have an account? ",
                              "Login",
                              AppColors.textColor.withOpacity(0.3),
                              AppColors.themeColor,
                              FontWeight.bold,
                              12.sp,
                              TextDecoration.none),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
