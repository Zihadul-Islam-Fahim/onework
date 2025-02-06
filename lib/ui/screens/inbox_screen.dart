import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/inbox_controller.dart';
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

  final inboxController = Get.find<InboxController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
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
                GetBuilder<InboxController>(
                    builder: (controller) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4,vertical: 6),
                      onTap: () {
                        inboxController.newMsg(true);
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
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins'),
                      ),
                      subtitle:  Row(
                        children: [
                          controller.isUser ? Text("you: ",style: TextStyle(
                              fontSize: 14, overflow: TextOverflow.ellipsis,
                              fontWeight: inboxController.isMsgRead ? FontWeight.w500 : FontWeight.bold
                          ),) : const SizedBox(),
                          Text(
                                controller.lastMsg,
                                style:  TextStyle(
                                    fontSize: 14, overflow: TextOverflow.ellipsis,
                                fontWeight: inboxController.isMsgRead ? FontWeight.w500 : FontWeight.bold
                                ),
                              ),
                        ],
                      ),

                      trailing: inboxController.isMsgRead
                          ? const SizedBox()
                          : Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: CupertinoColors.systemBlue,
                              ),
                            ),
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
