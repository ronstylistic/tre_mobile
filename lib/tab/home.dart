import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tre_app/constant.dart';
import 'package:tre_app/controller/login_controller.dart';
import 'package:tre_app/custom/card_item.dart';
import 'package:tre_app/custom/user_card_item.dart';
import 'package:tre_app/models/menu.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.webp"),
                fit: BoxFit.cover
            ),
          ),
          child: null,
        ),
        Container(
          alignment: Alignment.center,
          child: GridView.builder(
              padding: const EdgeInsets.all(customPadding),
              itemCount: loginController.isAdmin() ? menus.length : userMenus.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
                crossAxisCount: 2,
                mainAxisSpacing: customPadding / 2,
                crossAxisSpacing: customPadding / 2,
              ),
              itemBuilder: (context, index) => loginController.isAdmin() ? CardItem(menu: menus[index]) : UserCardItem(menu: userMenus[index])
          ),
        ),
      ],
    );
  }
}
