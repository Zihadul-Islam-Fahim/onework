import 'package:flutter/material.dart';
import 'package:onework2/data/controller/apply_controller.dart';
import 'package:onework2/data/controller/business_area_controller.dart';
import 'package:onework2/data/models/person_model.dart';

DecoratedBox businessAreaDropDownDecoratedBox(
    {required BusinessAreaController controller,
    required String currentValue,
    required List<String> valueList}) {
  return DecoratedBox(
    decoration: BoxDecoration(
        color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
    child: DropdownButton(
      value: currentValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      isExpanded: true,
      underline: const SizedBox(),
      items: valueList.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items,
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        controller.dropDownOnChanged(newValue);
      },
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    ),
  );
}

DecoratedBox onTapDropDownDecoratedBox(
    {required ApplyController controller,
    required String currentValue,
    required List<String> valueList}) {
  return DecoratedBox(
    decoration: BoxDecoration(
        color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
    child: DropdownButton(
      value: currentValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      isExpanded: true,
      underline: const SizedBox(),
      items: valueList.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items,
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        controller.dropDownOnChanged(newValue);
      },
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    ),
  );
}

List<Person> carouselImageList = [
  Person(
      imagePath: 'assets/images/sarah adel.png',
      des:
          "“Les consultants Onework m'ont accompagné tout au long de ma recherche de mission”",
      name: "Sarah Adel",
      designation: "Hôtesse de caisse"),
  Person(
      imagePath: "assets/images/thomas tran.png",
      des: "“Une vraie étude de mes besoins et un suivi personnalisé”",
      name: "Thomas Tran",
      designation: "Boulanger"),
  Person(
      imagePath: "assets/images/sarah blouse.png",
      des: "“Consultants toujours disponibles et à l'écoute en cas de besoin,”",
      name: "Sarah Blaus",
      designation: "Employée de rayon"),
  Person(
      imagePath: "assets/images/Rayan Kacim.png",
      des:
          "“Une étude personnalisée et des propositions adaptées à mon profil”",
      name: "Ryan Kacim",
      designation: "Pâtissière"),
  Person(
      imagePath: "assets/images/victor perqioter.png",
      des: "“Une approche centrée sur l'étude des profils et de leurs besoins”",
      name: "Victor Pesquier",
      designation: "Responsable de rayon")
];


mySnackbar(context, msg, [bool isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14, fontFamily: 'poppins', fontWeight: FontWeight.bold),
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