import 'package:wie/models/user.dart';

class UsersService {
  List<User> getUserList() {
    return [
      User(
        cin: "1",
        firstName: "mohamed",
        lastName: "chtourou",
        email: "med.cht@gmail.com",
        password: "5522",
        salt: 'dsa',
        date: DateTime.now(),
      ),
      User(
        cin: "2",
        firstName: "ali",
        lastName: "besbes",
        email: "ali.besbes@gmail.com",
        password: "5522",
        salt: 'dsa',
        date: DateTime.now(),
      ),
    ];
  }
}
