import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/empleado_viewmodel.dart';
import '../widgets/campo_numero.dart';
import '../widgets/option_button.dart';

class EmpleadoPantalla extends StatefulWidget {
  const EmpleadoPantalla({super.key});

  @override
  State<EmpleadoPantalla> createState() => _EmpleadoPantallaState();
}

class _EmpleadoPantallaState extends State<EmpleadoPantalla> {
  final sueldoController = TextEditingController();
  final antiguedadController = TextEditingController();

  void calcular() {
    if (sueldoController.text.isEmpty || antiguedadController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    double sueldo = double.parse(sueldoController.text);
    int antiguedad = int.parse(antiguedadController.text);

    // context.read: llama al ViewModel
    final vm = context.read<EmpleadoViewModel>();
    final resultado = vm.calcularBono(sueldo, antiguedad);

    // Paso de parámetros con arguments
    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    // context.watch: se redibuja cuando cambia el ViewModel
    final vm = context.watch<EmpleadoViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos del Empleado'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CampoNumero(
              etiqueta: 'Sueldo',
              icono: Icons.attach_money,
              controller: sueldoController,
              permitirDecimales: true,
            ),
            const SizedBox(height: 15),
            CampoNumero(
              etiqueta: 'Años de antigüedad',
              icono: Icons.calendar_today,
              controller: antiguedadController,
            ),
            const SizedBox(height: 20),
            const Text(
              'Nivel de desempeño',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            OptionButton(
              titulo: 'Alto',
              valor: 'Alto',
              color: Colors.green,
              seleccionado: vm.desempeno,
              onChanged: (valor) => vm.seleccionarDesempeno(valor!),
            ),
            OptionButton(
              titulo: 'Medio',
              valor: 'Medio',
              color: Colors.orange,
              seleccionado: vm.desempeno,
              onChanged: (valor) => vm.seleccionarDesempeno(valor!),
            ),
            OptionButton(
              titulo: 'Bajo',
              valor: 'Bajo',
              color: Colors.red,
              seleccionado: vm.desempeno,
              onChanged: (valor) => vm.seleccionarDesempeno(valor!),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calcular,
                child: const Text('Calcular Bono'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}