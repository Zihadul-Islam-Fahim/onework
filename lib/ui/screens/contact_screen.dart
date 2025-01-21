import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/contact_controller.dart';

import '../widgets/contact_cart.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _msgTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const Text(
                    "Contact Us",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins',
                        color: Colors.black),
                  ),
                  const Text(
                    "Want to know more about Onework and mass distribution?",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'poppins',
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  TextFormField(
                    controller: _nameTEController,
                    keyboardType: TextInputType.text,
                    validator: (String? v) {
                      if (v!.isEmpty) {
                        return "enter name";
                      }
                    },
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ), TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? v) {
                      if (v!.isEmpty) {
                        return "enter email";
                      }
                    },
                    decoration: const InputDecoration(hintText: 'Mail Addess'),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  TextFormField(
                    controller: _phoneTEController,
                    keyboardType: TextInputType.number,
                    validator: (String? v) {
                      if (v!.isEmpty) {
                        return "enter phone";
                      }
                    },
                    decoration: const InputDecoration(hintText: 'Phone'),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  TextFormField(
                    controller: _msgTEController,
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    decoration: const InputDecoration(hintText: 'Message (Optional)'),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  GetBuilder<ContactController>(
                    builder: (controller) {
                      return SizedBox(
                        height: Get.height * 0.06,
                        width: double.infinity,
                        child: Visibility(
                          visible: controller.inProgress == false,
                          replacement: const Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(
                            onPressed: () async {
                              if(_formKey.currentState!.validate()){
                                bool result = await controller.sendContactInfo(
                                  name: _nameTEController.text.trim(),
                                  email: _emailTEController.text.trim(),
                                  phone: _phoneTEController.text,
                                  msg: _msgTEController.text);
                              if(result){
                                  _nameTEController.clear();
                                  _emailTEController.clear();
                                  _phoneTEController.clear();
                                  _msgTEController.clear();
                                }
                              }

                            },
                            child: const Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                  SizedBox(
                    height: 40,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
