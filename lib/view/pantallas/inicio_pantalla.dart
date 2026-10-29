import 'package:flutter/material.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.workspace_premium, size: 100, color: Colors.blue),
            const SizedBox(height: 20),

            const Text(
              'Calculadora de Bonos',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Text(
              'Gestión y asignación de bonos laborales para empleados.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Reglas del bono
            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.blue),
                    title: Text('10 años o más y desempeño alto'),
                    trailing: Text('20%'),
                  ),
                  ListTile(
                    leading: Icon(Icons.schedule, color: Colors.blue),
                    title: Text('5 años o más de antigüedad'),
                    trailing: Text('10%'),
                  ),
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.blue),
                    title: Text('Los demás casos'),
                    trailing: Text('5%'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/empleado');
              },
              child: const Text('Comenzar'),
            ),
          ],
        ),
      ),
    );
  }
}