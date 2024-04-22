import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inbox',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      CupertinoIcons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: Text("Onework Support"),
                  subtitle: Text("Hi,Let me know how can i assist you?"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
