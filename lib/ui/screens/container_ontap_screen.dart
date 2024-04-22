import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/apply_controller.dart';
import 'package:onework2/ui/widgets/contact_cart.dart';

import '../../data/utilities/style.dart';

class ContainerOnTapScreen extends StatefulWidget {
  const ContainerOnTapScreen({super.key});

  @override
  State<ContainerOnTapScreen> createState() => _ContainerOnTapScreenState();
}

class _ContainerOnTapScreenState extends State<ContainerOnTapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<ApplyController>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    "VOUS ÊTES CANDIDAT ? POSTULEZ CHEZ ONEWORK",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const Text(
                    'Postulez pour accéder aux offres de Onework dans la grande distribution',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'poppins'),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const Text(
                    'Laissez nous votre contact, ainsi que votre CV, afin que nos equipes puissent vous contacter le plus rapidement possible.',
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
                    "À PROPOS DE VOUS",
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
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'poppins'),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const Text(
                    "Un CV / Un rendez vous / Un travail",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'poppins',
                        color: Colors.black54),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Nom'),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Prénom'),
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
                  onTapDropDownDecoratedBox(
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
                    child: OutlinedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );

                          if (result != null) {
                            File file = File(result.files.single.path!);
                          } else {}
                        },
                        child: const Text('télécharger votre CV')),
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
                              'assets/images/couple Image.jpg',
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
                              "Chez Onework, la qualité de la prise en charge de nos candidats et leur suivi est notre priorité",
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
                            "183 Avenue Charles de Gaulle \n 92200 Neuilly-sur-Seine"),
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
