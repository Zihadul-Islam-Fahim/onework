import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/models/network_response.dart';
import '../services/network_caller.dart';
import '../utilities/urls.dart';

class ContactController extends GetxController{
  bool inProgress = false;

  Future<bool> sendContactInfo(String email,String phone) async {
    inProgress =true;
    update();

    Map<String,dynamic> inputParams ={
      "email":email,
      'phone':phone
    };
try{
    final NetworkResponse response = await NetworkCaller().postRequest(Urls.contact,body: inputParams);
    if(response.isSuccess){
      Get.snackbar('Success','Information sent',backgroundColor: Colors.green,colorText: Colors.white);
      inProgress= false;
      update();
      return true;
    }else{
      Get.snackbar('Something went wrong!',"Try again",backgroundColor: Colors.red,colorText: Colors.white);
      inProgress= false;
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