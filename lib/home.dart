import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tre_app/constant.dart';
import 'package:tre_app/custom/app_bar.dart';
import 'package:tre_app/custom/card_item.dart';
import 'package:tre_app/custom/user_card_item.dart';
import 'package:tre_app/models/menu.dart';
import 'package:tre_app/models/user.dart';

class HomeScreen extends StatelessWidget {
  final UserModel? userModel;
  const HomeScreen({Key? key, this.userModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: SafeArea(
        child: Stack(
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
                  itemCount: userModel!.isAdmin() ? menus.length : userMenus.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
                    crossAxisCount: 2,
                    mainAxisSpacing: customPadding / 2,
                    crossAxisSpacing: customPadding / 2,
                  ),
                  itemBuilder: (context, index) => userModel!.isAdmin() ? CardItem(menu: menus[index]) : UserCardItem(menu: userMenus[index])
              ),
            ),
          ],
        ),
      ),
    );
  }
}
