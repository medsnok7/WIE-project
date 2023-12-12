import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wie/containers/customized_app_bar.dart';
import 'package:wie/containers/widgets.dart';
import 'package:wie/models/student.dart';
import 'package:wie/ui/colors.dart';
import 'package:wie/ui/font_weight.dart';

class StudentsView extends StatefulWidget {
  const StudentsView({super.key});

  @override
  State<StudentsView> createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  List<StudentForListing> students = [
    StudentForListing(
        studentID: "1",
        studentName: "Ali besbes",
        rating: 3,
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    StudentForListing(
        studentID: "2",
        studentName: "mahmoud chtourou",
        rating: 2,
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    StudentForListing(
        studentID: "3",
        studentName: "Oussema daraji",
        rating: 5,
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    StudentForListing(
        studentID: "1",
        studentName: "Ali besbes",
        rating: 3,
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    StudentForListing(
        studentID: "2",
        studentName: "mahmoud chtourou",
        rating: 2,
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
    StudentForListing(
        studentID: "3",
        studentName: "Oussema daraji",
        rating: 5,
        createDateTime: DateTime.now(),
        lastEditedDateTime: DateTime.now()),
  ];
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.themeColor,
      child: Scaffold(
        appBar: customizedAppBar(context, "STUDENTS", true, false, false),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: AppColors.backgroundColor,
            size: 30.sp,
          ),
          onPressed: () {
            addStudent(context, titleController);
          },
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) =>
              const Divider(height: 1, color: AppColors.themeColor),
          itemBuilder: (context, index) {
            return Dismissible(
                key: ValueKey(students[index].studentID),
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
                    height: 70.h,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor.withOpacity(0.3)),
                    child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        title: const Text(
                          "Full name: ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Icon(Icons.person, color: Colors.deepPurple),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(students[index].studentName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: AppFontWeights.midTextFW)),
                            )
                          ],
                        ),
                        trailing: ratingBar(students[index].rating)),
                  ),
                  // child: ListTile(
                  //   title: const Text(
                  //     "Full name: ",
                  //     style: TextStyle(
                  //         color: AppColors.backgroundColor,
                  //         fontWeight: AppFontWeights.midTextFW),
                  //   ),
                  //   subtitle: Text(
                  //     students[index].studentName,
                  //     style: const TextStyle(
                  //         color: AppColors.textColor,
                  //         fontWeight: AppFontWeights.textFW),
                  //   ),
                  //   trailing: Container(
                  //       padding: MediaQuery.of(context).padding,
                  //       height: 50.h,
                  //       width: 200.w,
                  //       child: ratingBar(students[index].rating)),
                  //   onTap: () {
                  //     // navigate(
                  //     //     context,
                  //     //     NoteModify(
                  //     //       noteID: notes[index].noteID,
                  //     //     ));
                  //   },
                  // ),
                ));
          },
          itemCount: students.length,
        ),
      ),
    );
  }
}
