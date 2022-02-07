import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tre_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:tre_app/helper/session.dart';
import 'dart:convert';
import 'package:tre_app/service/user_provider.dart';

class UserController extends GetxController {

  var userModel = UserModel();
  var isLoading = true.obs;
  var users = <UserModel>[].obs;

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController company = TextEditingController();

  clear() {
    firstname.clear();
    lastname.clear();
    email.clear();
    company.clear();
  }
  Future<bool> submitData() async {
    try{
      userModel.firstname = firstname.text;
      userModel.lastname = lastname.text;
      userModel.email = email.text;
      userModel.company = company.text;

      String url = "http://tre.rcjsolutions.com/api/user";
      http.Response response = await http.post(Uri.parse(url), body: jsonEncode(userModel.toJson()), headers: headers);

      if(response.statusCode == 200){
        var responseData = jsonDecode(response.body);
        userModel.id = responseData["data"];
        users.add(userModel);
        return responseData["success"] == true;
      }

    }catch(e){
      e.printError();
    }

    await Future.delayed(const Duration(seconds: 1), () => clear());
    return true;
  }

  void getUsers() async {
    try{
      isLoading.value = true;
      var result = await UserProvider.getUser();
      if(result != null){
        users.assignAll(result);
      }

    }catch(e){
      e.printError();
    } finally {
      isLoading.value = false;
    }
    update();
  }

  @override
  void onInit() {
    getUsers();
    // TODO: implement onInit
    super.onInit();
  }
}