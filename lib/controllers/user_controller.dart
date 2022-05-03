import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'  hide Response;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/controllers.dart';
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

      if(response.statusCode == 200){
        userModel.value = UserModel.fromJson(response.data["usuario"]);
        await prefs.setString("TOKEN", "${response.data["token"]}");

        Map<String, dynamic> usuario = {'email':email.value.text,'password':password.value.text};
        await prefs.setString("usuario", jsonEncode(usuario));

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

  Future<void> automaticSignIn(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    Response response;
    try {
      response = await _http.postRequest('/usuario/login', {
        'email': email,
        'password': password
      });

      if(response.statusCode == 200){
        userModel.value = UserModel.fromJson(response.data["usuario"]);
        await prefs.setString("TOKEN", "${response.data["token"]}");
      }
    } catch (e) {
    }
  }

  Future<void> signUp() async {
    final prefs = await SharedPreferences.getInstance();

    Response response;
    try {
      response = await _http.postRequest('/usuario/criar-usuario', {
        'nome': nome.value.text,
        'email': email.value.text,
        'telefone': telefone.value.text,
        'password': password.value.text,
        'foto': ''
      });

      if(response.statusCode == 200){
        if(response.data["successful"] == false) {
          Get.snackbar('Erro!',
            "${response.data["message"]}",
          );
        }else {
          userModel.value = UserModel.fromJson(response.data["usuario"]);
          await prefs.setString("TOKEN", "${response.data["token"]}");
          Map<String, dynamic> usuario = {'email':email.value.text,'password':password.value.text};
          await prefs.setString("usuario", jsonEncode(usuario));
          Get.snackbar('Sucesso!',
            "Usuário cadastrado com sucesso!",
          );
          _clearControllers();
        }
      }
    } catch (e) {
      Get.snackbar('Erro!',
        "${e.toString()}!",
      );
    }
  }

  Future<void> signOut() async {
    userModel.value = UserModel();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("TOKEN", "");
    await prefs.setString("usuario", "");

    appController.isLoginWidgetDisplayed.value = true;
  }

  _clearControllers() {
    nome.clear();
    email.clear();
    telefone.clear();
    password.clear();
  }

  String? validaNome(String text) {
    if (text.isNotEmpty) {
      if(text.length < 8)
        return 'Informe um nome válido';
    }
    return null;
  }

  String? validaTelefone(String text) {
    if (text.isNotEmpty) {
      if(!text.isPhoneNumber)
        return 'Informe um telefone válido';
    }
    return null;
  }

  String? validaEmail(String text) {
    if (text.isNotEmpty) {
      if(!text.isEmail)
        return 'Informe um email válido';
    }
    return null;
  }

  String? validaSenha(String text) {
    if (text.isNotEmpty) {
      if(text.length < 8)
        return 'Senha muito curta!';
    }
    return null;
  }

  bool botaoEntrar() {

    if(userController.email.text.isEmpty)
      return false;

    if(userController.password.text.isEmpty)
      return false;

    if(validaEmail(userController.email.text) != null)
      return false;

    if(validaSenha(userController.password.text) != null)
      return false;

    return true;
  }

  bool botaoCadastrar() {

    if(userController.nome.text.isEmpty)
      return false;

    if(userController.telefone.text.isEmpty)
      return false;

    if(userController.email.text.isEmpty)
      return false;

    if(userController.password.text.isEmpty)
      return false;

    if(validaEmail(userController.email.text) != null)
      return false;

    if(validaSenha(userController.password.text) != null)
      return false;

    if(validaTelefone(userController.telefone.text) != null)
      return false;

    if(validaNome(userController.nome.text) != null)
      return false;

    return true;
  }
}
