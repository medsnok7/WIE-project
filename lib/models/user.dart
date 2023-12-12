class User {
  String cin;
  String firstName;
  String lastName;
  String email;
  String password;
  String salt;
  DateTime date;

  User(
      {required this.cin,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.salt,
      required this.date});
}
