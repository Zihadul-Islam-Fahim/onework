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
                  'Les métiers Onework dans la grande distribution',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                applyImageContainer("assets/images/meat.jpeg", 'Boucher(ère)'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/baker.jpeg", 'boulanger(ère)'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/cake.jpeg", 'Pâtissier(ère)'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer("assets/images/carcutarie.jpeg",
                    'Vendeur(euse) charcuterie'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/cheese.jpeg", 'Vendeur(euse) charcuterie'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/employee.jpg", 'Vendeur(euse) charcuterie'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/manager.jpeg", 'Vendeur(euse) charcuterie'),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                applyImageContainer(
                    "assets/images/cashier.jpeg", 'Vendeur(euse) charcuterie'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
