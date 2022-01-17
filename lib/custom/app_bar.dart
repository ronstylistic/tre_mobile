import 'package:flutter/material.dart';

import '../constant.dart';

AppBar buildAppBar(String title){
  return AppBar(
    backgroundColor: customPrimaryColor,
    elevation: 0,
    title : Text(title,
        style: const TextStyle(color: Colors.white)
    ),
    leading: const BackButton(
        color: Colors.white
    ),
    actions: <Widget> [
      IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: const Icon(Icons.menu)
      ),
      const SizedBox(width: customPadding / 2)
    ],
  );
}