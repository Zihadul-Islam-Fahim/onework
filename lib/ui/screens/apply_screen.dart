import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/category_controller.dart';
import 'package:onework2/data/controller/contact_controller.dart';
import 'package:onework2/data/models/category_model.dart';
import 'package:onework2/data/utilities/style.dart';
import 'package:onework2/ui/widgets/back_button.dart';
import '../../data/controller/apply_controller.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEControlller = TextEditingController();
  final TextEditingController _fullNameTEControlller = TextEditingController();
  final TextEditingController _emailTEControlller = TextEditingController();
  final TextEditingController _phoneTEControlller = TextEditingController();
  final TextEditingController _aboutProjectTEControlller =
      TextEditingController();

  @override
  void initState() {
    Get.find<CategoryController>().getCategory("candidates");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<ApplyController>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                                    color: Colors.black,
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
                        "Apply to onework",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins',
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      const Text(
                        "Leave us your contact information as well as your CV.",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'poppins',
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Center(
                        child: SizedBox(
                          height: Get.height * 0.15,
                          width: Get.width * 0.7,
                          child: OutlinedButton(
                            onPressed: () async {
                              controller.pickFile();
                            },
                            child: Visibility(
                              visible: controller.hasCV == false,
                              replacement: Text(
                                controller.file?.path ??
                                    "Unable to select file,try again!",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                              child: const Text('Upload Your CV',
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: 'poppins')),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      TextFormField(
                        controller: _nameTEControlller,
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return 'enter name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(hintText: 'Name'),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      TextFormField(
                        controller: _fullNameTEControlller,
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return 'enter full name';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: 'Full Name'),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      TextFormField(
                        controller: _emailTEControlller,
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return 'enter email';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: 'Mail Addess'),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      TextFormField(
                        controller: _phoneTEControlller,
                        keyboardType: TextInputType.phone,
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return 'enter phone';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(hintText: 'Phone'),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      GetBuilder<CategoryController>(
                        builder: (categoryController) {
                          return Visibility(
                            visible: categoryController.inProgress==false,
                            replacement: const Center(child: CircularProgressIndicator()),
                            child: onTapDropDownDecoratedBox(
                              currentValue: categoryController.currentValue ?? Category(id: 0, name: "What type of contract are you interested in?"),
                              valueList: categoryController.categoryModel.categoryList ?? [],
                              controller: categoryController,
                            ),
                          );
                        }
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      TextFormField(
                        controller: _aboutProjectTEControlller,
                        maxLines: 2,
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return 'enter about your project';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Tell us about you and your project'),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      GetBuilder<ApplyController>(
                        builder: (controller) {
                          return SizedBox(
                            height: Get.height * 0.06,
                            width: double.infinity,
                            child: Visibility(
                              visible: controller.inProgress == false,
                              replacement: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.orange.shade200,
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate() &&
                                      controller.file != null &&
                                      Get.find<CategoryController>().currentValue!.name !=
                                          'What type of contract are you interested in?') {

                                    bool result = await controller.sendInfo(
                                       name:  _nameTEControlller.text.trim(),
                                      fName:   _fullNameTEControlller.text.trim(),
                                      email:   _emailTEControlller.text.trim(),
                                       phone:  _phoneTEControlller.text.trim(),
                                       des: _aboutProjectTEControlller.text.trim(),
                                        cId: Get.find<CategoryController>().currentValue!.id.toString(),

                                    );

                                    if (result) {
                                      Get.bottomSheet(
                                        BottomSheet(
                                          onClosing: () {},
                                          builder: (context) {
                                            return Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: Get.height * 0.02,
                                                  ),
                                                  const Icon(
                                                    Icons.check_circle_outline,
                                                    size: 100,
                                                    color: Colors.green,
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.06,
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.02,
                                                  ),
                                                  const Text(
                                                    "Information Sended",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'poppins',
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.02,
                                                  ),
                                                  const Text(
                                                    "Good job! Thanks for sending your information our teams will contact you as quickly as possible.",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily: 'poppins',
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.1,
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.07,
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        _nameTEControlller.clear();
                                                        _fullNameTEControlller.clear();
                                                        _emailTEControlller.clear();
                                                        _phoneTEControlller.clear();
                                                        _aboutProjectTEControlller.clear();
                                                        controller.onFinished();
                                                        Get.back();
                                                      },
                                                      child: const Text(
                                                          "Ok,Thanks",
                                                      style: TextStyle(fontFamily: 'Poppins',color: Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  } else {
                                    mySnackbar(
                                        context,
                                        "One or more information are missing!",
                                        true);
                                  }
                                },
                                child: const Text(
                                  'Send',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: Get.height * 0.12,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
