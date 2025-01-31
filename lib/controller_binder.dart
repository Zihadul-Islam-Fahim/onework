import 'package:get/get.dart';
import 'package:onework2/data/controller/apply_controller.dart';
import 'package:onework2/data/controller/auth_controller.dart';
import 'package:onework2/data/controller/bottom_nav_controller.dart';
import 'package:onework2/data/controller/business_area_controller.dart';
import 'package:onework2/data/controller/category_controller.dart';
import 'package:onework2/data/controller/chat_controller.dart';
import 'package:onework2/data/controller/contact_controller.dart';
import 'package:onework2/data/controller/container_ontap_controller.dart';
import 'package:onework2/data/controller/login_controller.dart';
import 'package:onework2/data/controller/signup_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(AuthController());
    Get.put(LoginController());
    Get.put(SignupController());
    Get.put(BusinessAreaController());
    Get.put(ContainerOnTapController());
    Get.put(ContactController());
    Get.put(CategoryController());
    Get.put(ApplyController());
    Get.put(ChatController());
  }
}