import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tre_app/auth/auth_manager.dart';
import 'package:tre_app/models/auth/auth_request.dart';
import 'package:tre_app/service/auth_service.dart';

class LoginController extends GetxController {
  late final AuthService _authService;
  late final AuthManager _authManager;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _authService = Get.put(AuthService());
    _authManager = Get.find();
  }

  Future<void> loginUser() async {
    String email = this.email.text;
    String password = this.password.text;

    final response = await _authService
        .fetchLogin(AuthRequestModel(email: email, password: password));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token, response.user);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}