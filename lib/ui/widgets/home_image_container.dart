import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/ui/screens/select_role_screen.dart';


Container homeImageContainer(
  String imagePath,
  String title,
) {
  return Container(
    height: Get.height * 0.28,
    width: Get.width * 0.4,
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image:
            DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
    child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: Get.height * 0.11,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.black.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins'),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(()=> const SelectRoleScreen());
                  },
                  child: Container(
                    height: Get.height * 0.05,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const Center(
                        child: Text(
                      "Discover",
                      style: TextStyle(color: Colors.black),
                    )),
                  ),
                ),
              )
            ],
          ),
        )),
  );
}
