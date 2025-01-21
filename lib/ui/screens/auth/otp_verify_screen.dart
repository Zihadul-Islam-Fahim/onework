import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/login_controller.dart';
import 'package:onework2/data/utilities/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {

  String pinNumber = "0";

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
                        PinCodeTextField(
                          appContext: context,
                          length: 6,
                          keyboardType: TextInputType.number,
                          animationType: AnimationType.slide,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          pinTheme: PinTheme(
                              fieldHeight: 50,
                              fieldWidth: 50,
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(9),
                              activeFillColor: Colors.white,
                              activeColor: Colors.white,
                              disabledColor: Colors.white,
                              selectedFillColor: Colors.orange.shade200,
                              inactiveFillColor: Colors.white,
                              inactiveColor: Colors.black,
                              selectedColor: Colors.white
                          ),
                          animationDuration: const Duration(milliseconds: 200),
                          backgroundColor: Colors.transparent,
                          enableActiveFill: true,
                          onChanged: (value) {
                            pinNumber = value.toString();
                          },
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
                                      if(pinNumber != "0"){
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
