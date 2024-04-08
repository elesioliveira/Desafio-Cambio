// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously

import 'package:desafio_cambio/src/page/home/controller/home_controller.dart';
import 'package:desafio_cambio/src/providers/providers.dart';
import 'package:desafio_cambio/src/services/utils_services.dart';
import 'package:flutter/material.dart';

class TransferirValores extends StatefulWidget {
  const TransferirValores({
    Key? key,
    required this.tamanhoLarguraContainer,
    required this.tamanhoLarguraContainerPintado,
    required this.tamanhoAlturaContainerPintado,
  }) : super(key: key);
  final double tamanhoLarguraContainer;
  final double tamanhoLarguraContainerPintado;
  final double tamanhoAlturaContainerPintado;

  @override
  State<TransferirValores> createState() => _TransferirValoresState();
}

class _TransferirValoresState extends State<TransferirValores> {
  late HomeController controller;
  UtilsServices utilServices = UtilsServices();
  @override
  void initState() {
    super.initState();
    controller = getIt<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.tamanhoLarguraContainer,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: widget.tamanhoLarguraContainerPintado,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    return TextFormField(
                      controller: controller.valorConverter,
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.light,
                      onChanged: (value) async {
                        await controller.setValorCambio(value, context);
                      },
                      decoration: InputDecoration(
                        suffixIcon: controller.valorConverter.text.isEmpty
                            ? null
                            : Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: IconButton(
                                  onPressed: () {
                                    controller.limparDados(true);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    size: 40,
                                  ),
                                ),
                              ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Define o raio da borda
                        ),
                        labelText: 'Digite o valor a converter',
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
