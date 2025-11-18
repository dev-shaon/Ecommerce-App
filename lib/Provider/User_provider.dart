import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  String username;

  UserProvider({
    this.username="ki"
  });
  void changeUserName({
required String newUserName,
  })async{
    username = newUserName;
    notifyListeners();
  }
}