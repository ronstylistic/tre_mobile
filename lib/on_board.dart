import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tre_app/auth/auth_manager.dart';
import 'package:tre_app/home.dart';
import 'package:tre_app/login.dart';
import 'package:tre_app/models/menu.dart';
import 'package:tre_app/models/user.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthManager _authManager = Get.find();
    return Obx(() {
      return _authManager.isLogged.value ? HomeScreen() : Login();
    });
  }
}