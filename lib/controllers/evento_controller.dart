import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_app/utils/http_service.dart';
import '../models/evento_model.dart';
import '../models/local_evento_model.dart';

class EventoController extends GetxController {
  final _http = HttpService();

  final page = RxInt(1);
  final perPage = RxInt(5);
  final isEmpty = RxBool(true);
  final isLoading = RxBool(false);
  final isUpdate = RxBool(false);

  static EventoController instance = Get.find();
  RxList<EventoModel> _eventos = RxList<EventoModel>([]);
  List<EventoModel> get eventos => _eventos.value;

  RxList<LocalEventoModel> _localEventos = RxList<LocalEventoModel>([]);
  List<LocalEventoModel> get localEventos => _localEventos.value;

  obterTodosEventos() async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("TOKEN", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZWx2eXMuZmVycmFyaUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVU0VSIiwiZXhwIjoxNjUxMTA5OTUyfQ.XoLLVSKDh1l1bwKGuRcecXMkg963jPYxsA6ATR5bYo0");

    Response response;
    _eventos = RxList<EventoModel>([]);
    try {
      response = await _http.getRequest('/evento');
      if(response.statusCode == 200){
        final List<EventoModel> eventoData = response.data
            .map((json) => EventoModel.fromJson(json))
            .toList()
            .cast<EventoModel>();

        _eventos.addAll(eventoData);
      }
    } catch (e) {
    }
  }

  obterTodosLocaisEventos() async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("TOKEN", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiZWx2eXMuZmVycmFyaUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVU0VSIiwiZXhwIjoxNjUxMTA5OTUyfQ.XoLLVSKDh1l1bwKGuRcecXMkg963jPYxsA6ATR5bYo0");

    Response response;
    _localEventos = RxList<LocalEventoModel>([]);
    try {
      response = await _http.getRequest('/evento/locais');
      if(response.statusCode == 200){
        final List<LocalEventoModel> localEventoData = response.data
            .map((json) => LocalEventoModel.fromJson(json))
            .toList()
            .cast<LocalEventoModel>();

        _localEventos.addAll(localEventoData);
      }
    } catch (e) {
    }
  }

}
