import 'package:get/get.dart';

import '../models/fique_por_dentro_item_model.dart';
import '../models/fique_por_dentro_model.dart';

class AppController extends GetxController{
  static AppController instance = Get.find();
  RxBool isLoginWidgetDisplayed = true.obs;


  changeDIsplayedAuthWidget(){
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }

  List<FiquePorDentro> getListMobileItemsBottom(){
    List<FiquePorDentro> _items = [];

    List<FiquePorDentroItem> items1 = [];
    List<FiquePorDentroItem> items2 = [];
    List<FiquePorDentroItem> items3 = [];

    FiquePorDentroItem item1 = FiquePorDentroItem(url: "", titulo: "Opções de contato", descricao: "Saiba como entrar em contato");
    items1.add(item1);

    FiquePorDentroItem item2 = FiquePorDentroItem(url: "", titulo: "Central de Ajuda", descricao: "Ajuda");
    items1.add(item2);

    FiquePorDentro hospedes = FiquePorDentro(titulo: "Para os usuários", items: items1);
    _items.add(hospedes);

    FiquePorDentroItem item3 = FiquePorDentroItem(url: "", titulo: "Recursos de banners", descricao: "Veja como criar");
    items2.add(item3);

    FiquePorDentroItem item4 = FiquePorDentroItem(url: "", titulo: "Como responder usuários", descricao: "Saiba como responder um contato");
    items2.add(item4);

    FiquePorDentro anfitrioes = FiquePorDentro(titulo: "Para os produtores", items: items2);

    _items.add(anfitrioes);

    FiquePorDentroItem item5 = FiquePorDentroItem(url: "", titulo: "Ticket 2022", descricao: "Conheça os principais recursos");
    items3.add(item5);

    FiquePorDentro mais = FiquePorDentro(titulo: "Mais", items: items3);
    _items.add(mais);

    return _items;
  }

}