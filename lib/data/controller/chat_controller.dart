import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/auth_controller.dart';
import 'package:onework2/data/models/message_model.dart';
import 'package:onework2/data/models/network_response.dart';
import 'package:onework2/data/services/network_caller.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../utilities/urls.dart';
import 'inbox_controller.dart';

class ChatController extends GetxController{

  final ScrollController scrollController = ScrollController();
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

    msgList =  msgList.reversed.toList();
   debugPrint("------------- List reversed");

   Get.find<InboxController>().lastMsgChanged(msgList.last.message!);

   await initPusher();

  }



  final PusherChannelsFlutter pusher = PusherChannelsFlutter();
  String? channelName;

  Future<void> initPusher() async {
    debugPrint(AuthController.user!.user!.id.toString());
    channelName = 'chatChannel.${AuthController.user!.user!.id}';

    try {
      await pusher.init(
        apiKey: 'ad012c372ed42153296c',
        cluster: 'ap2',
        onConnectionStateChange: (String? previous, String? current) {
          debugPrint('Pusher Connection State Changed: $previous -> $current');
        },
        onError: (String message, int? code, dynamic e) {
          debugPrint('Pusher Error: $message (Code: $code)');
        },
      );

      await pusher.subscribe(
        channelName: channelName!,
        onEvent: (dynamic event) {
          debugPrint('Received event: ${event.eventName} -> ${event.data}');

          if (event.eventName == 'chatEvent') {
            Map<String, dynamic> chatData = jsonDecode(event.data);
            debugPrint('New chat: ${chatData['message']}');
            msgList.add(MessageModel(type: (chatData["is_admin"] == true) ? "admin" : 'user', message: chatData['message']));

            Future.delayed(const Duration(milliseconds: 100), () {
              if (scrollController.hasClients) {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            });

            Get.find<InboxController>().lastMsgChanged(chatData['message']);
            update();

          } else {}
        },
      );

      await pusher.connect();
      debugPrint('Connected to Pusher and subscribed to $channelName');
    } catch (e) {
      debugPrint('Pusher initialization error: $e');
    }
  }


}