import 'package:desafio_cambio/src/page/home/controller/home_controller.dart';
import 'package:desafio_cambio/src/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ButtomSheet extends StatefulWidget {
  const ButtomSheet({super.key, required this.altura});
  final double altura;

  @override
  State<ButtomSheet> createState() => _ButtomSheetState();
}

class _ButtomSheetState extends State<ButtomSheet> {
  late HomeController controller;
  @override
  void initState() {
    super.initState();
    controller = getIt<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    double sizeLargura = MediaQuery.sizeOf(context).width;
    return Positioned(
      bottom: 50,
      right: 0,
      left: 0,
      child: Material(
        color: Colors.grey.shade700,
        surfaceTintColor: Colors.red,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        elevation: 4,
        child: FutureBuilder<bool>(
          future: controller.getAllCategories(),
          builder: (context, snapshot) {
            if (controller.allCategories.isNotEmpty) {
              return Container(
                padding: const EdgeInsets.only(top: 10),
                height: widget.altura,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                child: ListView.separated(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 60),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.setFromNameCountry(
                            nameCountry: controller.allCategories[index].pais,
                            sigla: controller.allCategories[index].sigla,
                          );
                        },
                        child: SizedBox(
                            width: sizeLargura,
                            // height: 100,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Gap(10),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.allCategories[index].sigla
                                          .toString(),
                                    ),
                                  ),
                                ),
                                const Gap(50),
                                Text(
                                  controller.allCategories[index].pais
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w200),
                                )
                              ],
                            )),
                      );
                    },
                    separatorBuilder: (index, context) {
                      return const Gap(15);
                    },
                    itemCount: controller.allCategories.length),
              );
            }
            if (controller.allCategories.isEmpty) {
              return Container(
                padding: const EdgeInsets.only(top: 10),
                height: widget.altura,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                child: const Center(
                  child: Text('Erro'),
                ),
              );
            } else {
              return Container(
                padding: const EdgeInsets.only(top: 10),
                height: widget.altura,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
