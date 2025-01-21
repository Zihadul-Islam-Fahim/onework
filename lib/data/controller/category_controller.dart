import 'dart:convert';
import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:onework2/data/models/category_model.dart';

import '../utilities/urls.dart';

class CategoryController extends GetxController{
  bool inProgress = false;
  CategoryModel categoryModel = CategoryModel();


  Category? currentValue;


  getCategory(String type) async{
    inProgress= true;
    update();

    var response = await get(Uri.parse(Urls.categories).replace(queryParameters: {"type": type}),);
    debugPrint(response.body.toString());

    if(response.statusCode == 200){
      categoryModel = CategoryModel.fromJson(jsonDecode(response.body));
       currentValue = categoryModel.categoryList!.first;

       log(categoryModel.categoryList![0].name ?? " aslo null");
    }




    inProgress= false;
    update();


  }


  dropDownOnChanged(newValue) {
    currentValue = newValue;
    update();
  }
}