import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/signup_controller.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEControlller = TextEditingController();
  final TextEditingController _emailTEControlller = TextEditingController();
  final TextEditingController _passwordTEControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.06),
              Image.asset('assets/images/whiteOneWorkLogo.png',
                  width: size.width * 0.4),
              SizedBox(height: size.height * 0.06),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(vertical: 35, horizontal: 14),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      )),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hi, Welcome",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppins',
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: size.height * 0.008,
                          ),
                          const Text(
                            "Provide us with your information and get started",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'poppins',
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          TextFormField(
                            controller: _nameTEControlller,
                            validator: (String? v) {
                              if (v!.isEmpty) {
                                return "enter name";
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: 'Name'),
                          ), SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _emailTEControlller,
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? v) {
                              if (v!.isEmpty) {
                                return "enter email";
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: 'Email Address'),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _passwordTEControlller,
                            obscureText: true,
                            validator: (String? v) {
                              if (v!.isEmpty) {
                                return "enter password";
                              }
                            },
                            decoration:
                            const InputDecoration(hintText: 'Password'),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          GetBuilder<SignupController>(
                            builder: (controller) {
                              return SizedBox(
                                height: size.height * 0.06,
                                width: double.infinity,
                                child: Visibility(
                                  visible: controller.inProgress==false,
                                  replacement:  Center(child: CircularProgressIndicator(color: Colors.orange.shade200),),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        bool result = await controller.signup(_nameTEControlller.text,_emailTEControlller.text, _passwordTEControlller.text);
                                        if(result){
                                          Get.to(()=>const LoginScreen());
                                        }
                                      }
                                    },
                                    child: const Text(
                                      'Sign up',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
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
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already Have an account?',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins',
                                    color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'poppins',
                                      color: Colors.orange.shade200,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
