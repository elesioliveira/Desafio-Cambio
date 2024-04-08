import 'package:desafio_cambio/src/componentes/buttom_sheet.dart';
import 'package:desafio_cambio/src/componentes/transferencia_de_cambio.dart';
import 'package:desafio_cambio/src/componentes/transferir.dart';
import 'package:desafio_cambio/src/page/home/controller/home_controller.dart';
import 'package:desafio_cambio/src/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = getIt<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeigth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // Evita que o teclado sobreponha o conteúdo
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  controller.limparDados(false);
                },
                icon: const Icon(Icons.restore))
          ],
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: sizeHeigth,
            width: sizeWidth,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  child: Column(
                    children: [
                      //De uma moeda para outra apresentação
                      CambioApresentacao(
                        tamanhoAltura: sizeHeigth * 0.125,
                        tamanhoLargura: sizeWidth / 2.5,
                        sizeWidth: sizeWidth,
                      ),
                      const Gap(20),
                      TransferirValores(
                        tamanhoLarguraContainer: sizeWidth,
                        tamanhoLarguraContainerPintado: sizeWidth * 0.86,
                        tamanhoAlturaContainerPintado: sizeHeigth * 0.048,
                      )
                    ],
                  ),
                ),
                ButtomSheet(
                  altura: sizeHeigth * 0.60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
