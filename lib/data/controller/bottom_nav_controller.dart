import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  changeIndex(index) {
    _selectedIndex = index;
    update();
  }

  backToHome() {
    _selectedIndex = 0;
  }
}