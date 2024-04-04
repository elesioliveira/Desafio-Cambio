import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilsServices {
  void showToast({
    required String message,
    bool isError = false,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 14,
    );
  }

  void mostrarDialog({
    required BuildContext context,
    required String moedaBase,
    required String data,
    required String conversao,
    required String quantidadeConvertera,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Converssão sucedida'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Data da conversão: $data'),
              Text('Moeda base: $moedaBase'),
              Text('Valor a converter: $quantidadeConvertera'),
              Text('Valor convertido: $conversao'),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
