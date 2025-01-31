import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/login_controller.dart';
import 'package:onework2/data/utilities/style.dart';
import 'package:onework2/ui/screens/auth/otp_verify_screen.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEControlller = TextEditingController();

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
                        top: Radius.circular(40), )
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Forgot Password",
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
                            "4 digit pin will sent to your email address.",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'poppins',
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          TextFormField(
                            controller: _emailTEControlller,
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? v) {
                              if (v!.isEmpty) {
                                return "enter email";
                              }
                            },
                            decoration:
                            const InputDecoration(hintText: 'Email Address'),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),

                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          GetBuilder<LoginController>(
                              builder: (controller) {
                                return SizedBox(
                                  height: size.height * 0.06,
                                  width: double.infinity,
                                  child: Visibility(
                                    visible: controller.inProgress==false,
                                    replacement:  Center(child: CircularProgressIndicator(color: Colors.orange.shade200),),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if(_formKey.currentState!.validate()){
                                          Get.to(()=> const OtpVerifyScreen());
                                          mySnackbar(context, "4 digit pin sent to your email address");
                                        }

                                      },
                                      child: const Text(
                                        'Send code',
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
