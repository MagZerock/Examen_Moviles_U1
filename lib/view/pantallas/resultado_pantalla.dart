import 'package:flutter/material.dart';
import '../../model/empleado_modelo.dart';

class ResultadoPantalla extends StatelessWidget {
  const ResultadoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibir los parámetros
    final empleado =
    ModalRoute.of(context)!.settings.arguments as EmpleadoModelo;

    Widget dato(String titulo, String valor) {
      return ListTile(
        title: Text(titulo),
        trailing: Text(valor),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado del Bono'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Column(
                children: [
                  dato('Sueldo', '\$${empleado.sueldo.toStringAsFixed(2)}'),
                  dato('Antigüedad', '${empleado.antiguedad} años'),
                  dato('Desempeño', empleado.desempeno),
                  dato('Porcentaje de bono',
                      '${(empleado.porcentaje * 100).toStringAsFixed(0)}%'),
                  dato('Bono', '\$${empleado.bono.toStringAsFixed(2)}'),
                  Divider(),
                  dato('Sueldo Final',
                      '\$${empleado.sueldoFinal.toStringAsFixed(2)}'),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}