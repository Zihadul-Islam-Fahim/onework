import 'package:get/get.dart';
import 'package:onework2/data/controller/apply_controller.dart';
import 'package:onework2/data/controller/bottom_nav_controller.dart';
import 'package:onework2/data/controller/business_area_controller.dart';
import 'package:onework2/data/controller/contact_controller.dart';
import 'package:onework2/data/controller/container_ontap_controller.dart';
import 'package:onework2/data/controller/login_controller.dart';
import 'package:onework2/data/controller/signup_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(BusinessAreaController());
    Get.put(ContainerOnTapController());
    Get.put(LoginController());
    Get.put(SignupController());
    Get.put(ContactController());
    Get.put(ApplyController());

  }
}