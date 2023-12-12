import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wie/containers/widgets.dart';
import 'package:wie/models/course_model.dart';
import 'package:wie/ui/colors.dart';

class CourseView extends StatefulWidget {
  final CourseForListing course;
  const CourseView({Key? key, required this.course}) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0.0,
              margin: const EdgeInsets.only(bottom: 5.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor.withOpacity(0.3)),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),

                  title: Text(
                    widget.course.sectionName,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                    iconSize: 25.sp,
                  ),
                  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                  subtitle: Row(
                    children: <Widget>[
                      const Icon(Icons.arrow_forward, color: Colors.white),
                      Text(widget.course.courseName,
                          style: const TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: appText(widget.course.description, Colors.black,
                    FontWeight.w400, 12.sp, TextDecoration.none),
              ),
            )
          ],
        ),
      ),
    );
  }
}
