import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container contactCart(IconData icon,String text) {
  return Container(
    height: Get.height * 0.3,
    width: Get.width * 0.8,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size: Get.height * 0.06,),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(text,style: TextStyle(
              fontSize: Get.height * 0.02,color: Colors.black,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,)

        ],
      ),
    ),
  );
}
