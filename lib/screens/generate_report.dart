import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:tre_app/controller/report_controller.dart';
import 'package:tre_app/custom/app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import '../constant.dart';

class GenerateReport extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ReportController reportController = Get.put(ReportController());
  GenerateReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Generate Report"),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(customPadding),
                child:DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select Month of Report',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  items: months
                      .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Select Month of Report';
                    }
                  },
                  onChanged: (String? newValue) {
                    //daytimeTouristController.daytimeTouristModel.month = newValue;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: customPadding),
                child:DropdownButtonFormField2(
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select Month of Report',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  items: months
                      .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Select Company';
                    }
                  },
                  onChanged: (String? newValue) {
                    //daytimeTouristController.daytimeTouristModel.month = newValue;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(customPadding),
                child: SizedBox(
                  width: Get.width,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: customTextColor,
                          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final status = await Permission.storage.request();

                          if(status.isGranted){
                            reportController.downloadDaytimeReport(context);
                          }

                          /*if(await userController.submitData()){
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User Successfully Added')));
                          }*/
                        }
                      },
                      child: const Text('Generate and Download')
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
