import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:onework2/data/controller/login_controller.dart';
import 'package:onework2/ui/screens/forgot_pass_screen.dart';
import 'package:onework2/ui/screens/greeting_screen.dart';
import 'package:onework2/ui/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                            "Hi, Welcome Back",
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
                            "Please log in to your account",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'poppins',
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
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
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'poppins',
                                    color: Colors.orange.shade200,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          GetBuilder<LoginController>(builder: (controller) {
                            return SizedBox(
                              height: size.height * 0.06,
                              width: double.infinity,
                              child: Visibility(
                                visible: controller.inProgress == false,
                                replacement: Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.orange.shade200),
                                ),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      bool result = await controller.login(
                                          _emailTEControlller.text,
                                          _passwordTEControlller.text);
                                      if (result) {
                                        Get.to(() => const GreetingScreen());
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Login',
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
                          }),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't Have an account?",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'poppins',
                                    color: Colors.black),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => const SignupScreen());
                                },
                                child: Text(
                                  'Signup',
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
