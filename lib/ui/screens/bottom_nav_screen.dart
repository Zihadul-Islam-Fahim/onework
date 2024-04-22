import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/bottom_nav_controller.dart';
import 'package:onework2/ui/screens/contact_screen.dart';
import 'package:onework2/ui/screens/home_screen.dart';
import 'package:onework2/ui/screens/inbox_screen.dart';
import 'package:onework2/ui/screens/our_job_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final BottomNavController _bottomNavController =
      Get.find<BottomNavController>();

  List<Widget> get _screens => const [
        HomeScreen(),
        OurJobScreen(),
        InboxScreen(),
        ContactScreen(),
      ];

  @override
  void initState() {
    _bottomNavController.backToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (controller) {
      return Scaffold(
        body: _screens[_bottomNavController.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: controller.selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: "Applied"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                label: "Chat"),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.phone_circle_fill,
                  size: 24,
                ),
                label: "Contact"),
          ],
          onTap: (index) {
            _bottomNavController.changeIndex(index);
          },
        ),
      );
    });
  }
}
