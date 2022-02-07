import 'package:flutter/material.dart';
import 'package:tre_app/auth/auth_manager.dart';
import 'package:get/get.dart';
import '../constant.dart';

AppBar buildAppBar(String title){
  return AppBar(
    backgroundColor: customPrimaryColor,
    elevation: 0,
    title : Text(title,
        style: const TextStyle(color: Colors.white)
    ),
    leading: const BackButton(
        color: Colors.white
    ),
    /*actions: <Widget> [
      IconButton(
          color: Colors.white,
          onPressed: () {
            _authManager.logOut();
          },
          icon: const Icon(Icons.menu)
      ),
      const SizedBox(width: customPadding / 2)
    ],*/
  );
}

AppBar homeAppBar(){
  AuthManager _authManager = Get.find();

  return AppBar(
    backgroundColor: customPrimaryColor,
    elevation: 0,
    title : const Text("Home",
        style: TextStyle(color: Colors.white)
    ),
    leading: const BackButton(
        color: Colors.white
    ),
    actions: <Widget> [
      IconButton(
          color: Colors.white,
          onPressed: () {
            _authManager.logOut();
          },
          icon: const Icon(Icons.logout)
      ),
      const SizedBox(width: customPadding / 2)
    ],
  );
}

