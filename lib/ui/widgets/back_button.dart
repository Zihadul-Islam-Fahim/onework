import 'package:flutter/material.dart';
import 'package:get/get.dart';

InkWell backButton() {
  return InkWell(
    onTap: () {
      Get.back();
    },
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[400]),
      child: const Center(child: Icon(Icons.arrow_back)),
    ),
  );
}
