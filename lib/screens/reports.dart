import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';

class Reports extends StatelessWidget {
  final String title;
  const Reports({
    Key? key,
    required this.title
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(color: customTextColor),
        ),
        leading: const BackButton(
            color: customTextColor
        ),
      ),
    );
  }
}
