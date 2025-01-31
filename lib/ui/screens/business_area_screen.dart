import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/category_controller.dart';
import 'package:onework2/data/models/category_model.dart';

import '../../data/controller/business_area_controller.dart';
import '../../data/utilities/style.dart';
import '../widgets/back_button.dart';

class BusinessAreaScreen extends StatefulWidget {
  const BusinessAreaScreen({super.key});

  @override
  State<BusinessAreaScreen> createState() => _BusinessAreaScreenState();
}

class _BusinessAreaScreenState extends State<BusinessAreaScreen> {


  final cateController = Get.find<CategoryController>();

  @override
  void initState() {
    cateController.getCategory("businesses");
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
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
                      decoration: const InputDecoration(hintText: ' Your name'),

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
                      keyboardType: TextInputType.number,
                      validator: (String? v) {
                        if (v!.isEmpty) {
                          return 'enter phone number';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Telephone number'
                          ),
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
                                categoryController.categoryModel.categoryList ?? [],
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (cateController.currentValue != cateController.categoryModel.categoryList!.first) {
                               bool res =await controller.businessApply(
                                    cName: _cNameTEController.text,
                                    name: _nameTEController.text,
                                    email: _emailTEController.text,
                                    phone: _phoneTEController.text,
                                    cId: cateController.currentValue!.id.toString(),
                                    des: _desTEController.text);

                               if(res){

                                 openBottomSheet();




                               }
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

  openBottomSheet(){
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
                      _cNameTEController.clear();
                      _nameTEController.clear();
                      _phoneTEController.clear();
                      _emailTEController.clear();
                      _desTEController.clear();
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
}
