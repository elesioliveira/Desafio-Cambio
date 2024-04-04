// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:desafio_cambio/src/componentes/seta_de_transferencia.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:desafio_cambio/src/page/home/controller/home_controller.dart';
import 'package:desafio_cambio/src/providers/providers.dart';

class CambioApresentacao extends StatefulWidget {
  const CambioApresentacao({
    Key? key,
    required this.tamanhoLargura,
    required this.sizeWidth,
    required this.tamanhoAltura,
  }) : super(key: key);
  final double tamanhoLargura;
  final double tamanhoAltura;

  final double sizeWidth;

  @override
  State<CambioApresentacao> createState() => _CambioApresentacaoState();
}

class _CambioApresentacaoState extends State<CambioApresentacao> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = getIt<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    // Obtém o DateTime atual
    DateTime dateTimeNow = DateTime.now();
    String formattedDateTime = controller.formatDate(dateTimeNow);

    return SizedBox(
      width: widget.sizeWidth,
      child: Stack(
        children: [
          SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        width: widget.tamanhoLargura,
                        height: widget.tamanhoAltura,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            child: Column(
                              children: [
                                const Text('De'),
                                AnimatedBuilder(
                                  animation: controller,
                                  builder: (context, _) {
                                    return SizedBox(
                                      child: Column(
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              controller.fromSigla.isEmpty
                                                  ? 'Cambio'
                                                  : controller.fromSigla,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ),
                                          const Gap(5),
                                          FittedBox(
                                            child: Text(
                                              controller.fromNameCountry.isEmpty
                                                  ? 'info'
                                                  : controller.fromNameCountry,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        width: widget.tamanhoLargura,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            formattedDateTime,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        width: widget.tamanhoLargura,
                        height: widget.tamanhoAltura,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            child: Column(
                              children: [
                                const Text('Para'),
                                AnimatedBuilder(
                                  animation: controller,
                                  builder: (context, _) {
                                    return SizedBox(
                                      child: Column(
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              controller.toSigla.isEmpty
                                                  ? 'Cambio'
                                                  : controller.toSigla,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ),
                                          const Gap(5),
                                          FittedBox(
                                            child: Text(
                                              controller.toNameCountry.isEmpty
                                                  ? 'info'
                                                  : controller.toNameCountry,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        width: widget.tamanhoLargura,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(formattedDateTime),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SetaTransferencia(tamanhoAltura: -60),
        ],
      ),
    );
  }
}
