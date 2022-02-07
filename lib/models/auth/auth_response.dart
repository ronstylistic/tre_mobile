import 'package:tre_app/models/user.dart';

class AuthResponseModel {
  bool? success;
  String? message;
  String? token;
  UserModel? user;

  AuthResponseModel({this.token, this.user, this.success});

  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    message = json['message'];
    user = UserModel.fromJson(json['user']);
  }
}