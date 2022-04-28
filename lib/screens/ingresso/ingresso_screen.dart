import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_themes.dart';
import '../../constants/controllers.dart';
import '../authentication/auth_screen.dart';
import '../favorito/evento_list.dart';

class IngressoScreen extends StatefulWidget {
  const IngressoScreen({Key? key}) : super(key: key);

  @override
  State<IngressoScreen> createState() => _IngressoScreenState();
}

class _IngressoScreenState extends State<IngressoScreen> {
  final _itemExtent = 60.0;
  @override
  Widget build(BuildContext context) {
    return Obx(() => userController.userModel.value.id == null
        ? AuthenticationScreen()
        : CustomScrollView(slivers: [
      SliverAppBar(
        backgroundColor: Colors.white,
        expandedHeight: 50,
        floating: false,
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Column(
            children: <Widget>[
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Container(
                      child: const Text(
                        "Ingressos",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SliverFixedExtentList(
        itemExtent: _itemExtent,
        delegate: SliverChildBuilderDelegate((ctx, index) {
          return ListTile(
            title: Text("Ingresso: ${index} "),
          );
        }, childCount: eventoController.eventos.length

          ,
        ),
      ),

    ]));
  }
}
