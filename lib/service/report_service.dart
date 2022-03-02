import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/dynamic_extensions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class ReportService {
  final String url = 'https://tre-app-server.herokuapp.com';

  Future<void> downloadDaytimeTouristReport(BuildContext context) async {
    String fileName = "DAYTIME_TOURISTS.xlsx";
    String savePath = await getFilePath();

    /*Map<String, String> headers = {"observe": "response", "responseType": "blob"};

    var response = await http.get(Uri.parse(url + "/report"), headers: {"Content-type": "application/json"});

    if(response.statusCode == 200){
      Directory tempDir = await getApplicationDocumentsDirectory();
      String path = tempDir.path;
      File file = File('$path/$fileName');
      print(file.path);
      await file.writeAsBytes(response.bodyBytes);
    }*/


    Dio dio = Dio();
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Downloading...');
    try{
      var response = dio.download(
        url + "/report",
        '$savePath/$fileName',
          onReceiveProgress: (rcv, total) {
          int progress  = (((rcv / total) * 100).toInt());
          pd.update(value: progress);
        },
        deleteOnError: true,
      );
    }catch(e) {
      e.printError();
    }
  }

  Future<String> getFilePath() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory() //FOR ANDROID
        : await getApplicationDocumentsDirectory(); //FOR iOS

    return directory!.path;
  }
}