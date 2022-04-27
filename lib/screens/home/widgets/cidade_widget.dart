import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/models/local_evento_model.dart';

class CidadeWidget extends StatefulWidget {
  final LocalEventoModel local;
  const CidadeWidget({Key? key, required this.local}) : super(key: key);

  @override
  State<CidadeWidget> createState() => _CidadeWidgetState();
}

class _CidadeWidgetState extends State<CidadeWidget> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    const _width = 150.0;

    return SizedBox(
      width: _width,
      child: Card(
        elevation: 0,
        child: Stack(
          children: [
            SizedBox(
              height: _height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: CachedNetworkImage(
                  imageUrl: "https://cdn.uso.com.br/40131/2020/12/134222186.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              child: Container(
                width: _width,
                child: Text(widget.local.cidade,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white,
                      fontSize: 14, fontWeight: FontWeight.bold,

                  ),),
              )
            )
          ],
        ),

      ),
    );
  }
}
