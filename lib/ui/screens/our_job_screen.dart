import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/apply_image_container.dart';

class OurJobScreen extends StatefulWidget {
  const OurJobScreen({super.key});

  @override
  State<OurJobScreen> createState() => _OurJobScreenState();
}

class _OurJobScreenState extends State<OurJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  'Onework professions in mass distribution',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                applyImageContainer("assets/images/meat.jpeg", 'Butcher'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/baker.jpeg", 'Baker'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/cake.jpeg", 'Pastry chef'),
                SizedBox(
                  height: Get.height * 0.04,
                ),applyImageContainer(
                    "assets/images/fish.jpeg", 'Fisher Maker'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer("assets/images/carcutarie.jpeg",
                    'Charcuterie seller'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/cheese.jpeg", 'Salesman fromagerie'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/employee.jpg", 'Shopkeeper'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/manager.jpeg", 'Ray Manager'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/cashier.jpeg", 'Biller'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
