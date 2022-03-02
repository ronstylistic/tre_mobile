import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:tre_app/custom/app_bar.dart';
import 'package:tre_app/custom/card_item.dart';
import 'package:tre_app/models/menu.dart';
import 'package:get/get.dart';
import 'auth/auth_manager.dart';

class HomeScreen extends StatelessWidget {
  AuthManager _authManager = Get.find();
  HomeScreen({Key? key}) : super(key: key);
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
              child: Obx(() {
                return GridView.builder(
                    padding: const EdgeInsets.all(customPadding),
                    itemCount: _authManager.homeMenu.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
                      crossAxisCount: 2,
                      mainAxisSpacing: customPadding / 2,
                      crossAxisSpacing: customPadding / 2,
                    ),
                    itemBuilder: (context, index) => CardItem(menu: _authManager.homeMenu[index])
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
