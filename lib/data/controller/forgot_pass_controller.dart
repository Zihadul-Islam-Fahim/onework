import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/models/network_response.dart';
import 'package:onework2/data/services/network_caller.dart';
import 'package:onework2/data/utilities/urls.dart';

import '../models/userModel.dart';
import 'auth_controller.dart';

class ForgotPassController extends GetxController{

  bool inProgress = false;


  Future<bool> sendOTP(String name,String email,String phone,String password) async {
    inProgress =true;
    update();

    Map<String,dynamic> inputParams ={
      "name" : name,
      "email": email,
      "phone": phone,
      'password':password
    };
    try{
      final NetworkResponse response = await NetworkCaller().postRequest(
          Urls.register, body: inputParams);
      if (response.isSuccess) {

        String token = response.responseData["data"]["token"].toString();

        final NetworkResponse userResponse = await NetworkCaller().getRequest(Urls.user,token: token);
        if(userResponse.isSuccess){

        }else{

        }

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