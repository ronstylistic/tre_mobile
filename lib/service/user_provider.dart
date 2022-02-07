import 'dart:async';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:tre_app/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  static var client = http.Client();
  /*Future<List<UserModel>> getUser() async{
    final response = await get('http://tre.rcjsolutions.com/api/get_users');
    if(response.status.hasError){
      return Future.error(response.statusText!);
    } else {
      var json = jsonDecode(response.body);
      List data = json["data"];
      return data.map((e) => UserModel.fromJson(e)).toList();
    }
  }*/
  static Future<List<UserModel>?> getUser() async{
    try {
      var response = await client
          .get(Uri.parse('http://tre.rcjsolutions.com/api/get_users'))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("connection time out try again");
      });

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        List data = json["data"];
        return data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        return null;
      }

    } on TimeoutException catch (e){
      e.printError();
    }
  }
}