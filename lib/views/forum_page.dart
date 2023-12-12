import 'package:flutter/material.dart';
import 'package:wie/containers/customized_app_bar.dart';
import 'package:wie/ui/colors.dart';

class ForumView extends StatefulWidget {
  const ForumView({super.key});

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.themeColor,
      child: Scaffold(
        appBar: customizedAppBar(context, "CHAT", true, false, false),
      ),
    );
  }
}
