// Ensure you import the package

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/chat_controller.dart';

import '../../data/utilities/style.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
 // List<MessageModel> msgList = [];
  final TextEditingController _selfMsgController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final chatController = Get.find<ChatController>();



  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

  }

  void _scrollToBottom() {
    if (chatController.scrollController.hasClients) {
      chatController.scrollController.jumpTo(chatController.scrollController.position.maxScrollExtent);
    }
  }

  Future<void> _sendMessage() async {
    if (_formKey.currentState!.validate()) {
      final res = await chatController.sendMsg(_selfMsgController.text);

      if(res){
        _selfMsgController.clear();

        Future.delayed(const Duration(milliseconds: 100), () {
          if (chatController.scrollController.hasClients) {
            chatController.scrollController.animateTo(
              chatController.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      }else{
        mySnackbar(context, 'Failed to send message',true);
      }

    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                "assets/images/onework.png",
                fit: BoxFit.cover,
                height: Get.height * 0.018,
              ),
            ),
            const SizedBox(width: 10),
            const Text('Onework Support',
                style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ),
      body: GetBuilder<ChatController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    controller: chatController.scrollController,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemCount: chatController.msgList.length,
                    itemBuilder: (context, index) {
                      bool isUser = chatController.msgList[index].type == 'user';
                      return Align(
                        alignment:
                            isUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: isUser ? Colors.amberAccent : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(12),
                              topRight: const Radius.circular(12),
                              bottomLeft:
                                  isUser ? const Radius.circular(12) : Radius.zero,
                              bottomRight:
                                  isUser ? Radius.zero : const Radius.circular(12),
                            ),
                            boxShadow: const [
                              BoxShadow(color: Colors.black26, blurRadius: 2),
                            ],
                          ),
                          child: Text(
                            chatController.msgList[index].message!,
                            style: TextStyle(
                                fontSize: 14,
                                color: isUser ? Colors.black : Colors.black87),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _selfMsgController,
                          validator: (String? v) =>
                              v!.isEmpty ? "Message can't be empty" : null,
                          style: const TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            hintText: "Type a message...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Visibility(
                      visible: controller.msgSending==false,
                      replacement: const Center(child: SizedBox(height: 25,width: 25,child: CircularProgressIndicator(strokeWidth: 3,))),
                      child: InkWell(
                        onTap: _sendMessage,
                        child: const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.amberAccent,
                          child: Icon(Icons.send, color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
