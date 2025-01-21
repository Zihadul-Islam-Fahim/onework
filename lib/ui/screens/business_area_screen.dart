import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/category_controller.dart';
import 'package:onework2/data/models/category_model.dart';
import '../../data/controller/business_area_controller.dart';
import '../../data/utilities/style.dart';
import '../widgets/back_button.dart';
import '../widgets/contact_cart.dart';

class BusinessAreaScreen extends StatefulWidget {
  const BusinessAreaScreen({super.key});

  @override
  State<BusinessAreaScreen> createState() => _BusinessAreaScreenState();
}

class _BusinessAreaScreenState extends State<BusinessAreaScreen> {
  @override
  void initState() {
    Get.find<CategoryController>().getCategory("businesses");
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cNameTEController = TextEditingController();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _desTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GetBuilder<BusinessAreaController>(builder: (controller) {
              return Form(
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
                            // Container(
                            //   margin: const EdgeInsets.all(2),
                            //   height: Get.height * 0.007,
                            //   width: Get.width * 0.08,
                            //   decoration: BoxDecoration(
                            //       color: Colors.black,
                            //       borderRadius: BorderRadius.circular(14)),
                            // ),
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
                      'Want to become a Onework partner?',
                      textAlign: TextAlign.start,
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
                      "Identify your needs and leave us a message. You will be contacted within the hour by a consultant.",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'poppins',
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    const Text(
                      'Leave us a message',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'poppins'),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    TextFormField(
                      controller: _cNameTEController,
                      validator: (String? v) {
                        if (v!.isEmpty) {
                          return 'enter company name';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Your Company Name'),
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    TextFormField(
                      controller: _nameTEController,
                      validator: (String? v) {
                        if (v!.isEmpty) {
                          return 'enter your name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: 'Name'),
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    TextFormField(
                      controller: _emailTEController,
                      validator: (String? v) {
                        if (v!.isEmpty) {
                          return 'enter email address';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Email address'),
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    TextFormField(
                      controller: _phoneTEController,
                      validator: (String? v) {
                        if (v!.isEmpty) {
                          return 'enter phone number';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Telephone number'),
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    GetBuilder<CategoryController>(builder: (categoryController) {
                      return Visibility(
                        visible: categoryController.inProgress == false,
                        replacement:
                            const Center(child: CircularProgressIndicator()),
                        child: businessAreaDropDownDecoratedBox(
                            currentValue: categoryController.currentValue ?? Category(id: 0,name: "What type of contract are you interested in?"),
                            valueList:
                                categoryController.categoryModel.categoryList!,
                            controller: categoryController),
                      );
                    }),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    TextFormField(
                      controller: _desTEController,
                      validator: (String? v) {
                        if (v!.isEmpty) {
                          return 'enter description';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: 'Description'),
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    Visibility(
                      visible: controller.inProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: SizedBox(
                        height: Get.height * 0.07,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (Get.find<CategoryController>().currentValue !=
                                  Get.find<CategoryController>()
                                      .categoryModel
                                      .categoryList!
                                      .first) {
                                controller.businessApply(
                                    cName: _cNameTEController.text,
                                    name: _nameTEController.text,
                                    email: _emailTEController.text,
                                    phone: _phoneTEController.text,
                                    cId: Get.find<CategoryController>()
                                        .currentValue!
                                        .id
                                        .toString(),
                                    des: _desTEController.text);
                              } else {
                                Get.snackbar(
                                    'Select Category', "Please select a category",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white);
                              }
                            }
                          },
                          child: const Text(
                            'Send',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),




                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
