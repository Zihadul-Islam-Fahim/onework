import 'package:flutter/material.dart';

mySnackbar(context, msg, [bool isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 13, fontFamily: 'poppins', fontWeight: FontWeight.bold),
      ),
      width: MediaQuery.sizeOf(context).width * 0.85,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(milliseconds: 3500),
      padding: const EdgeInsets.all(15),
      clipBehavior: Clip.hardEdge,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
