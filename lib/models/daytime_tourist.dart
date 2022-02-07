import 'package:tre_app/models/residences.dart';

class DaytimeTouristsModel {
  String? id;
  String? month;
  String? provinceMale;
  String? provinceFemale;
  String? otherProvinceMale;
  String? otherProvinceFemale;
  String? countAgeA;
  String? countAgeB;
  String? countAgeC;
  String? countAgeD;
  List<Residences>? fCountryResidence;

  DaytimeTouristsModel({
    this.id,
    this.month,
    this.provinceMale,
    this.provinceFemale,
    this.otherProvinceMale,
    this.otherProvinceFemale,
    this.countAgeA,
    this.countAgeB,
    this.countAgeC,
    this.countAgeD,
    this.fCountryResidence
  });

  factory DaytimeTouristsModel.fromJson(Map<String, dynamic> json) {
    return DaytimeTouristsModel(
      id: json['id'],
      month: json['month'],
      provinceMale: json['provinceMale'],
      provinceFemale: json['provinceFemale'],
      otherProvinceMale: json['otherProvinceMale'],
      otherProvinceFemale: json['otherProvinceFemale'],
      countAgeA: json['countAgeA'],
      countAgeB: json['countAgeB'],
      countAgeC: json['countAgeC'],
      countAgeD: json['countAgeD'],
    );
  }
}