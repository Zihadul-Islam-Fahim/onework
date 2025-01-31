import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/auth_controller.dart';
import 'package:onework2/ui/screens/bottom_nav_screen.dart';

import '../../data/controller/chat_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String msg = "";
  String isDown = "false";
  // final databaseRef = FirebaseDatabase.instanceFor(
  //         app: Firebase.app(),
  //         databaseURL: "https://kaja-salat-5414a-default-rtdb.firebaseio.com/")
  //     .ref("appData");

  // getDataFromRealtimeDatabase() async {
  //   DataSnapshot dataSnapshot = await databaseRef.get();
  //   msg = dataSnapshot.child("msg").value.toString();
  //   isDown = dataSnapshot.child("isDown").value.toString();
  //   log(dataSnapshot.toString());
  //   log(isDown.toString());
  // }

  @override
   initState()  {
    init();
    super.initState();
  }

  init() async {


    Future.delayed(const Duration(milliseconds: 1500)).then((value) async {
        bool res = await AuthController().checkAuthState();
       if(res){
         Get.find<ChatController>().getMsg();
       }

      log(AuthController.token.toString());
      Get.offAll(() =>  const BottomNavScreen());
    });
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

// class ErrorScreen extends StatelessWidget {
//   final String msg;
//
//   const ErrorScreen({super.key, required this.msg});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red,
//       body: Center(
//         child: Text(
//           msg,
//           style: const TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
