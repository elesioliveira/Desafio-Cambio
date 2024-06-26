import 'package:desafio_cambio/src/page/home/view/home_page.dart';
import 'package:desafio_cambio/src/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPaintSizeEnabled = false; // Ativar debug painting de tamanhos
  setupProviders();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'CAMBIO'),
    );
  }
}
