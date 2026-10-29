import 'package:flutter/material.dart';
import '../model/empleado_modelo.dart';

class EmpleadoViewModel extends ChangeNotifier {
  String desempeno = 'Alto';

  void seleccionarDesempeno(String valor) {
    desempeno = valor;
    notifyListeners();
  }

  EmpleadoModelo calcularBono(double sueldo, int antiguedad) {
    double porcentaje;

    if (antiguedad >= 10 && desempeno == 'Alto') {
      porcentaje = 0.20;
    } else if (antiguedad >= 5) {
      porcentaje = 0.10;
    } else {
      porcentaje = 0.05;
    }

    double bono = sueldo * porcentaje;
    double sueldoFinal = sueldo + bono;

    return EmpleadoModelo(
      sueldo: sueldo,
      antiguedad: antiguedad,
      desempeno: desempeno,
      porcentaje: porcentaje,
      bono: bono,
      sueldoFinal: sueldoFinal,
    );
  }
}