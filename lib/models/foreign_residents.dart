import 'package:flutter/cupertino.dart';

class ForeignResidents {
  final String country;
  final int? male;
  final int? female;
  final int id;

  var maleController = TextEditingController();
  var femaleController = TextEditingController();
  var countryController = TextEditingController();

  ForeignResidents({
    required this.id,
    required this.country,
    this.male,
    this.female
  });
}

List<ForeignResidents> foreignResidents = [
  ForeignResidents(id: 1, country: "Country 1", male: 0)
];