import 'claseempleado.dart';
import 'diccionarioempleado.dart';

class GuardarDatosDiccionario {
  // Variable para simular ID auto numérico
  static int _siguienteId = 1;

  static void guardarEmpleado({
    required String nombre,
    required String puesto,
    required double salario,
  }) {
    Empleado nuevoEmpleado = Empleado(
      id: _siguienteId,
      nombre: nombre,
      puesto: puesto,
      salario: salario,
    );

    datosEmpleado[_siguienteId] = nuevoEmpleado;

    _siguienteId++;
  }
}
