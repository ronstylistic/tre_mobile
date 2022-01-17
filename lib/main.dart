import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tre_app/login.dart';

void main() {
  runApp(GetMaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false));
}

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: customTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}*/


