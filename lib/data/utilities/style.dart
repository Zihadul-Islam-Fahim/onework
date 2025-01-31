import 'package:flutter/material.dart';
import 'package:onework2/data/controller/category_controller.dart';
import 'package:onework2/data/models/category_model.dart';
import 'package:onework2/data/models/person_model.dart';

DecoratedBox businessAreaDropDownDecoratedBox(
    {required CategoryController controller,
    required Category currentValue,
    required List<Category> valueList}) {
  return DecoratedBox(
    decoration: BoxDecoration(
        color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
    child: DropdownButton(
      value: currentValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      isExpanded: true,
      underline: const SizedBox(),
      items: valueList.map((Category items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items.name!,
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
        );
      }).toList(),
      onChanged: ( newValue) {
        controller.dropDownOnChanged(newValue);
      },
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    ),
  );
}

DecoratedBox onTapDropDownDecoratedBox(
    {required CategoryController controller,
    required Category currentValue,
    required List<Category> valueList}) {
  return DecoratedBox(
    decoration: BoxDecoration(
        color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
    child: DropdownButton(
      value: currentValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      isExpanded: true,
      underline: const SizedBox(),
      items: valueList.map((Category items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items.name ?? "",
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
        );
      }).toList(),
      onChanged: ( newValue) {
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
          "“Onework consultants supported me throughout my mission search”",
      name: "Sarah Adel",
      designation: "Cashier"),
  Person(
      imagePath: "assets/images/thomas tran.png",
      des: "“A real study of my needs and personalized follow-up”",
      name: "Thomas Tran",
      designation: "Baker"),
  Person(
      imagePath: "assets/images/sarah blouse.png",
      des: "“Consultants always available and available when needed”",
      name: "Sarah Blaus",
      designation: "Department employee"),
  Person(
      imagePath: "assets/images/Rayan Kacim.png",
      des:
          "“A personalized study and proposals adapted to my profile”",
      name: "Ryan Kacim",
      designation: "Pastry chef"),
  Person(
      imagePath: "assets/images/victor perqioter.png",
      des: "“An approach centered on the study of profiles and their needs”",
      name: "Victor Pesquier",
      designation: "Department Manager")
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