import 'package:flutter/material.dart';
import 'package:wie/authentification/login.dart';
import 'package:wie/containers/widgets.dart';
import 'package:wie/ui/colors.dart';
import 'package:wie/ui/font_weight.dart';

AppBar customizedAppBar(
    BuildContext context, String title, bool center, bool logout, bool home) {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    centerTitle: center,
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.white, fontWeight: AppFontWeights.midTextFW),
    ),
    leading: (home == false)
        ? IconButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ))
        : Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ));
          }),
    actions: [
      if (logout == true)
        IconButton(
            onPressed: () {
              navigate(context, const LoginView());
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            )),
    ],
  );
}
