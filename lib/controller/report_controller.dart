import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tre_app/service/report_service.dart';

class ReportController extends GetxController {
  final ReportService _reportService = ReportService();

  Future<void> downloadDaytimeReport(BuildContext context) async {
    try{
      _reportService.downloadDaytimeTouristReport(context);
    }catch(e){
      e.printError();
    }
  }
}