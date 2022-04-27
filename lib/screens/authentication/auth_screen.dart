import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app/screens/authentication/widgets/bottom_text.dart';
import 'package:ticket_app/screens/authentication/widgets/login.dart';
import 'package:ticket_app/screens/authentication/widgets/signup.dart';
import '../../constants/app_constants.dart';
import '../../constants/color_pallet.dart';
import '../../controllers/app_controller.dart';

class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width / 5),
              const Text(appName, style: TextStyle(
                fontSize: 48,
                color: PalletColor.textBlack
              ),),
              //Image.asset("", width: 200,height: 150,),
              const SizedBox(height: 32),
              Visibility(
                  visible: _appController.isLoginWidgetDisplayed.value,
                  child: LoginWidget()),
              Visibility(
                  visible: !_appController.isLoginWidgetDisplayed.value,
                  child: SignupWidget()),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: _appController.isLoginWidgetDisplayed.value,
                child: BottomTextWidget(
                  onTap: () {
                    _appController.changeDIsplayedAuthWidget();
                  },
                  text1: "Você não tem uma conta?",
                  text2: "Cadastre-se!",
                ),
              ),
              Visibility(
                visible: !_appController.isLoginWidgetDisplayed.value,
                child: BottomTextWidget(
                  onTap: () {
                    _appController.changeDIsplayedAuthWidget();
                  },
                  text1: "Você já tem uma conta?",
                  text2: "Entrar!!",
                ),
              ),
            ],
          ),
        ),)
    );
  }
}
