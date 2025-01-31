import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import '../utilities/urls.dart';

class ApplyController extends GetxController {
  bool inProgress = false;
  bool hasCV = false;
  File? file;
  String? cv;
  String? fileInBase64;


  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      hasCV = true;
      update();
      file = File(result.files.single.path!);
    } else {}
  }


  Future<bool> sendInfo(
      {required String name, required String email, required String phone, required String cId,  required String des, required String fName,}) async {
    try {
      inProgress = true;
      update();
      // Open image files
      final cvFile = await File(file!.path).readAsBytes();


      // Create multipart request
      var uri = Uri.parse(Urls.candidatesApply);
      var request = http.MultipartRequest('POST', uri);

      // Attach fields
      request.fields['name'] = name;
      request.fields['first_name'] = fName;
      request.fields['email'] = email;
      request.fields['phone'] = phone;
      request.fields['description'] = des;
      request.fields['category_id'] = cId;


      // Attach files
      request.files.add(http.MultipartFile.fromBytes(
        'cv_file',
        cvFile,
        filename: path.basename(file!.path),
      ));


      // Send the request
      var streamedResponse = await request.send();

      // Handle response
      var response = await http.Response.fromStream(streamedResponse);


      if (response.statusCode == 200) {
        inProgress = false;
        update();

        log(response.statusCode.toString());
        log(response.body);
        Get.snackbar('Success', "Apply Successful !!",
            backgroundColor: Colors.green, colorText: Colors.white);
        return true;
      } else {
        log(response.statusCode.toString());
        log(response.body);

        var p = jsonDecode(response.body);


        Get.snackbar('Something went wrong!', p["message"]!,
            backgroundColor: Colors.red, colorText: Colors.white);
        inProgress = false;
        update();

        return false;
      }
    } catch (e) {
      inProgress = false;
      update();
      return false;
    }
  }

  onFinished() async {
    // currentValue = 'What type of contract are you interested in?';
    file = null;
    hasCV = false;
    update();
  }

}



