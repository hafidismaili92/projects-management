import 'package:flutter/material.dart';
import 'package:project_management/models/user.dart';

class UserDataProvider extends ChangeNotifier {
  User? _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  User? get user => _user;
}
