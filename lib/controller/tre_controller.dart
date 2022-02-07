import 'package:get/get.dart';
import 'package:tre_app/models/tre.dart';
import 'package:tre_app/service/tre_service.dart';
import 'package:flutter/material.dart';

class TreController extends GetxController {
  late String category;
  TextEditingController businessName = TextEditingController();
  TextEditingController contactPerson = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController otherInfo = TextEditingController();

  var isLoading = true.obs;
  var tres = <TreModel>[].obs;

  @override
  void onInit() {
    getTres();
    // TODO: implement onInit
    super.onInit();
  }

  Future<bool> submitData() async {
    try{
      TreModel treModel = TreModel();
      treModel.category = category;
      treModel.businessName = businessName.text;
      treModel.contactPerson = contactPerson.text;
      treModel.address = "";
      treModel.email = email.text;
      treModel.contactNumber = contactNumber.text;
      treModel.website = website.text;
      treModel.otherInfo = otherInfo.text;

      final response = await TreService()
          .addTre(treModel);

      if (response != null) {
        tres.add(response);
        return true;
      }
    }catch(e){
      e.printError();
      return false;
    }

    await Future.delayed(const Duration(seconds: 1), () => clear());
    return true;
  }

  void getTres() async {
    try{
      isLoading.value = true;
      var result = await TreService().getTre();
      if(result != null){
        tres.assignAll(result);
      }

    }catch(e){
      e.printError();
    } finally {
      isLoading.value = false;
    }
    update();
  }

  clear() {
    businessName.clear();
    contactNumber.clear();
    email.clear();
    contactPerson.clear();
    website.clear();
    otherInfo.clear();
  }
}