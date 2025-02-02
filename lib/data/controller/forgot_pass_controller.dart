import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/models/network_response.dart';
import 'package:onework2/data/services/network_caller.dart';
import 'package:onework2/data/utilities/urls.dart';

class ForgotPassController extends GetxController {
  bool inProgress = false;

  Future<bool> sendOTP(String email) async {
    inProgress = true;
    update();

    Map<String, dynamic> inputParams = {
      "email": email,
    };
    try {
      final NetworkResponse response =
          await NetworkCaller().postRequest(Urls.sendOTP, body: inputParams);
      if (response.isSuccess) {
        inProgress = false;
        update();
        return true;
      } else if (response.statusCode == 422) {
        Get.snackbar(
            "The selected email is invalid", "Try with an registered email",
            backgroundColor: Colors.red, colorText: Colors.white);
        inProgress = false;
        update();
        return false;
      } else {
        Get.snackbar(response.responseData["message"].toString(), "Try again",
            backgroundColor: Colors.red, colorText: Colors.white);
        inProgress = false;
        update();
        return false;
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar('Something went wrong!', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
      inProgress = false;
      update();
      return false;
    }
  }
}
