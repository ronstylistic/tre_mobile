import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:tre_app/custom/app_bar.dart';
import 'package:tre_app/custom/report_card_item.dart';
import 'package:tre_app/models/menu.dart';

class Reports extends StatelessWidget {
  final String title;
  const Reports({
    Key? key,
    required this.title
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Reports"),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: GridView.builder(
              padding: const EdgeInsets.all(customPadding),
              itemCount: reportMenus.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
                crossAxisCount: 2,
                mainAxisSpacing: customPadding / 2,
                crossAxisSpacing: customPadding / 2,
              ),
              itemBuilder: (context, index) => ReportCardItem(menu: reportMenus[index])
          ),
        ),
      ),
    );
  }
}
