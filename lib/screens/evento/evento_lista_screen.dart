import 'package:flutter/material.dart';
import 'package:ticket_app/constants/app_themes.dart';
import 'package:ticket_app/models/evento_model.dart';
import '../evento/evento_list_tile.dart';

class EventoListaScreen extends StatefulWidget {
  final List<EventoModel> eventos;
  final String categoria;

  const EventoListaScreen({Key? key, required this.categoria, required this.eventos}) : super(key: key);

  @override
  State<EventoListaScreen> createState() => _EventoListaScreenState();
}

class _EventoListaScreenState extends State<EventoListaScreen> {
  final _itemExtent = 60.0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
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
                    child: Text(
                      widget.categoria,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
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
        delegate: SliverChildBuilderDelegate(
          (ctx, index) {
            return EventoListTileWidget(evento: widget.eventos[index]);
          },
          childCount: widget.eventos.length,
        ),
      ),
    ]);
  }
}
