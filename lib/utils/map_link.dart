import 'package:url_launcher/url_launcher.dart';

class MapLink {

  MapLink._();

  static Future<void> abrirMapaCoordenada(double latitude, double longitude) async {
    final Uri _url = Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
    if (!await launchUrl(_url)) throw 'Não foi possível abrir a url: $_url';
  }

  static Future<void> abrirMapaEndereco(String address) async {
    String query = Uri.encodeComponent(address);
    final Uri _url = Uri.parse("https://www.google.com/maps/search/?api=1&query=$query");

    if (!await launchUrl(_url)) throw 'Não foi possível abrir a url: $_url';
  }
}