import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/models/network_response.dart';
import 'package:onework2/data/services/network_caller.dart';
import 'package:onework2/data/utilities/urls.dart';

class SetNewPassController extends GetxController{

  bool inProgress = false;


  Future<bool> setNewPass(String otp,String newPass,String cPass) async {
    inProgress =true;
    update();

    Map<String,dynamic> inputParams ={
      "otp": otp,
      "new_password":newPass,
      "confirm_password": cPass

    };
    try{
      final NetworkResponse response = await NetworkCaller().postRequest(
          Urls.setNewPass, body: inputParams);
      if (response.isSuccess) {

        inProgress = false;
        update();
        return true;
      } else {

        Get.snackbar(
            response.responseData["message"].toString(), "Try again", backgroundColor: Colors.red,
            colorText: Colors.white);
        inProgress = false;
        update();
        return false;
      }
    }catch(e){
      log(e.toString());
      Get.snackbar('Something went wrong!',e.toString(),backgroundColor: Colors.red,colorText: Colors.white);
      inProgress = false;
      update();
      return false;
    }


  }

}