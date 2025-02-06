import 'package:get/get.dart';

class InboxController extends GetxController{

  String lastMsg = "Get Support";

  bool isMsgRead = true;
  bool isUser = false;

  msgByUser(bool v){
    isUser = v;
    update();
  }

  newMsg(bool v){
    isMsgRead = v;
    update();
  }

  lastMsgChanged(String msg){
    lastMsg = msg;
    update();
  }

}