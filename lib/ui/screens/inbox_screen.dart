import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/chat_controller.dart';
import 'package:onework2/ui/screens/chat_screen.dart';



class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}


class _InboxScreenState extends State<InboxScreen> {



  @override
  void initState() {
    super.initState();


  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Inbox',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => const ChatScreen());
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 30,
                    child: Image.asset(
                      "assets/images/whiteOneWorkLogo.png",
                      fit: BoxFit.scaleDown,
                      height: Get.height * 0.023,
                    ),
                  ),
                  title: const Text(
                    "Onework Support",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'poppins'),
                  ),
                  subtitle: const Text(
                    "Hi,Let me know how can i assist you?",
                    style: TextStyle(
                        fontSize: 14, overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
