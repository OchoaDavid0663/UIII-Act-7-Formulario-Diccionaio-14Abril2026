import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Farmacias Similares', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF003882), // Azul oscuro Similares
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF003882), Color(0xFF008CCF)], // Azul oscuro a azul claro
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 15, spreadRadius: 5)
                ],
                border: Border.all(color: const Color(0xFF008CCF), width: 4), // Borde azul claro
              ),
              child: const Icon(Icons.local_pharmacy, size: 90, color: Color(0xFF003882)), // Icono de farmacia
            ),
            const SizedBox(height: 40),
            const Text(
              'Gestión de Personal',
              style: TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.w900, 
                color: Colors.white,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(color: Colors.black45, offset: Offset(2, 2), blurRadius: 4),
                ]
              ),
            ),
            const SizedBox(height: 60),
            _buildMenuButton(
              context: context,
              icon: Icons.person_add,
              label: 'Capturar Empleados',
              route: '/captura',
              color: Colors.white,
              textColor: const Color(0xFF003882), // Letras azules
            ),
            const SizedBox(height: 25),
            _buildMenuButton(
              context: context,
              icon: Icons.list_alt,
              label: 'Directorio de Empleados',
              route: '/ver',
              color: const Color(0xFFFFCC00), // Amarillo llamativo
              textColor: const Color(0xFF003882), // Letras azules
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required BuildContext context, 
    required IconData icon, 
    required String label, 
    required String route,
    required Color color,
    required Color textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        icon: Icon(icon, size: 28, color: textColor),
        label: Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: color,
          elevation: 8,
          shadowColor: Colors.black45,
          minimumSize: const Size(double.infinity, 60),
        ),
      ),
    );
  }
}
