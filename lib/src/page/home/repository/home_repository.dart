import 'package:desafio_cambio/src/constantes/endpoints.dart';
import 'package:desafio_cambio/src/model/lista_de_moeda.dart';
import 'package:desafio_cambio/src/model/moeda_convertida_model.dart';
import 'package:desafio_cambio/src/page/home/resultConvertCambio/result_cambio.dart';
import 'package:desafio_cambio/src/page/home/resultEveryCambio/home_result.dart';
import 'package:desafio_cambio/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<HomeResult<Currency>> getAllMoedas() async {
    final result = await _httpManager.restRequest(
        url: Endpoints.listaMoedas, method: HttpMethods.requisicaoGet);

    if (result.isNotEmpty) {
      List<Currency> currencies = result.entries
          .map((entry) => Currency.fromJson({entry.key: entry.value}))
          .toList();
      return HomeResult<Currency>.success(currencies);
    } else {
      return HomeResult.error('Ocorreu um erro inesperado');
    }
  }

  Future<HomeResultCambio<ConverterMoeda>> converterCambio(
      {required String fromCambio,
      required String toCambio,
      required String valor}) async {
    String url =
        'https://api.frankfurter.app/latest?amount=$valor&from=$fromCambio&to=$toCambio';

    try {
      final result = await _httpManager.restRequest(
          url: url, method: HttpMethods.requisicaoGet);

      if (result.isNotEmpty) {
        final ConverterMoeda converterMoeda = ConverterMoeda.fromJson(result);
        return HomeResultCambio.success(converterMoeda);
      } else {
        return HomeResultCambio.error('Ocorreu um erro inesperado');
      }
    } catch (e) {
      return HomeResultCambio.error('Ocorreu um erro inesperado: $e');
    }
  }
}
