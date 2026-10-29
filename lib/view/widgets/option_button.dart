import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String titulo;
  final String valor;
  final String seleccionado;
  final ValueChanged<String?> onChanged;
  final Color color;
  final IconData? icono;

  const OptionButton({
    super.key,
    required this.titulo,
    required this.valor,
    required this.seleccionado,
    required this.onChanged,
    this.color = Colors.blue,
    this.icono,
  });

  @override
  Widget build(BuildContext context) {
    final activo = valor == seleccionado;

    return GestureDetector(
      onTap: () => onChanged(valor),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: activo ? color.withOpacity(0.10) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: activo ? color : Colors.grey.shade300,
            width: activo ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            // Círculo que se rellena con el check al seleccionar
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activo ? color : Colors.transparent,
                border: Border.all(
                  color: activo ? color : Colors.grey,
                  width: 2,
                ),
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: activo
                    ? const Icon(
                  Icons.check,
                  key: ValueKey('check'),
                  size: 16,
                  color: Colors.white,
                )
                    : const SizedBox(key: ValueKey('vacio')),
              ),
            ),
            SizedBox(width: 14),
            if (icono != null) ...[
              Icon(icono, color: activo ? color : Colors.grey),
              SizedBox(width: 10),
            ],
            Expanded(
              child: Text(
                titulo,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: activo ? FontWeight.bold : FontWeight.normal,
                  color: activo ? color : Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}