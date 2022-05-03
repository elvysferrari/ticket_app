import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app/constants/app_themes.dart';
import 'package:ticket_app/screens/authentication/auth_screen.dart';
import '../../constants/controllers.dart';
import '../evento/evento_list_tile.dart';

class FavoritoScreen extends StatefulWidget {
  const FavoritoScreen({Key? key}) : super(key: key);

  @override
  State<FavoritoScreen> createState() => _FavoritoScreenState();
}

class _FavoritoScreenState extends State<FavoritoScreen> {
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
                              "Favoritos",
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
                  return EventoListTileWidget(evento: eventoController.eventos[index]);
              },
              childCount: eventoController.eventos.length

              ,
              ),
            ),

          ]));
  }
}
