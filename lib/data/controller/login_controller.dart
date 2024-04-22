import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/models/network_response.dart';
import 'package:onework2/data/services/network_caller.dart';
import 'package:onework2/data/utilities/urls.dart';

class LoginController extends GetxController{
  bool inProgress = false;
  
  Future<bool> login(String email,String password) async {
    inProgress =true;
    update();

    Map<String,dynamic> inputParams ={
      "email":email,
      'password':password
    };
    try{
    
     final NetworkResponse response = await NetworkCaller().postRequest(Urls.login,body: inputParams);
     if(response.isSuccess){
       inProgress= false;
       update();
       return true;
     }else{
       Get.snackbar('Failed',response.msg,backgroundColor: Colors.red,colorText: Colors.white);
       inProgress= false;
       update();
       return false;
     }
    }catch(e){
      Get.snackbar('Something went wrong!',"Try again....",backgroundColor: Colors.red,colorText: Colors.white);
      inProgress = false;
      update();
      return false;
    }
  }
  
}