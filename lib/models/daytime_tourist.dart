import 'package:tre_app/models/residences.dart';

class DaytimeTouristsModel {
  String? id;
  String? month;
  String? provinceMale;
  String? provinceFemale;
  String? otherProvinceMale;
  String? otherProvinceFemale;
  int? countAgeA;
  int? countAgeB;
  int? countAgeC;
  int? countAgeD;
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
}