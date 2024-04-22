import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/contact_controller.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEControlller = TextEditingController();
  final TextEditingController _phoneTEControlller = TextEditingController();

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
                    controller: _emailTEControlller,
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
                    controller: _phoneTEControlller,
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
                             bool result = await controller.sendContactInfo(_emailTEControlller.text, _phoneTEControlller.text);
                             if(result){
                               _emailTEControlller.clear();
                               _phoneTEControlller.clear();
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
                    height: Get.height * 0.12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
