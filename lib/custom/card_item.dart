import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:tre_app/models/menu.dart';
import 'package:tre_app/screens/account.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tre_app/screens/help.dart';
import 'package:tre_app/screens/manage_database.dart';
import 'package:tre_app/screens/manage_tre.dart';
import 'package:tre_app/screens/manage_user_account.dart';
import 'package:tre_app/screens/reports.dart';

class CardItem extends StatelessWidget {
  final Menu menu;

  const CardItem({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        switch(menu.id){
          case 1:
            Get.to(() => Account(title: menu.text));
            break;
          case 2:
            Get.to(() => ManageUserAccount(title: menu.text));
            break;
          case 3:
            Get.to(() => ManageTre(title: menu.text));
            break;
          case 4:
            Get.to(() => Reports(title: menu.text));
            break;
          case 5:
            Get.to(() => ManageDatabase(title: menu.text));
            break;
          case 6:
            Get.to(() => Help(title: menu.text));
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(customPadding / 2),
                child: SvgPicture.asset(menu.image ?? "", color: customTextColor)
              ),
            ),
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
