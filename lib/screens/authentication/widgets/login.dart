import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:ticket_app/constants/app_themes.dart';
import '../../../constants/controllers.dart';
import '../../../shared/widgets/custom_btn.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(10),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                margin: EdgeInsets.only(top: 30),
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
                    obscureText: _obscureText,
                    controller: userController.password,
                    decoration: InputDecoration(
                      errorText: userController.validaSenha(userController.password.text),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                          child: Icon(Typicons.eye)
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.textGrey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      icon: Icon(Icons.lock),
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Senha"),
                      onChanged: (_) => setState(() {

                      }),
                  ),
                ),

            ],
          ),

         Padding(
           padding: const EdgeInsets.only(top: 36.0),
           child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: 40,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: AppColors.primary,
                  ),
                  child: Text('ENTRAR', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  onPressed: () {
                    if(userController.botaoEntrar())
                      userController.signIn();
                    else
                      Get.snackbar("Dados Inv??lidos!", "Por favor preencha os campos baixo");
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