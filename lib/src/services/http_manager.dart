import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String requisicaoPost = 'POST';
  static const String requisicaoGet = 'GET';
  static const String requisicaoPut = 'PUT';
  static const String requisicaoPatch = 'Patch';
  static const String requisicaoDelete = 'DELETE';
}

class HttpManager {
  Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    // Headers da requisição
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json; charset=utf-8',
        'accept': 'application/json',
      });
    Dio dio = Dio();

    try {
      Response response = await dio.request(url,
          options: Options(headers: defaultHeaders, method: method),
          data: body);
      // Retorno do resultado do backend
      return response.data;
    } on DioException catch (error) {
      // Retorno do erro do dio request
      return error.response?.data ?? {};
    } catch (error) {
      // Retorno de map vazio para error generalizado
      return {};
    }
  }

  Future<Map<dynamic, dynamic>> converterMoeda({
    required String url,
    Map<String, String>? headers,
    required String method,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json; charset=utf-8',
        'accept': 'application/json',
      });
    Dio dio = Dio();

    try {
      Response response = await dio.request(url,
          options: Options(headers: defaultHeaders, method: method));

      return response.data;
    } on DioException catch (error) {
      // Retorno do erro do dio request
      return error.response?.data ?? {};
    } catch (error) {
      // Retorno de map vazio para error generalizado
      return {};
    }
  }
}
