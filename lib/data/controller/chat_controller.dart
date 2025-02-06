import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/auth_controller.dart';
import 'package:onework2/data/models/message_model.dart';
import 'package:onework2/data/models/network_response.dart';
import 'package:onework2/data/services/network_caller.dart';
import 'package:onework2/data/services/notification_service.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../ui/screens/auth/login_screen.dart';
import '../../ui/widgets/bottom_sheet.dart';
import '../utilities/urls.dart';
import 'inbox_controller.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class ChatController extends GetxController{

  final ScrollController scrollController = ScrollController();
  final inboxController =  Get.find<InboxController>();
  bool msgSending = false;
  File? imageFile;
  bool imageLoading = false;
  List<MessageModel> msgList = [];

  final PusherChannelsFlutter pusher = PusherChannelsFlutter();
  String? channelName;

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

  checkerPusherStatus()async{
    if(pusher.connectionState != 'CONNECTED'){
      await getMsg();
    }else{
      log('Pusher already Connected');
    }
  }


  getMsg()async{
   NetworkResponse networkResponse = await NetworkCaller().getRequest(Urls.getMsg,token: AuthController.token);

   log(networkResponse.responseData.toString());

   msgList = [];

   for(Map<String,dynamic> p in networkResponse.responseData){

     msgList.add(MessageModel.fromJson(p));
   }

    msgList =  msgList.reversed.toList();

   inboxController.lastMsgChanged(msgList.last.message ?? "Photo");



   if(msgList.last.type == 'admin'){
     inboxController.newMsg(false);

   }else{
     inboxController.msgByUser(true);
     inboxController.newMsg(true);
   }


   await initPusher();
  }



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

            if(chatData["is_admin"] == true){
              inboxController.newMsg(false);
              inboxController.msgByUser(false);

              NotificationService().showNotification(id: 1, title: "Onework Support", body: chatData["message"] ?? "Photo");

              // final player = AudioPlayer();
              // player.play(AssetSource('audio/msg_recieve.mp3'));
            }else{
              inboxController.msgByUser(true);

            }

            msgList.add(MessageModel(type: (chatData["is_admin"] == true) ? "admin" : 'user', message: chatData['message'],isFile: chatData["is_file"],file: chatData["file"]));

            Future.delayed(const Duration(milliseconds: 100), () {
              if (scrollController.hasClients) {
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            });

            inboxController.lastMsgChanged(chatData['message'] ?? "Photo");
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

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
     // allowedExtensions: ['pdf'],
    );

    if (result != null) {
      update();
      imageFile = File(result.files.single.path!);
      openBottomSheet();
    } else {}
  }

  sendImageFile() async {
    try {
      imageLoading = true;
      update();

      final image = await File(imageFile!.path).readAsBytes();

      // Create multipart request
      var uri = Uri.parse(Urls.sendMsg);
      var request = http.MultipartRequest('POST', uri);

      // Attach fields
     // request.fields['message'] = "Image";

      // Attach files
      request.files.add(http.MultipartFile.fromBytes(
        'file',
        image,
        filename: path.basename(imageFile!.path),
      ));

      // Add Authorization Bearer Token
      String token = AuthController.token!; // Replace with your actual token
      request.headers['Authorization'] = 'Bearer $token';

      // Send the request
      var streamedResponse = await request.send();

      // Handle response
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        imageLoading = false;
        update();

        log(response.statusCode.toString());
        log(response.body);
        Get.back();

        return true;
      }else if(response.statusCode == 401){
        imageLoading = false;
        update();
        Get.offAll(()=> const LoginScreen());

      } else {
        log(response.statusCode.toString());
        log(response.body);

        var p = jsonDecode(response.body);

        Get.snackbar('Something went wrong!', p["message"]!,
            backgroundColor: Colors.red, colorText: Colors.white);
        imageLoading = false;
        update();

        return false;
      }
    } catch (e) {
      imageLoading = false;
      update();
      return false;
    }
  }


  

}