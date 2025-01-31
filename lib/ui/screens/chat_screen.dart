import 'dart:convert';
// Ensure you import the package
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/chat_controller.dart';
import 'package:onework2/data/models/message_model.dart';

// import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../data/controller/auth_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<MessageModel> msgList = [];
  final TextEditingController _selfMsgController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  final chatController = Get.find<ChatController>();



  @override
  void initState() {
    super.initState();

    msgList = chatController.msgList.reversed.toList();

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

     _initPusher();

  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  void _sendMessage() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        msgList
            .add(MessageModel(message: _selfMsgController.text, type: 'user'));
        _selfMsgController.clear();
      });

      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  final PusherChannelsFlutter pusher = PusherChannelsFlutter();
  String? channelName;

  Future<void> _initPusher() async {
    debugPrint(AuthController.user!.user!.id.toString());
    channelName = 'chatChannel.${AuthController.user!.user!.id}';

    try {
      await pusher.init(
        apiKey: 'ad012c372ed42153296c',
        cluster: 'ap2',
        onConnectionStateChange: (String? previous, String? current) {
          print('Pusher Connection State Changed: $previous -> $current');
        },
        onError: (String message, int? code, dynamic e) {
          print('Pusher Error: $message (Code: $code)');
        },
      );

      await pusher.subscribe(
        channelName: channelName!,
        onEvent: (dynamic event) {
          print('Received event: ${event.eventName} -> ${event.data}');

          if (event.eventName == 'chatEvent') {
            Map<String, dynamic> chatData = jsonDecode(event.data);
            print('New chat: ${chatData['message']}');
            msgList
                .add(MessageModel(type: "admin", message: chatData['message']));
            if (_scrollController.hasClients) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
            setState(() {});

            // Handle received chat data
          } else {}
        },
      );

      await pusher.connect();
      print('Connected to Pusher and subscribed to $channelName');
    } catch (e) {
      print('Pusher initialization error: $e');
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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                controller: _scrollController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemCount: msgList.length,
                itemBuilder: (context, index) {
                  bool isUser = msgList[index].type == 'user';
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
                        boxShadow: [
                          const BoxShadow(color: Colors.black26, blurRadius: 2),
                        ],
                      ),
                      child: Text(
                        msgList[index].message!,
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
                InkWell(
                  onTap: _sendMessage,
                  child: const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.amberAccent,
                    child: Icon(Icons.send, color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
