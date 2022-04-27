import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  final List<Widget> _screens = [
    const HomeScreen(),
    Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
    ),
    Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Viagens"),
      ),
    ),
    Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Mensagens"),
      ),
    ),
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
    MenuItemModel(icon: Icons.home_outlined, iconColor: Colors.grey, iconText: "Explorar", textColor:  Colors.grey),
    MenuItemModel(icon: Icons.favorite_outline, iconColor: Colors.grey, iconText: "Favoritos", textColor:  Colors.grey),
    MenuItemModel(icon: Icons.calendar_today, iconColor: Colors.grey, iconText: "Eventos", textColor:  Colors.grey),
    MenuItemModel(icon: Icons.messenger_outline, iconColor: Colors.grey, iconText: "Mensagens", textColor:  Colors.grey),
    MenuItemModel(icon: Icons.person_outlined, iconColor: Colors.grey, iconText: "Perfil", textColor:  Colors.grey),
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
