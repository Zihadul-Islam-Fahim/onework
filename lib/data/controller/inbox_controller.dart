import 'package:get/get.dart';

class InboxController extends GetxController{

  String lastMsg = "Get Support";

  lastMsgChanged(String msg){
    lastMsg = msg;
    update();
  }

}