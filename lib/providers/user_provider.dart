import 'package:evently_app/model/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;

  void upadateUser(UserModel newUser) {
    userModel = newUser;
    notifyListeners();
  }
}
