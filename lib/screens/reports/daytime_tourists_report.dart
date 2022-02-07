import 'package:flutter/material.dart';
import 'package:tre_app/custom/app_bar.dart';

class DaytimeTouristsReport extends StatelessWidget {

  DaytimeTouristsReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Report"),
      body: SafeArea(
        child: Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
