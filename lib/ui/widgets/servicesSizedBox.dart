import 'package:flutter/material.dart';
import 'package:get/get.dart';

SizedBox servicesSizedBox(
    double width, String imagePath, String title, String des) {
  return SizedBox(
    width: width * 0.42,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset(
                imagePath,
                width: width * 0.09,
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: "poppins"),
            ),
            SizedBox(
              height: Get.height * 0.008,
            ),
            Text(
              des,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black, fontSize: 8, fontFamily: 'poppins'),
            ),
          ],
        ),
      ),
    ),
  );
}
