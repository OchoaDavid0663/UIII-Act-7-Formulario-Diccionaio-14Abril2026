import 'package:flutter/material.dart';
import 'diccionarioempleado.dart';

class VerEmpleados extends StatefulWidget {
  const VerEmpleados({super.key});

  @override
  State<VerEmpleados> createState() => _VerEmpleadosState();
}

class _VerEmpleadosState extends State<VerEmpleados> {

  final azulOscuro = const Color(0xFF003882);
  final azulClaro = const Color(0xFF008CCF);
  final amarilloOscuro = const Color(0xFFFFCC00);

  @override
  Widget build(BuildContext context) {
    final listaEmpleados = datosEmpleado.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Directorio de Empleados', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: azulOscuro,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [azulClaro.withOpacity(0.1), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: listaEmpleados.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, spreadRadius: 2)
                        ]
                      ),
                      child: Icon(Icons.people_outline, size: 80, color: azulOscuro),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No hay empleados registrados',
                      style: TextStyle(fontSize: 20, color: azulOscuro, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: listaEmpleados.length,
                itemBuilder: (context, index) {
                  final empleado = listaEmpleados[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.only(bottom: 16),
                    shadowColor: azulOscuro.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: azulClaro.withOpacity(0.5), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: azulOscuro,
                            shape: BoxShape.circle,
                            border: Border.all(color: amarilloOscuro, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              empleado.id.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        title: Text(
                          empleado.nombre,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: azulOscuro),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.badge, size: 18, color: azulClaro),
                                  const SizedBox(width: 8),
                                  Text(
                                    empleado.puesto, 
                                    style: TextStyle(fontSize: 16, color: Colors.grey.shade800, fontWeight: FontWeight.w500)
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.monetization_on, size: 18, color: Colors.green.shade600),
                                  const SizedBox(width: 8),
                                  Text(
                                    '\$${empleado.salario.toStringAsFixed(2)}',
                                    style: TextStyle(fontSize: 16, color: Colors.green.shade700, fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
