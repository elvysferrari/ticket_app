import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import '../../../constants/app_themes.dart';
import '../../../constants/controllers.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                margin: const EdgeInsets.only(top: 30),
                child: TextField(
                  controller: userController.nome,
                  decoration: InputDecoration(
                      errorText: userController.validaNome(userController.nome.text),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.textGrey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      icon: Icon(Icons.person),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Nome"),
                  onChanged: (_) => setState(() {

                  }),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                margin: const EdgeInsets.only(top: 30),
                child: TextField(
                  controller: userController.email,
                  decoration: InputDecoration(
                      errorText: userController.validaEmail(userController.email.text),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.textGrey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      icon: Icon(Icons.email_outlined),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Email"),
                  onChanged: (_) => setState(() {

                  }),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                margin: const EdgeInsets.only(top: 30),
                child: TextField(
                  controller: userController.telefone,
                  decoration: InputDecoration(
                      errorText: userController.validaTelefone(userController.telefone.text),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.textGrey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      icon: Icon(Icons.phone),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Telefone"),
                  onChanged: (_) => setState(() {

                  }),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                margin: const EdgeInsets.only(top: 30),
                child: TextField(
                  controller: userController.password,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      errorText: userController
                          .validaSenha(userController.password.text),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: const Icon(Typicons.eye)),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.textGrey),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      icon: const Icon(Icons.lock),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Senha"),
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.90,
                height: 40,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: AppColors.primary,
                  ),
                  child: const Text(
                    'CADASTRAR',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (userController.botaoCadastrar())
                      userController.signUp();
                    else
                      Get.snackbar("Dados Inválidos!",
                          "Por favor preencha os campos baixo");
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
