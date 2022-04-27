import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:intl/intl.dart';
import 'package:ticket_app/models/evento_model.dart';

class EventoWidget extends StatefulWidget {
  final EventoModel evento;
  final double width;
  final bool showDescricao;
  const EventoWidget({Key? key, required this.evento, required this.width, required this.showDescricao}) : super(key: key);

  @override
  State<EventoWidget> createState() => _EventoWidgetState();
}

class _EventoWidgetState extends State<EventoWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting('pt_BR', null);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: CachedNetworkImage(
                  imageUrl: widget.evento.urlImagem ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              flex: 2,
            ),
            widget.showDescricao ?
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text("${widget.evento.nome}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),
                    Expanded(child:Text("${DateFormat('dd/MM HH:mm', 'pt')
                        .format(DateTime.parse(widget.evento.dataHoraInicio!))} | ${widget.evento.localCidade} ", style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 10),)),
                  ],
                ),
              ),
              flex: 1,
            ) : Container(),

          ],
        ),

      ),
    );
  }
}
