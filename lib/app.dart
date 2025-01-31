import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/controller_binder.dart';
import 'package:onework2/ui/screens/spalsh_screen.dart';

class OneWorkApp extends StatelessWidget {
  const OneWorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'One Work',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'poppins'),
          titleSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontFamily: 'poppins'),
          bodyMedium: TextStyle(
              fontSize: 15, fontFamily: 'poppins', color: Colors.white60),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,

          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
          fillColor: Colors.grey[100],
          hintStyle: const TextStyle(fontFamily: 'poppins'),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange.shade200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      initialBinding: ControllerBinder(),
      home: const SplashScreen(),
    );
  }
}
