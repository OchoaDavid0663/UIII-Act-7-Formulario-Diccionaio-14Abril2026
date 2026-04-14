import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class CapturaEmpleados extends StatefulWidget {
  const CapturaEmpleados({super.key});

  @override
  State<CapturaEmpleados> createState() => _CapturaEmpleadosState();
}

class _CapturaEmpleadosState extends State<CapturaEmpleados> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _puestoController = TextEditingController();
  final _salarioController = TextEditingController();

  // Colores principales de Farmacias Similares
  final azulOscuro = const Color(0xFF003882);
  final azulClaro = const Color(0xFF008CCF);
  final amarilloOscuro = const Color(0xFFFFCC00);

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      final nombre = _nombreController.text;
      final puesto = _puestoController.text;
      final salario = double.tryParse(_salarioController.text) ?? 0.0;

      GuardarDatosDiccionario.guardarEmpleado(
        nombre: nombre,
        puesto: puesto,
        salario: salario,
      );

      _nombreController.clear();
      _puestoController.clear();
      _salarioController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('¡Empleado guardado exitosamente!', style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: azulClaro,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _puestoController.dispose();
    _salarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capturar Empleado', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: azulOscuro,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [azulClaro.withOpacity(0.1), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 12,
            shadowColor: azulOscuro.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: azulClaro, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: azulOscuro.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person_add_alt_1, size: 50, color: azulOscuro),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Nuevo Registro',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.bold, 
                        color: azulOscuro
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildTextField(
                      controller: _nombreController,
                      label: 'Nombre Completo',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: _puestoController,
                      label: 'Puesto Asignado',
                      icon: Icons.work_outline,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: _salarioController,
                      label: 'Salario Mensual',
                      icon: Icons.attach_money,
                      isNumeric: true,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: _guardar,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        backgroundColor: amarilloOscuro,
                        foregroundColor: azulOscuro,
                        elevation: 6,
                      ),
                      child: const Text(
                        'GUARDAR DATOS', 
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.5)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller, 
    required String label, 
    required IconData icon, 
    bool isNumeric = false
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumeric ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: azulOscuro.withOpacity(0.7)),
        prefixIcon: Icon(icon, color: azulClaro),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: azulClaro.withOpacity(0.1),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: azulClaro, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Requerido';
        }
        if (isNumeric && double.tryParse(value) == null) {
          return 'Ingrese un número válido';
        }
        return null;
      },
    );
  }
}
