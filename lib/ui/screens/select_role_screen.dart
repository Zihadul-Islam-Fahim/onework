import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:onework2/ui/widgets/back_button.dart';
import 'package:onework2/ui/widgets/select_role_tile.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

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
              "Select Your Role",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  color: Colors.black),
            ),
            const Text(
              "We are here to support both both Large retail and hotel & catering ",
              style: TextStyle(
                  fontSize: 13, fontFamily: 'poppins', color: Colors.black),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            selectRoleTile(true,Icons.home_work_outlined, 'Large Retail',
                "Whether you are a candidate looking for professional opportunities or a company looking for qualified profiles, we are here to support you."),
            SizedBox(
              height: Get.height * 0.02,
            ),
            selectRoleTile(true,CupertinoIcons.house_alt, 'Hotel and Catering',
                "We offer our support both to candidates looking for professional opportunities and to companies looking for qualified talent")
          ],
        ),
      )),
    );
  }
}
