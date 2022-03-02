import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tre_app/screens/tre/daytime_tourists.dart';

class DaytimeTouristService extends GetConnect {
  // Post request
  Future<Response> submitDaytimeTourist(Map data) => post("", data);

}