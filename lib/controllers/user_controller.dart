import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'  hide Response;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';
import '../utils/http_service.dart';
import '../utils/loading_default.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  final _http = HttpService();
  RxBool isLoggedIn = false.obs;

  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController password = TextEditingController();

  Rx<UserModel> userModel = UserModel().obs;

  Future<void> signIn() async {
    final prefs = await SharedPreferences.getInstance();

    Response response;
    try {
      response = await _http.postRequest('/usuario/login', {
        'email': email.value.text,
        'password': password.value.text
      });

      print("response");
      print(response);

      if(response.statusCode == 200){
        userModel.value = UserModel.fromJson(response.data["usuario"]);
        await prefs.setString("TOKEN", "${response.data["token"]}");
        Get.snackbar('Sucesso!',
          "Login efetuado com sucesso!",
        );
        _clearControllers();
      }
    } catch (e) {
      Get.snackbar('Erro!',
        "Usuário ou Senha Inválidos!",
      );
    }
  }

  Future<void> signUp() async {

  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("TOKEN", "");
    userModel.value = UserModel();
  }

  _clearControllers() {
    nome.clear();
    email.clear();
    telefone.clear();
    password.clear();
  }
}
