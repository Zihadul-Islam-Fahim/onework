import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/ui/screens/apply_screen.dart';

InkWell applyImageContainer(String imagePath, String name) {
  return InkWell(
    onTap: () {
      Get.to(() => const ApplyScreen());
    },
    child: Container(
      height: Get.height * 0.3,
      width: double.infinity * 0.4,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: Get.height * 0.036,
          color: Colors.black.withOpacity(0.3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
