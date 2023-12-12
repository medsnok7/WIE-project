import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wie/containers/customized_app_bar.dart';
import 'package:wie/containers/widgets.dart';
import 'package:wie/models/course_model.dart';
import 'package:wie/ui/colors.dart';
import 'package:wie/views/Course.dart';

class TutorialView extends StatefulWidget {
  const TutorialView({super.key});

  @override
  State<TutorialView> createState() => _TutorialViewState();
}

class _TutorialViewState extends State<TutorialView> {
  TextEditingController titleController = TextEditingController();

  List<CourseForListing> courses = [
    CourseForListing(
        noteID: "1",
        sectionName: "Robotic",
        courseName: 'Introduction to robotics',
        description: "LINKS here enjoy your tutorials ",
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    CourseForListing(
        noteID: "2",
        sectionName: "Robotic",
        courseName: 'robot components',
        description: "LINKS",
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    CourseForListing(
        noteID: "3",
        sectionName: "Electronic",
        courseName: 'Introduction to electronic',
        description: "LINKS",
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.themeColor,
      child: Scaffold(
        appBar: customizedAppBar(context, "COURSES", true, false, false),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTask(context, titleController, true);
          },
          child: Icon(
            Icons.add,
            color: AppColors.backgroundColor,
            size: 30.sp,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Dismissible(
                key: ValueKey(courses[index].noteID),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {},
                confirmDismiss: (direction) async {
                  // final result = await showDialog(
                  //     context: context, builder: (_) => const NoteDelete());
                  // print(result);
                  // return result;
                },
                background: Align(
                    child: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: const Icon(Icons.delete, color: Colors.white))),
                child: Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.only(bottom: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor.withOpacity(0.3)),
                    child: ListTile(
                        onLongPress: () {
                          navigate(context, CourseView(course: courses[index]));
                        },
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: const EdgeInsets.only(right: 12.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 1.0,
                                      color: AppColors.backgroundColor))),
                          child: const Icon(Icons.book_online_outlined,
                              color: Colors.white),
                        ),
                        title: Text(
                          courses[index].sectionName,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            const Icon(Icons.arrow_forward,
                                color: Colors.white),
                            Text(courses[index].courseName,
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        trailing: const Icon(Icons.keyboard_arrow_right,
                            color: Colors.white, size: 30.0)),
                  ),
                  // child: ListTile(
                  //   title: Text(
                  //     "Section ${courses[index].sectionName}",
                  //     style: const TextStyle(color: Colors.black),
                  //   ),
                  //   subtitle: Text("Course ${courses[index].courseName}"),
                  //   onTap: () {
                  //     addTask(context, titleController, false);
                  //   },
                  //   onLongPress: () {
                  //     navigate(context, CourseView(course: courses[index]));
                  //   },
                  // ),
                ));
          },
          itemCount: courses.length,
        ),
      ),
    );
  }
}
