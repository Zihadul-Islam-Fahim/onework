import 'dart:convert';
import 'package:get/get.dart';
import 'package:onework2/data/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController {
  static String? token;
  static UserModel? user;

  Future<void> saveUserInformation(String t, UserModel model) async {


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', t);
    await sharedPreferences.setString('user', jsonEncode(model.toJson()));

    token = t;
    user = model;
    update();
  }

  Future<void> updateUserInformation(UserModel model) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('user', jsonEncode(model.toJson()));
    user = model;
    update();
  }

  Future<void> saveEmailAndOtp(String? name, String? value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(name.toString(), value.toString());
    update();
  }

  Future<String> retrieveEmailAndOtp(String name) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? v = sharedPreferences.getString(name.toString());
    update();
    return v ?? '';
  }

  Future<void> initializedUserCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    user = UserModel.fromJson(
        jsonDecode(sharedPreferences.getString('user') ?? '{}'));
    update();
  }

  Future<bool> checkAuthState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    update();

    if (token != null) {
      await initializedUserCache();
      return true;
    }
    return false;
  }

  Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
    update();
  }

  // static UserModel _checkUserPhoto(UserModel model) {
  //   if (model.photo != null && model.photo!.startsWith('data:image')) {
  //     //remove prefix
  //     model.updatePhoto(
  //         model.photo!.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), ''));
  //   }
  //   return model;
  // }
}