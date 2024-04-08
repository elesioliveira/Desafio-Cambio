// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:desafio_cambio/src/model/lista_de_moeda.dart';
import 'package:desafio_cambio/src/model/moeda_convertida_model.dart';
import 'package:desafio_cambio/src/page/home/repository/home_repository.dart';
import 'package:desafio_cambio/src/page/home/resultConvertCambio/result_cambio.dart';
import 'package:desafio_cambio/src/page/home/resultEveryCambio/home_result.dart';
import 'package:desafio_cambio/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeController with ChangeNotifier {
  final homeRespository = HomeRepository();
  final utilsServices = UtilsServices();
  bool carregando = false;
  List<Currency> allCategories = [];
  late ConverterMoeda cambioConvertido;
  final TextEditingController _valorConverter = TextEditingController();
  String _fromSigla = '';
  String _toSigla = '';
  String _fromNameCountry = '';
  String _toNameCountry = '';
  UtilsServices utilServices = UtilsServices();
  Timer? _timer;

  TextEditingController get valorConverter => _valorConverter;
  String get fromSigla => _fromSigla;
  String get toSigla => _toSigla;
  String get fromNameCountry => _fromNameCountry;
  String get toNameCountry => _toNameCountry;

  setFromNameCountry({required String sigla, required String nameCountry}) {
    if (_fromSigla.isEmpty) {
      _fromSigla = sigla;
      _fromNameCountry = nameCountry;
      notifyListeners();
      return;
    } else {
      _toSigla = sigla;
      _toNameCountry = nameCountry;
      notifyListeners();
    }
  }

  setValorCambio(String value, BuildContext context) {
    // Cancela o timer existente para evitar múltiplas chamadas
    _timer?.cancel();
    // Configura um novo timer para executar a função após 2 segundos
    _timer = Timer(const Duration(seconds: 2), () {
      _valorConverter.text = value;
      notifyListeners();
      if (_fromSigla.isEmpty && _toSigla.isEmpty) {
        utilServices.showToast(message: 'Informe o cambio');
        return;
      } else {
        getValorCambio(context);
      }
    });
  }

  Future<void> getValorCambio(BuildContext context) async {
    if (_valorConverter.text.isNotEmpty) {
      await getConverterCambio(
          fromSigla: _fromSigla,
          toSigla: _toSigla,
          valorConverter: _valorConverter.text);
      utilServices.mostrarDialog(
          context: context,
          conversao: cambioConvertido.cotacao.toString(),
          moedaBase: cambioConvertido.base,
          data: cambioConvertido.data,
          quantidadeConvertera: cambioConvertido.quantia.toStringAsFixed(2));
    }
  }

  String formatDate(DateTime dateTime) {
    // Formata a data e hora no formato brasileiro
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(dateTime);
  }

  limparDados(bool isEntradaTexto) {
    if (isEntradaTexto == true) {
      _valorConverter.text = '';
      notifyListeners();
      return;
    }
    _fromSigla = '';
    _toSigla = '';
    _fromNameCountry = '';
    _toNameCountry = '';
    _valorConverter.text = '';
    notifyListeners();
  }

  setLoading(bool value) {
    carregando = value;
    notifyListeners();
  }

  Future<void> getConverterCambio(
      {required String fromSigla,
      required String toSigla,
      required String valorConverter}) async {
    setLoading(true);
    HomeResultCambio<ConverterMoeda> homeResult =
        await homeRespository.converterCambio(
            fromCambio: fromSigla, toCambio: toSigla, valor: valorConverter);
    setLoading(false);
    homeResult.when(
      success: (data) {
        cambioConvertido = data;
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<bool> getAllCategories() async {
    HomeResult<Currency> homeResult = await homeRespository.getAllMoedas();
    homeResult.when(
      success: (data) {
        allCategories.addAll(data);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
    return allCategories.isNotEmpty;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
