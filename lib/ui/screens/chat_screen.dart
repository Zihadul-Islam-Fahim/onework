import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/ui/screens/auth/login_screen.dart';

import '../../data/controller/auth_controller.dart';
import '../../data/models/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> msgList = [
    Message(message: "Let me know how can i assist you?", self: false)
  ];
  final TextEditingController _selfMsgController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              child: Image.asset(
                "assets/images/whiteOneWorkLogo.png",
                fit: BoxFit.cover,
                height: Get.height * 0.016,
              ),
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            const Text(
              'Onework Support',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              child: ListView.separated(
                itemCount: msgList.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: msgList[index].self
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 14, top: 10, bottom: 10, right: 10),
                        margin: EdgeInsets.only(
                            left: msgList[index].self ? 100 : 10,
                            top: 10,
                            bottom: 1,
                            right: msgList[index].self ? 10 : 100),
                        decoration: BoxDecoration(
                          color: msgList[index].self
                              ? Colors.amberAccent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          msgList[index].message,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'poppins',
                              color: Colors.black),
                          textAlign: msgList[index].self
                              ? TextAlign.right
                              : TextAlign.left,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: Get.height * 0.005,
                  );
                },
              ),
            ),
          ),
          Container(
            height: Get.height * 0.1,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin:
                          const EdgeInsets.only(right: 10, top: 15, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _selfMsgController,
                            validator: (String? v) {
                              if (v!.isEmpty) {
                                return "empty";
                              }
                            },
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                                fillColor: Colors.transparent,
                                hintText: "Type Something..."),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        msgList.add(Message(
                            message: _selfMsgController.text.trim(),
                            self: true));
                        _selfMsgController.clear();
                        setState(() {});
                        log(msgList.length.toString());
                      }
                    },
                    child: const CircleAvatar(
                      radius: 26,
                      child: Icon(Icons.send),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
