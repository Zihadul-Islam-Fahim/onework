import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/business_area_controller.dart';
import 'package:onework2/data/utilities/style.dart';
import 'package:onework2/ui/widgets/contact_cart.dart';

class BusinessAreaScreen extends StatefulWidget {
  const BusinessAreaScreen({super.key});

  @override
  State<BusinessAreaScreen> createState() => _BusinessAreaScreenState();
}

class _BusinessAreaScreenState extends State<BusinessAreaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<BusinessAreaController>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    "VOUS ÊTES UNE ENTREPRISE DE LA GRANDE DISTRIBUTION ?",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const Text(
                    'Onework traite vos demande dans les meilleurs délais',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'poppins'),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const Text(
                    'Joingnables par email comme par téléphone, nos consultants sont \n à votre écoute et peuvent satisfaire vos besoins dans un délai très court.',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        color: Colors.black54),
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                  Text(
                    "ENVIE DE DEVENIR PARTENAIRE ONEWORK?",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const Text(
                    'Laissez nous un message',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'poppins'),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const Text(
                    "Recensez vos besoins et laissez nous un message. Vous serez recontactés dans l'heure par un consultant.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        color: Colors.black54),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Votre entreprise'),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Nom'),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Adresse mail'),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: 'Numéro de téléphone'),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  businessAreaDropDownDecoratedBox(
                      currentValue: controller.currentValue,
                      valueList: controller.catrgoryList,
                      controller: controller),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Quelles carrières vous intéressent ?'),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Parlez-nous de vous et de vos projets'),
                    maxLines: 4,
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  SizedBox(
                      height: Get.height * 0.07,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Envoyer',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold),
                          ))),
                  SizedBox(
                    height: Get.height * 0.12,
                  ),
                  Container(
                    height: Get.height * 0.45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/business Area image 1.jpg',
                            ),
                            fit: BoxFit.cover)),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.grey.withOpacity(0.6),
                            child: const Text(
                              "Les consultants de Onework sont à l'écoute de vos besoins et de vos problèmes de recrutement",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 21),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: Get.height * 0.12,
                  ),
                  Container(
                    height: Get.height * 0.8,
                    width: Get.width,
                    color: Colors.orange[50],
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.1,
                        ),
                        contactCart(CupertinoIcons.home,
                            "211B Avenue Charles de Gaulle \n 92200 Neuilly-sur-Seine"),
                        SizedBox(
                          height: Get.height * 0.04,
                        ),
                        contactCart(CupertinoIcons.mail,
                            "accueil@onework.fr \n 01 86 90 93 50"),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
