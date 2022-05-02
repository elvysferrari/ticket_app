import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/constants/app_themes.dart';
import 'package:ticket_app/models/evento_model.dart';

class EventoDetalheScreen extends StatefulWidget {
  final EventoModel evento;
  const EventoDetalheScreen({Key? key, required this.evento}) : super(key: key);

  @override
  _EventoDetalheScreenState createState() =>
      _EventoDetalheScreenState();
}

class _EventoDetalheScreenState extends State<EventoDetalheScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: const Icon(
            Icons.chevron_left_rounded,
            color: Color(0xFF090F13),
            size: 32,
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              onPrimary: AppColors.primary,
              shadowColor: Colors.white
          ),
          onPressed: () {},
          child: const AutoSizeText(
            'VER INGRESSOS',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.evento.urlImagem ?? "",
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                    child: Text(
                      'EMBARQUE COM PK',
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF090F13),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ListTile(
                            leading: Icon(
                              Icons.location_on_outlined,
                            ),
                            title: Text(
                              'Aeroporto Belo Horizonte - Carlos Prates SBPR - Belo Horizonte -MG',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              'Rua Ocidente, 100, Padre Eustáquio, Belo Horizonte, MG, 30730-560',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            dense: false,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.access_time_outlined,
                            ),
                            title: Text(
                              'Sáb. 7 Mai. - 2020 > Dom.,  8 Mai - 2022',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              '21h - 04h',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            dense: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            decoration: const BoxDecoration(),
                            child: const Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 8, 0, 0),
                              child: Text(
                                'Descrição',
                                style: TextStyle(),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            decoration: const BoxDecoration(),
                            child: const Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                              child: AutoSizeText(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the...',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration: const BoxDecoration(),
                            child: const Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                'Ver descrição',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF0077CF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const ListTile(
                            title: Text(
                              'Aeroporto Belo Horizonte - Carlos Prates SBPR - Belo Horizonte -MG',
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              'Rua Ocidente, 100, Padre Eustáquio, Belo Horizonte, MG, 30730-560',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            dense: false,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: OutlinedButton.icon(
                                  label: const Text(
                                    'Ver no mapa',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "RobotoCondensed",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    side: const BorderSide(width: 1, color: Colors.black),
                                  ),
                                  icon: const Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                  ),
                                  onPressed: () {

                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            decoration: const BoxDecoration(),
                            child: const Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                'Organizador',
                                style: TextStyle(),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://picsum.photos/seed/836/600',
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Text(
                                      'Elvys Ferrari',
                                      style: TextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
