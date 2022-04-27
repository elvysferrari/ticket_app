import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';
import '../utils/loading_default.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Rx<UserModel> userModel = UserModel(eventoFavoritos: []).obs;

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  Future<void> signIn() async {

  }
  Future<void> signUp() async {

  }
}
