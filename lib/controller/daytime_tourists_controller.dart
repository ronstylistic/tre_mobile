import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
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
    daytimeTouristModel.countAgeA = int.parse(ageA.text);
    daytimeTouristModel.countAgeB = int.parse(ageB.text);
    daytimeTouristModel.countAgeC = int.parse(ageC.text);
    daytimeTouristModel.countAgeD = int.parse(ageD.text);

    var json = {
      'id': daytimeTouristModel.id,
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

    try{
      String url = "http://tre.rcjsolutions.com/api/daytime_tourists";
      var response = await post(Uri.parse(url), body: json);
      print(response);
    }catch(e){
    }
  }

  List<Map<String, dynamic>> mapResidence(){
    List<Map<String, dynamic>> json = [];

    if(_residences.isNotEmpty){
      for(int i = 0; i < _residences.length; i++){
        json.add(
          { 'country': _residences[i].country, 'male': _residences[i].male, 'female': _residences[i].female }
        );
      }
    }

    return json;
  }
  void read() async {

  }
}