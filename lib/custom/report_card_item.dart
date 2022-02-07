import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:tre_app/models/menu.dart';
import 'package:tre_app/screens/account.dart';
import 'package:get/get.dart';
import 'package:tre_app/screens/reports/daytime_tourists_report.dart';
import 'package:tre_app/screens/tre/daytime_tourists.dart';
import 'package:tre_app/screens/tre/inbound.dart';
import 'package:tre_app/screens/tre/mice.dart';
import 'package:tre_app/screens/tre/overnight_guests.dart';

class ReportCardItem extends StatelessWidget {
  final Menu menu;

  const ReportCardItem({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        switch(menu.id){
          case 1:
            Get.to(() => DaytimeTouristsReport());
            break;
          case 2:
            Get.to(() => DaytimeTouristsReport());
            break;
          case 3:
            Get.to(() => DaytimeTouristsReport());
            break;
          case 4:
            Get.to(() => DaytimeTouristsReport());
            break;
          case 5:
            Get.to(() => DaytimeTouristsReport());
            break;
          default:
            break;
        }
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(customPadding / 2),
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: customTextColor, width: 2.0)
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: customPadding / 4),
                child: Text(
                  // products is out demo list
                  menu.text,
                  style: const TextStyle(color: customTextDarkColor,
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
