import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/avaterImage.png"),
            ),
            SizedBox(height: 20,),
            Text('Sarah Adel',style: TextStyle(fontSize: 30,color: Colors.black),),
            Text('Cashier',style: TextStyle(fontSize: 20,color: Colors.grey,fontFamily: 'poppins'),)
          ],
        ),
      )),
    );
  }
}
