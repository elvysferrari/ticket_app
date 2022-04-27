import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app/screens/home/initial_screen.dart';
import 'package:get/get.dart';
import 'controllers/app_controller.dart';
import 'controllers/evento_controller.dart';
import 'controllers/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(UserController());
  Get.put(AppController());
  Get.put(EventoController());

  Intl.defaultLocale = 'pt_BR';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(child: InitialScreen()),
    );
  }
}

