import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/models/network_response.dart';
import 'package:onework2/data/services/network_caller.dart';
import 'package:onework2/data/utilities/urls.dart';

class SignupController extends GetxController{

  bool inProgress = false;

  Future<bool> signup(String name,String email,String password) async {
    inProgress =true;
    update();

    Map<String,dynamic> inputParams ={
      "name" : name,
      "email": email,
      'password':password
    };
    try{
      final NetworkResponse response = await NetworkCaller().postRequest(
          Urls.signup, body: inputParams);
      if (response.isSuccess) {
        Get.snackbar(
            'Signup Success', "Login Now", backgroundColor: Colors.green,
            colorText: Colors.white);
        inProgress = false;
        update();
        return true;
      } else {

        Get.snackbar(
            response.responseData["message"], "Try again", backgroundColor: Colors.red,
            colorText: Colors.white);
        inProgress = false;
        update();
        return false;
      }
    }catch(e){
      Get.snackbar('Something went wrong!',"Try again after check internet connection",backgroundColor: Colors.red,colorText: Colors.white);
      inProgress = false;
      update();
      return false;
    }


    }

}