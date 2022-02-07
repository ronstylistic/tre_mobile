import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:tre_app/models/tre.dart';

class TreService extends GetConnect {
  final String url = 'http://tre.rcjsolutions.com/api';

  Future<TreModel?> addTre(TreModel model) async {
    final response = await post(url + "/tre", model.toJson());
    print(response.body);
    if (response.statusCode == HttpStatus.ok) {
      var json = response.body;
      model.id = json["data"];
      return model;
    } else {
      return null;
    }
  }

  Future<List<TreModel>?> getTre() async {
    final response = await get(url + "/get_tres");
    if (response.statusCode == HttpStatus.ok) {
      List data = response.body["data"];
      return data.map((e) => TreModel.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}