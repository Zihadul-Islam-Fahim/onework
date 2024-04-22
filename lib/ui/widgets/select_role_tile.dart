import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/ui/screens/identify_screen.dart';
import 'package:onework2/ui/screens/interest_screen.dart';

InkWell selectRoleTile(bool isIdentify,IconData icon, String title, String des,) {
  return InkWell(
    onTap: () {
      if(isIdentify){
        Get.to(()=>const IdentifyScreen() );
      }else{
        Get.to(()=>  InterestScreen());
      }

    },
    child: SizedBox(
      width: double.infinity,

      child: Row(
        children: [
          Expanded(
            flex: 27,
            child: CircleAvatar(
              backgroundColor: Colors.deepOrange[100],
              radius: 35,
              child: Icon(
                icon,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          Expanded(
            flex: 69,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  des,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                )
              ],
            ),
          ),
          const Expanded(flex: 10, child: Icon(Icons.arrow_forward))
        ],
      ),
    ),
  );
}
