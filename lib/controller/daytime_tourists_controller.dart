import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tre_app/helper/session.dart';
import 'dart:convert';
import 'package:tre_app/models/daytime_tourist.dart';
import 'package:tre_app/models/residences.dart';
import 'package:uuid/uuid.dart';

class DaytimeTouristController extends GetxController {
  var uuid = const Uuid();
  var daytimeTouristModel = DaytimeTouristsModel();
  final _residences = <Residences>[].obs;

  TextEditingController month = TextEditingController();
  TextEditingController provinceMale = TextEditingController();
  TextEditingController provinceFemale = TextEditingController();
  TextEditingController otherProvinceMale = TextEditingController();
  TextEditingController otherProvinceFemale = TextEditingController();
  TextEditingController ageA = TextEditingController();
  TextEditingController ageB = TextEditingController();
  TextEditingController ageC = TextEditingController();
  TextEditingController ageD = TextEditingController();

  List<Residences>? get residences {
    if(_residences.isNotEmpty) {
      return _residences.toList();
    } else {
      return [];
    }
  }

  void addResidence(String country, int male, int female){
    _residences.add(Residences(id: uuid.v4(), country: country, male: male, female: female));
    _residences.refresh();
  }

  Future<void> submitData() async {
    daytimeTouristModel.provinceMale = provinceMale.text;
    daytimeTouristModel.provinceFemale = provinceFemale.text;
    daytimeTouristModel.otherProvinceMale = otherProvinceMale.text;
    daytimeTouristModel.otherProvinceFemale = otherProvinceFemale.text;
    daytimeTouristModel.countAgeA = ageA.text;
    daytimeTouristModel.countAgeB = ageB.text;
    daytimeTouristModel.countAgeC = ageC.text;
    daytimeTouristModel.countAgeD = ageD.text;

    var json = {
      'month': daytimeTouristModel.month,
      'provinceMale': daytimeTouristModel.provinceMale,
      'provinceFemale': daytimeTouristModel.provinceFemale,
      'otherProvinceMale': daytimeTouristModel.otherProvinceMale,
      'otherProvinceFemale': daytimeTouristModel.otherProvinceFemale,
      'countAgeA': daytimeTouristModel.countAgeA,
      'countAgeB': daytimeTouristModel.countAgeB,
      'countAgeC': daytimeTouristModel.countAgeC,
      'countAgeD': daytimeTouristModel.countAgeD,
      'residences': mapResidence()
    };

    print(json);
    try{
      print("sending..");
      String url = "http://tre.rcjsolutions.com/api/daytime_tourists";
       http.Response response = await http.post(Uri.parse(url), body: jsonEncode(json), headers: headers);
        print(jsonDecode(response.body));
    }catch(e){
      e.printError();
    }
  }

  List<Map<String, dynamic>> mapResidence(){
    List<Map<String, dynamic>> json = [];

    if(_residences.isNotEmpty){
      for (var data in _residences) {
        json.add({'country': data.country, 'male': data.male, 'female': data.female });
      }
    }

    return json;
  }
  void read() async {

  }
}