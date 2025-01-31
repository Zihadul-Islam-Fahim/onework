import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/services/network_caller.dart';
import 'package:onework2/data/utilities/urls.dart';

import '../models/network_response.dart';

class BusinessAreaController extends GetxController {
  bool inProgress = false;

 Future<bool> businessApply(
      {required String cName, required String name, required String email, required String phone, required String cId, required String des}) async {
    inProgress = true;
    update();

    Map<String, dynamic> inputParams = {

      "company_name": cName,
      'name':name,
      'email': email,
      "phone": phone,
      "category_id": cId,
      'description': des
    };
    try {
      NetworkResponse response = await NetworkCaller().postRequest(
          Urls.businessApply, body: inputParams);

      if (response.isSuccess) {
        Get.snackbar('Success', response.responseData['message'],
            backgroundColor: Colors.green, colorText: Colors.white);

        inProgress = false;
        update();

        return true;
      } else {
        Get.snackbar('Something went wrong!', "Try again",
            backgroundColor: Colors.red, colorText: Colors.white);
        inProgress = false;
        update();

        return false;

      }
    }catch(e){
      Get.snackbar('Something went wrong!', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
      inProgress = false;
      update();

      return false;
    }
  }
}