import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/set_new_pass_controller.dart';
import 'package:onework2/data/utilities/style.dart';
import 'package:onework2/ui/screens/auth/login_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SetNewPassScreen extends StatefulWidget {
  const SetNewPassScreen({super.key});

  @override
  State<SetNewPassScreen> createState() => _SetNewPassScreenState();
}

class _SetNewPassScreenState extends State<SetNewPassScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String pinNumber = "0";
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _cPassController = TextEditingController();

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
                            "Set New Password",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppins',
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const Text(
                            "Enter otp code",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'poppins',
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          PinCodeTextField(
                            appContext: context,
                            length: 5,
                            keyboardType: TextInputType.number,
                            animationType: AnimationType.slide,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            pinTheme: PinTheme(
                                fieldHeight: 50,
                                fieldWidth: 50,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(9),
                                activeFillColor: Colors.black,
                                activeColor: Colors.black,
                                disabledColor: Colors.black,
                                selectedFillColor: Colors.orange.shade200,
                                inactiveFillColor: Colors.white,
                                inactiveColor: Colors.black,
                                selectedColor: Colors.black),
                            animationDuration:
                                const Duration(milliseconds: 200),
                            backgroundColor: Colors.transparent,
                            enableActiveFill: true,
                            onChanged: (value) {
                              pinNumber = value.toString();
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          const Text(
                            "Enter new password",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'poppins',
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          TextFormField(
                            controller: _newPassController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? v) {
                              if (v!.isEmpty) {
                                return "enter password";
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(hintText: 'New Password'),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          TextFormField(
                            controller: _cPassController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? v) {
                              if (v!.isEmpty) {
                                return "enter confirm password";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: 'Confirm Password'),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          GetBuilder<SetNewPassController>(
                              builder: (controller) {
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
                                    if (_formKey.currentState!.validate() &&
                                        pinNumber != "0") {
                                      if (_newPassController.text.length > 7) {
                                        if (_newPassController.text ==
                                            _cPassController.text) {
                                          final res =
                                              await controller.setNewPass(
                                                  pinNumber,
                                                  _newPassController.text,
                                                  _cPassController.text);

                                          if (res) {
                                            Get.to(() => const LoginScreen());
                                            mySnackbar(context,
                                                "Your Password has been changed.");
                                          }
                                        } else {
                                          mySnackbar(context,
                                              "Password didn't match.", true);
                                        }
                                      } else {
                                        mySnackbar(
                                            context,
                                            "Password must be 8 character or more",
                                            true);
                                      }
                                    } else {
                                      mySnackbar(context, "Enter OTP", true);
                                    }
                                  },
                                  child: const Text(
                                    'Change Password',
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
