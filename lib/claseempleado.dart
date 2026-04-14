class Empleado {
  int id;
  String nombre;
  String puesto;
  double salario;

  Empleado({
    required this.id,
    required this.nombre,
    required this.puesto,
    required this.salario,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'puesto': puesto,
      'salario': salario,
    };
  }
}
