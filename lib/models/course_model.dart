class CourseForListing {
  String noteID;
  String sectionName;
  String courseName;
  String description;
  DateTime createDateTime;
  DateTime lastEditedDateTime;

  CourseForListing(
      {required this.noteID,
      required this.sectionName,
      required this.courseName,
      required this.description,
      required this.createDateTime,
      required this.lastEditedDateTime});
}
