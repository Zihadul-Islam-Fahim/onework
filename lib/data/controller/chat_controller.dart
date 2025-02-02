import 'dart:developer';

import 'package:get/get.dart';
import 'package:onework2/data/controller/auth_controller.dart';
import 'package:onework2/data/models/message_model.dart';
import 'package:onework2/data/models/network_response.dart';
import 'package:onework2/data/services/network_caller.dart';

import '../utilities/urls.dart';

class ChatController extends GetxController{

  bool msgSending = false;

  List<MessageModel> msgList = [];


  Future<bool> sendMsg(String msg)async{

    msgSending = true;
    update();


    NetworkResponse networkResponse = await NetworkCaller().postRequest(Urls.sendMsg,body: {"message": msg});

    if(networkResponse.isSuccess){

      msgSending = false;
      update();

      return true;
    }else{

      msgSending = false;
      update();
      return false;
    }
  }


  getMsg()async{
   NetworkResponse networkResponse = await NetworkCaller().getRequest(Urls.getMsg,token: AuthController.token);

   log(networkResponse.responseData.toString());

   for(Map<String,dynamic> p in networkResponse.responseData){
     // log(p.message ?? 'null all');
     msgList.add(MessageModel.fromJson(p));
   }

  }
}