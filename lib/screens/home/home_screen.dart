import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_app/constants/app_constants.dart';
import 'package:ticket_app/constants/app_themes.dart';
import 'package:ticket_app/constants/controllers.dart';
import 'package:ticket_app/constants/responsive.dart';
import 'package:ticket_app/screens/evento/evento_lista_screen.dart';
import 'package:ticket_app/screens/home/widgets/cidade_widget.dart';
import 'package:ticket_app/screens/home/widgets/evento_widget.dart';
import '../../models/fique_por_dentro_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _scrollController = TrackingScrollController();



  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Responsive(
          mobile: HomeFull(scrollController: _scrollController,), desktop: HomeFull(scrollController: _scrollController,),
        ),
      ),
    );
  }
}

class HomeFull extends StatelessWidget {

  final TrackingScrollController scrollController;

  HomeFull({
    Key? key,
    required this.scrollController
  }) : super(key: key);

  final List<FiquePorDentro> _itemsFiquePorDentro = appController.getListMobileItemsBottom();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 140,
          floating: false,
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: <Widget>[
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(appName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 6.0, 24.0, 18.0),
                  child: SizedBox(
                    height: 50.0,
                    width: double.infinity,
                    child: CupertinoTextField(
                      controller: eventoController.textoProcura,
                      keyboardType: TextInputType.text,
                      placeholder: 'Pesquisar eventos, shows...',
                      placeholderStyle: const TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 16.0,
                        fontFamily: 'Brutal',
                      ),
                      prefix: const Padding(
                        padding:
                        EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                        child: Icon(
                          Icons.search,
                          color: AppColors.primary,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffF0F1F5),
                      ),

                      onChanged: (String text) {
                        eventoController.filtrarEventos();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 20,
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.only(left: 20, right: 18),
              child: Text("Em Destaque no Ticket", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textBlack),),
            ),
          )
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Container(
              color: Colors.white,
              height: 175.0,
              child: Obx(() =>
              eventoController.eventos.isEmpty ?
              const Center(
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()
                  )
              )
                  :
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eventoController.eventos.length,
                itemBuilder: (context, index) {
                  var evento = eventoController.eventos[index];
                  if(evento.destaque == "S") {
                    return EventoWidget(evento: evento, width: 300, showDescricao: false,);
                  } else {
                    return Container();
                  }
                },
              )
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 20),
          sliver: SliverToBoxAdapter(
              child: Container(
                height: 20,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Shows e Festas", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textBlack),),
                      GestureDetector(
                        onTap: (){
                          Get.to(EventoListaScreen(categoria: "Shows e Festas", eventos: eventoController.eventos));
                        },
                        child: const Text("Ver mais",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),
        ),
        //Lista de Shows
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Container(
              color: Colors.white,
              height: 125.0,
              child: Obx(() =>
              eventoController.eventosFiltrados.isEmpty ?
              const Center(
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()
                  )
              )
                  :
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eventoController.eventosFiltrados.length,
                itemBuilder: (context, index) {
                  return EventoWidget(evento: eventoController.eventosFiltrados[index], width: 150, showDescricao: true,);
                },
              )
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 20),
          sliver: SliverToBoxAdapter(
              child: Container(
                height: 30,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("O melhor de cada cidade", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textBlack),),
                    ],
                  ),
                ),
              )
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Container(
              color: Colors.white,
              height: 200.0,
              child: Obx(() =>
              eventoController.localEventos.isEmpty ?
              const Center(
                  child: SizedBox(
                      height: 75,
                      width: 75,
                      child: CircularProgressIndicator()
                  )
              )
                  :
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: eventoController.localEventos.length,
                itemBuilder: (context, index) {
                  return CidadeWidget(local: eventoController.localEventos[index]);
                },
              )
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 20),
          sliver: SliverToBoxAdapter(
              child: Container(
                height: 60,
                color: Colors.grey[100],
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 18, top: 18),
                  child: Text("Fique por dentro", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textBlack),),
                ),
              )
          ),
        ),
        //Lista Fique por dentro
        SliverToBoxAdapter(
          child: Container(
            color: Colors.grey[100],
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _itemsFiquePorDentro.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 225.0,
                  child: Card(
                    color: Colors.grey[100],
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: SizedBox(
                            height: 20,
                            child: Text(_itemsFiquePorDentro[index].titulo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.textBlack),)
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _itemsFiquePorDentro[index].items.map((item) {
                            return ListTile(
                              title: Text(item.titulo, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.textBlack)),
                              subtitle: Text(item.descricao, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.textGrey)),
                            );
                          }).toList()
                      ),
                    ]
                    ),

                  ),
                );
              },
            ),
          ),
        ),

      ],
    );
  }
}

