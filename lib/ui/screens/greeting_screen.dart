import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/ui/screens/bottom_nav_screen.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/greetingImage.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: height * 0.32,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.bottomEnd,
                  end: AlignmentDirectional.topCenter,
                  colors: [Colors.black, Colors.black38],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Our experts are always at your disposal",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * 0.01),
                  const Text(
                    "Onework consultants offer you personalized monitoring and support in all your efforts, whether you are a recruiter or a candidate.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  SizedBox(
                    height: height * 0.06,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(
                          () => const BottomNavScreen(),
                        );
                      },
                      child: const Text(
                        "Let's Get Start",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
