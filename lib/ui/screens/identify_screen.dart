import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:onework2/ui/widgets/back_button.dart';
import 'package:onework2/ui/widgets/select_role_tile.dart';

class IdentifyScreen extends StatelessWidget {
  const IdentifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    backButton(),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(2),
                          height: Get.height * 0.007,
                          width: Get.width * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        Container(
                          margin: const EdgeInsets.all(4),
                          height: Get.height * 0.007,
                          width: Get.width * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        Container(
                          margin: const EdgeInsets.all(4),
                          height: Get.height * 0.007,
                          width: Get.width * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        Container(
                          margin: const EdgeInsets.all(4),
                          height: Get.height * 0.007,
                          width: Get.width * 0.08,
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(14)),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const Text(
                  "Who you are?",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: Colors.black),
                ),
                const Text(
                  "Onework, at your side for your job search in mass distribution",
                  style: TextStyle(
                      fontSize: 13, fontFamily: 'poppins', color: Colors.black),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                selectRoleTile(false,Icons.shopping_bag, 'Business Area',
                    "Onework processes your requests as quickly as possible"),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                selectRoleTile(false,CupertinoIcons.person, 'I am a candidate',
                    "Apply to access Onework’s offers in mass distribution")
              ],
            ),
          )),
    );
  }
}
