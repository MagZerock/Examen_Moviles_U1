import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodel/empleado_viewmodel.dart';
import 'view/pantallas/inicio_pantalla.dart';
import 'view/pantallas/empleado_pantalla.dart';
import 'view/pantallas/resultado_pantalla.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EmpleadoViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const InicioPantalla(),
        '/empleado': (context) => const EmpleadoPantalla(),
        '/resultado': (context) => const ResultadoPantalla(),
      },
    );
  }
}