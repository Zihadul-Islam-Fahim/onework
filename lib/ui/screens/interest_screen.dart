import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/ui/widgets/apply_image_container.dart';
import 'package:onework2/ui/widgets/back_button.dart';

class InterestScreen extends StatelessWidget {
  InterestScreen({super.key});

  List<Map<String, String>> interestList = [
    {"Image": "assets/images/meat.jpeg", "Name": 'Butcher'},
    {"Image": "assets/images/baker.jpeg", "Name": 'Baker'},
    {"Image": "assets/images/cake.jpeg", "Name": 'Pastry chef'},
    {"Image": "assets/images/fish.jpeg", "Name": 'Fishmonger'},
    {"Image": "assets/images/carcutarie.jpeg", "Name": 'Carcutarie Seller'},
    {"Image": "assets/images/cheese.jpeg", "Name": 'Boucher'},
    {"Image": "assets/images/employee.jpg", "Name": 'Shopkeeper'},
    {"Image": "assets/images/manager.jpeg", "Name": 'Shopkeeper'},
    {"Image": "assets/images/cashier.jpeg", "Name": 'Biller'},

  ];

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
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const Text(
                  "What are you are interested ",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',
                      color: Colors.black),
                ),
                const Text(
                  "Personalized support throughout your journey.",
                  style: TextStyle(
                      fontSize: 13, fontFamily: 'poppins', color: Colors.black),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: interestList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8),
                      itemBuilder: (context, i) {
                        return applyImageContainer(
                            interestList[i]['Image']!, interestList[i]["Name"]!);
                      }),
                )
              ],
            ),
          )),
    );
  }
}