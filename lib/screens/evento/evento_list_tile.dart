import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app/constants/app_themes.dart';

import '../../models/evento_model.dart';

class EventoListTileWidget extends StatefulWidget {
  final EventoModel evento;

  const EventoListTileWidget({Key? key, required this.evento}) : super(key: key);

  @override
  State<EventoListTileWidget> createState() => _EventoListTileWidgetState();
}

class _EventoListTileWidgetState extends State<EventoListTileWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting('pt_BR', null);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 64,
          maxHeight: 64,
        ),
        child: CachedNetworkImage(
          imageUrl: widget.evento.urlImagem ?? "",
          fit: BoxFit.cover,
        ),
      ),
      title: Text("${widget.evento.nome}"),
      subtitle: Text(DateFormat('dd/MM - HH:mm', 'pt')
          .format(DateTime.parse(widget.evento.dataHoraInicio!)), style: const TextStyle(color: AppColors.textDanger),),
      trailing: const Icon(Typicons.right_small),
    );
  }
}
