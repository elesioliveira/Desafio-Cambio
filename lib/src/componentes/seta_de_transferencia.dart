import 'package:flutter/material.dart';

class SetaTransferencia extends StatelessWidget {
  const SetaTransferencia({super.key, required this.tamanhoAltura});
  final double tamanhoAltura;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: tamanhoAltura,
      bottom: 0,
      left: 0,
      right: 0,
      child: Align(
        alignment: Alignment.center,
        child: ClipOval(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.grey[100], // Cor de preenchimento do círculo
            child: Center(
              child: Icon(
                Icons.sync_alt,
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
