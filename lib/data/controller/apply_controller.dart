import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/models/network_response.dart';
import 'package:onework2/data/services/network_caller.dart';
import '../utilities/urls.dart';

class ApplyController extends GetxController {
  bool inProgress = false;
  bool hasCV = false;
  File? file;
  String? cv;
  String? fileInBase64;
  List<String> catrgoryList = [
    'Quel type de contrat vous intéresse ?',
    "Boucherie",
    'Boulangerie',
    "Posspmmeroe",
    "Charcuterie",
    'Fromagierie',
    "Responsale de rayon",
    'Cassie'
  ];
  String currentValue = 'Quel type de contrat vous intéresse ?';

  dropDownOnChanged(newValue) {
    currentValue = newValue;
    update();
  }


  pickFile()async{
    FilePickerResult? result =
    await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
        hasCV = true;
        update();
      file = File(result.files.single.path!);
    } else {}
  }

  Future<bool> sendInfo(String name, String fullName, String email,
      String phone, String aboutProject) async {
    inProgress = true;
    update();

    try {
    if (file != null) {
        List<int> cvFile = await file!.readAsBytes();
        fileInBase64 = base64Encode(cvFile);
        cv = fileInBase64;
      }

      Map<String, dynamic> inputParams = {
        "cv": cv,
        "name": name,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "type": currentValue,
        "aboutProject": aboutProject
      };

      NetworkResponse response =
          await NetworkCaller().postRequest(Urls.apply, body: inputParams);
      if (response.isSuccess) {
        inProgress = false;
        update();
        return true;
      } else {
        Get.snackbar('Something went wrong!', "Try again",
            backgroundColor: Colors.red, colorText: Colors.white);
        inProgress = false;
        update();
        return false;
      }
    } catch (e) {
      Get.snackbar(
          'Something went wrong!', "Try again after check internet connection",
          backgroundColor: Colors.red, colorText: Colors.white);
      inProgress = false;
      update();
      return false;
    }
  }

  onFinished()async{
   currentValue =
    'Quel type de contrat vous intéresse ?';
    file = null;
    hasCV = false;
    update();
  }
}
