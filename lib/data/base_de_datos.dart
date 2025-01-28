import 'package:hive/hive.dart';

class BaseDeDatos {

  List trabajosLista = [];

  final Box _boxDeLaHive = Hive.box("box_trabajos_add");
  
  void crearDatosEjemplo () {
    trabajosLista = [
      {"titulo": "Trabajo 1", "valor": false},
      {"titulo": "Trabajo 2", "valor": true},
      {"titulo": "Trabajo 3", "valor": false},
    ];
  }

  void cargarDatos () {
    trabajosLista = _boxDeLaHive.get("box_trabajos_add");
  }

  void actualizardatos () {
    _boxDeLaHive.put("box_trabajos_add", trabajosLista);
  }

}