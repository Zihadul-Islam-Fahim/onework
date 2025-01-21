import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/models/network_response.dart';
import '../services/network_caller.dart';
import '../utilities/urls.dart';

class ContactController extends GetxController{
  bool inProgress = false;
  String? msg;

  Future<bool> sendContactInfo(
      {required String email, required String phone, String? msg, required String name}) async {
    inProgress =true;
    update();

    Map<String,dynamic> inputParams ={
      "name":name,
      "email":email,
      'phone':phone,
      'message': msg
    };
try{
    final NetworkResponse response = await NetworkCaller().postRequest(Urls.contact,body: inputParams);
    if(response.isSuccess){

      Get.snackbar('Success',response.responseData["message"],backgroundColor: Colors.green,colorText: Colors.white);
      inProgress= false;
      update();
      return true;
    }else{
      Get.snackbar('Something went wrong!',response.responseData["message"],backgroundColor: Colors.red,colorText: Colors.white);
      inProgress= false;
      update();
      return false;
    }
}catch(e){
  Get.snackbar('Something went wrong!',e.toString(),backgroundColor: Colors.red,colorText: Colors.white);
  inProgress = false;
  update();
  return false;
}
  }
}