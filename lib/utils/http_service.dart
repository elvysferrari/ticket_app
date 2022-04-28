import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

class HttpService{
  late Dio _dio;

  HttpService(){
    _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,)
    );

    initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async{
    Response response;
    try{
      response = await _dio.get(endPoint);
    } on DioError catch (e){
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> postRequest(String endPoint, data) async{
    Response response;
    try{
      response = await _dio.post(endPoint, data: data);
    } on DioError catch (e){
      throw Exception(e.message);
    }
    return response;
  }

  Future<void> initializeInterceptors() async {
    final prefs = await SharedPreferences.getInstance();
    var accessToken = await prefs.getString("TOKEN");
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options); //continue
        },
        onResponse:(response,handler) {
          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          if(e.response?.statusCode == 401){
            Get.snackbar("Usuário não logado", "Por favor faça login!", duration: const Duration(seconds: 5));
          }
          if(e.response?.statusCode == 500){
            Get.snackbar("Erro Interno", "O servidor encontrou uma situação com a qual não sabe lidar!", duration: const Duration(seconds: 5));
          }
          if(e.response?.statusCode == 503){
            Get.snackbar("Erro de Conexão", "Servidor em manutenção!", duration: const Duration(seconds: 5));
          }
          return  handler.next(e);//continue
        }
    ));
  }
}