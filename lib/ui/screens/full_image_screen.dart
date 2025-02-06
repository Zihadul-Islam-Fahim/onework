import 'package:flutter/material.dart';

class FullImageScreen extends StatefulWidget {
  FullImageScreen({super.key, required this.image});

  String image = "";

  @override
  State<FullImageScreen> createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: InteractiveViewer(
            panEnabled: false,
            // Set it to false
            boundaryMargin: const EdgeInsets.all(100),
            minScale: 1,
            maxScale: 6,
            child: Image.network(widget.image,width: double.infinity,height: double.infinity,),
          ),
        ),
      ),
    );
  }
}
