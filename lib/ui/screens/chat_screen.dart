// Ensure you import the package

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/chat_controller.dart';
import 'package:onework2/data/controller/inbox_controller.dart';

import '../../data/utilities/style.dart';
import 'full_image_screen.dart';

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

    chatController.checkerPusherStatus();
  }

  void _scrollToBottom() {
    if (chatController.scrollController.hasClients) {
      chatController.scrollController
          .jumpTo(chatController.scrollController.position.maxScrollExtent);
    }

    Get.find<InboxController>().lastMsg == 'Photo'
        ? Future.delayed(const Duration(milliseconds: 2500), () {
            if (chatController.scrollController.hasClients) {
              chatController.scrollController.animateTo(
                chatController.scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          })
        : Future.delayed(const Duration(milliseconds: 1500), () {
            if (chatController.scrollController.hasClients) {
              chatController.scrollController.animateTo(
                chatController.scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          });
  }

  Future<void> _sendMessage() async {
    if (_formKey.currentState!.validate()) {
      final res = await chatController.sendMsg(_selfMsgController.text);

      if (res) {
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
      } else {
        mySnackbar(context, 'Failed to send message', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.all(16),
            splashRadius: 25,

            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_outlined)),
        leadingWidth: 35,
        backgroundColor: Colors.amberAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 20,
              child: Image.asset(
                "assets/images/whiteOneWorkLogo.png",
                fit: BoxFit.scaleDown,
                height: Get.height * 0.023,
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
          return SafeArea(
            child: Column(
              children: [
                // Container(
                //   height: 60,
                //   width: double.infinity,
                //   color: Colors.amberAccent,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back_outlined)),
                //
                //       CircleAvatar(
                //         backgroundColor: Colors.black,
                //         radius: 20,
                //         child: Image.asset(
                //           "assets/images/whiteOneWorkLogo.png",
                //           fit: BoxFit.scaleDown,
                //           height: Get.height * 0.023,
                //         ),
                //       ),
                //       const SizedBox(width: 10),
                //       const Text('Onework Support',
                //           style: TextStyle(fontSize: 16, color: Colors.black)),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      controller: chatController.scrollController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      itemCount: chatController.msgList.length,
                      itemBuilder: (context, index) {
                        bool isUser =
                            chatController.msgList[index].type == 'user';
                        bool hasImage = chatController.msgList[index].isFile!;
                        return Align(
                          alignment: isUser
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: hasImage
                              ? _hasImage(isUser, index)
                              : _textOnly(isUser, index),
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
                      IconButton(
                          onPressed: () {
                            controller.pickImage();
                          },
                          icon: const Icon(Icons.image)),
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
                        visible: controller.msgSending == false,
                        replacement: const Center(
                            child: SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                ))),
                        child: InkWell(
                          onTap: _sendMessage,
                          child: const CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.amberAccent,
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container _textOnly(bool isUser, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isUser ? Colors.amberAccent : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
          bottomRight: isUser ? Radius.zero : const Radius.circular(12),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 2),
        ],
      ),
      child: Text(
        chatController.msgList[index].message!,
        style: TextStyle(
            fontSize: 14, color: isUser ? Colors.black : Colors.black87),
      ),
    );
  }

  Container _hasImage(bool isUser, int index) {

    bool hasText = chatController.msgList[index].message != null;

    return hasText ? _imageAndText(isUser, index) : _imageOnly(isUser, index);
  }



  Container _imageOnly(bool isUser, int index) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isUser ? Colors.amberAccent : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
            bottomRight: isUser ? Radius.zero : const Radius.circular(12),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 2),
          ],
        ),
        child: InkWell(
          onTap: (){
            Get.to(()=> FullImageScreen(image: "https://onewk.appsowk.org${chatController.msgList[index].file!}"));
          },
          child: FadeInImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://onewk.appsowk.org${chatController.msgList[index].file!}",
            ),
            placeholder: const AssetImage(
              "assets/images/placeholderImages.png",
            ),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/placeholderImages.png",
                fit: BoxFit.cover,
              );
            },
          ),
        ));
  }

  Container _imageAndText(bool isUser, int index) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isUser ? Colors.amberAccent : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
            bottomRight: isUser ? Radius.zero : const Radius.circular(12),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 2),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Get.to(()=> FullImageScreen(image: "https://onewk.appsowk.org${chatController.msgList[index].file!}"));
              },
              child: FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://onewk.appsowk.org${chatController.msgList[index].file!}",
                ),
                placeholder: const AssetImage(
                  "assets/images/placeholderImages.png",
                ),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/placeholderImages.png",
                    fit: BoxFit.cover,
                  );
                },
              ),


              // Image.network(
              //     "https://onewk.appsowk.org${chatController.msgList[index].file!}"),
            ),
            const SizedBox(height: 4,),
            Text(
              chatController.msgList[index].message!,
              style: TextStyle(
                  fontSize: 14, color: isUser ? Colors.black : Colors.black87),
            )

          ],
        ));
  }
}
