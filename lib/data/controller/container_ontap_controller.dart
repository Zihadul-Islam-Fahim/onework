import 'package:get/get.dart';

class ContainerOnTapController extends GetxController{
  List<String> catrgoryList = [
    'Quel type de contrat vous intéresse ?',
    "Boucherie",
    'Boulangerie',
    "Posspmmeroe",
    "Charcuterie",
    'Fromagierie',
    "Responsale de rayon",
    'Cassie'
  ];
  String currentValue = 'Quel type de contrat vous intéresse ?';
  dropDownOnChanged(newValue){
    currentValue = newValue;
    update();
  }
}