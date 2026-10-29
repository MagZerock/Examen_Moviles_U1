import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoNumero extends StatelessWidget {
  final String etiqueta;
  final IconData icono;
  final TextEditingController controller;
  final bool permitirDecimales;

  const CampoNumero({
    super.key,
    required this.etiqueta,
    required this.icono,
    required this.controller,
    this.permitirDecimales = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorPrimario = Theme.of(context).colorScheme.primary;

    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: permitirDecimales),
      inputFormatters: [
        permitirDecimales
            ? FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
            : FilteringTextInputFormatter.digitsOnly,
      ],
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: Icon(icono, color: colorPrimario),
        filled: true,
        fillColor: colorPrimario.withOpacity(0.06),
        contentPadding:
        EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorPrimario, width: 2),
        ),
      ),
    );
  }
}