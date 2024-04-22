import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/ui/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => Get.offAll(() => const LoginScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/onework.png",
          height: height * 0.1,
        ),
      ),
    );
  }
}
