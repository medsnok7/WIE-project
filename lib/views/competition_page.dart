import 'package:flutter/material.dart';
import 'package:wie/containers/customized_app_bar.dart';
import 'package:wie/ui/colors.dart';

class CompetitionsView extends StatefulWidget {
  const CompetitionsView({super.key});

  @override
  State<CompetitionsView> createState() => _CompetitionsViewState();
}

class _CompetitionsViewState extends State<CompetitionsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.themeColor,
        child: Container(
          color: AppColors.themeColor,
          child: Scaffold(
            appBar:
                customizedAppBar(context, "COMPETITIONS", true, false, false),
          ),
        ));
  }
}
