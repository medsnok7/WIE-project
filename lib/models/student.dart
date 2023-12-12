class StudentForListing {
  String studentID;
  String studentName;
  double rating;
  DateTime createDateTime;
  DateTime lastEditedDateTime;

  StudentForListing(
      {required this.studentID,
      required this.studentName,
      required this.rating,
      required this.createDateTime,
      required this.lastEditedDateTime});
}
