import 'package:get/get.dart';

class BusinessAreaController extends GetxController{
  List<String> catrgoryList = [
    'Quel type de contrat vous intéresse ?',
    "Interim",
    'CDD',
    "CDI",

  ];
  String currentValue = 'Quel type de contrat vous intéresse ?';
  dropDownOnChanged(newValue){
    currentValue = newValue;
    update();
  }
}