import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tracker/services/user_service.dart';
import 'package:tracker/models/user_model.dart';

import '../models/all_users_model.dart';

class UserController with ChangeNotifier {
//------------------------addUser------------------------------

  List list_of_User = [];

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String role_id =  '';
  String team_id = '';

  onClickAddUser() async {
    User user = User(
        first_name: fnameController.text,
        last_name: lnameController.text,
        email: emailController.text,
        employee_identical: idController.text,
        password: passwordController.text,
        role_id: role_id,
        team_id: role_id);


    await UserService.addUser(user);
  }


  AllUsersModel? allUsersModel;
  Future getAllUsers() async{
    print('get all users fun');
    allUsersModel = await UserService.getAllUsers();

    notifyListeners();
  }

  Future deleteUser(int id) async{
      await UserService.deleteUser(id);
      getAllUsers();
  }

 Future updateUser(TheUsers theUsers) async{
    await UserService.updateUser(theUsers);
      getAllUsers();


 }

}