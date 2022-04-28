import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:ticket_app/constants/app_themes.dart';
import 'package:ticket_app/constants/controllers.dart';
import 'package:ticket_app/screens/authentication/auth_screen.dart';

class UsuarioScreen extends StatefulWidget {
  const UsuarioScreen({Key? key}) : super(key: key);

  @override
  State<UsuarioScreen> createState() => _UsuarioScreenState();
}

class _UsuarioScreenState extends State<UsuarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => userController.userModel.value.id == null
        ? AuthenticationScreen()
        : CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    height: 150,
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: ClipOval(
                              child: CachedNetworkImage(
                            imageUrl:
                                "https://cdn.uso.com.br/40131/2020/12/134222186.jpg",
                            fit: BoxFit.cover,
                          )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${userController.userModel.value.nome!.toUpperCase()}",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textBlack),
                            ),
                            Text("${userController.userModel.value.email}",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.textGrey))
                            ,
                            Text("${userController.userModel.value.telefone}",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.textGrey))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: AppColors.primary,
                    ),
                    child: const Text('Editar Perfil'),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Minha Conta",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      ListTile(
                        title: Text("Alterar Senha",
                            style: TextStyle(fontSize: 14)),
                        leading: Icon(Typicons.lock),
                        trailing: Icon(Typicons.right_small),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Central de Ajuda",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      ListTile(
                        title: Text("Alterar senha",
                            style: TextStyle(fontSize: 14)),
                        leading: Icon(Typicons.info_outline),
                        trailing: Icon(Typicons.right_small),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Privacidade",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      ListTile(
                        title: Text("Termos e Políticas",
                            style: TextStyle(fontSize: 14)),
                        leading: Icon(Typicons.doc_text),
                        trailing: Icon(Typicons.right_small),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: AppColors.textDanger,
                    ),
                    child: Text('Sair da Conta'),
                    onPressed: () {
                      userController.signOut();
                    },
                  ),
                ),
              ]))
            ],
          ));
  }
}
