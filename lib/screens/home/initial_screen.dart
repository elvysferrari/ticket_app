import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_app/screens/explorar/explorar_screen.dart';
import 'package:ticket_app/screens/favorito/favorito_screen.dart';
import 'package:ticket_app/screens/ingresso/ingresso_screen.dart';
import '../../constants/controllers.dart';
import '../../models/menu_item_model.dart';
import '../../shared/widgets/navigation_bar_mobile.dart';
import '../user/usuario_screen.dart';
import 'home_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_){
      loadEventos();
      loginUsuario();
    });

    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  loadEventos() async {
    await eventoController.obterTodosEventos();
    await eventoController.obterTodosLocaisEventos();
  }

  loginUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    String? usuario = prefs.getString("usuario");

    if(usuario != null) {
      if(usuario.isNotEmpty) {
        Map<String, dynamic> userMap = jsonDecode(usuario) as Map<
            String,
            dynamic>;
        userController.automaticSignIn(userMap["email"], userMap["password"]);
      }
    }
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExplorarScreen(),
    const IngressoScreen(),
    const FavoritoScreen(),
    const UsuarioScreen()
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.star,
    Icons.category,
    Icons.message,
    Icons.person,
  ];

  final List<MenuItemModel> _menuItems = [
    MenuItemModel(icon: Typicons.home_outline, iconColor: Colors.grey, iconText: "HOME", textColor:  Colors.grey),
    MenuItemModel(icon: Typicons.location, iconColor: Colors.grey, iconText: "EXPLORAR", textColor:  Colors.grey),
    MenuItemModel(icon: Typicons.ticket, iconColor: Colors.grey, iconText: "INGRESSOS", textColor:  Colors.grey),
    MenuItemModel(icon: Typicons.heart, iconColor: Colors.grey, iconText: "FAVORITOS", textColor:  Colors.grey),
    MenuItemModel(icon: Typicons.user_outline, iconColor: Colors.grey, iconText: "PERFIL", textColor:  Colors.grey),
  ];

  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: _screens,
          ),
          bottomNavigationBar: NavigationBarMobile(
            menuItems: _menuItems,
            selectedTabIndex: _selectedTabIndex,
            onTap: (index){
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
        )
    );
  }
}
