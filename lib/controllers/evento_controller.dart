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
  RxList<EventoModel> eventos = <EventoModel>[].obs;
  RxList<LocalEventoModel> localEventos = <LocalEventoModel>[].obs;

  Future obterTodosEventos() async {
    Response response;
    eventos.value = [];
    try {
      response = await _http.getRequest('/evento');
      if(response.statusCode == 200){
        final List<EventoModel> eventoData = response.data
            .map((json) => EventoModel.fromJson(json))
            .toList()
            .cast<EventoModel>();

        eventos.value.addAll(eventoData);
        eventos.refresh();
      }
    } catch (e) {
    }
  }

  Future obterTodosLocaisEventos() async {
    Response response;
    localEventos.value = [];
    try {
      response = await _http.getRequest('/evento/locais');
      if(response.statusCode == 200){
        final List<LocalEventoModel> localEventoData = response.data
            .map((json) => LocalEventoModel.fromJson(json))
            .toList()
            .cast<LocalEventoModel>();

        localEventos.value.addAll(localEventoData);
        localEventos.refresh();
      }
    } catch (e) {
    }
  }

}
