import 'package:aplicacion_trabajos/componentes/dialog_nuevo_trabajo.dart';
import 'package:aplicacion_trabajos/componentes/item_trabajo.dart';
import 'package:aplicacion_trabajos/data/base_de_datos.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
 /* List trabajosLista = [
    {"titulo": "Trabajo 1", "valor": false},
    {"titulo": "Trabajo 2", "valor": true},
    {"titulo": "Trabajo 3", "valor": false},
  ];*/

  final Box _boxHive = Hive.box("box_trabajos_add"); 
  BaseDeDatos db = BaseDeDatos();

  TextEditingController tecTexTrabajo =TextEditingController();

  void accionGuardar () {
    setState(() {
      db.trabajosLista.add({
        "titulo": tecTexTrabajo.text,
        "valor": false,
        });
        db.actualizardatos();
        accionCancelar();
    });
  }

  void accionCancelar () {
    Navigator.of(context).pop();
    tecTexTrabajo.clear();
  }

  void cambiaCheckbox(bool valorCheckbox, int posLista) {
    setState(() {
      db.trabajosLista[posLista]["valor"] = !db.trabajosLista[posLista]["valor"]; 
    });
    db.actualizardatos();
  }

  void accionBorrarTrabajo(int posLista) {
    setState(() {
      db.trabajosLista.removeAt(posLista);
    });
    db.actualizardatos();
  }

  void crearNuevoTrabajo() {
    showDialog(context: context, builder: (context) {return DialogNuevoTrabajo(
      tecTexTrabajo: tecTexTrabajo,
      accionGuardar: accionGuardar,
      accionCancelar: accionCancelar,
      );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],

      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("App Trabajos"),
        foregroundColor: Colors.orange[200],
      ),

      //FloatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        shape: const CircleBorder(),
        onPressed: crearNuevoTrabajo,
        child: Icon(
          Icons.add,
          color: Colors.orange[200],
        ),
      ),

      //Body
      body: ListView.builder(
          itemCount: db.trabajosLista.length,
          itemBuilder: (context, index) {
            return ItemTrabajo(
              textoTrabajo: db.trabajosLista[index]["titulo"],
              valorCheckbox: db.trabajosLista[index]["valor"],
              cambiaValorCheckbox: (valor) => cambiaCheckbox(db.trabajosLista[index]["valor"], index),
              borraTrabajo: (valor) => accionBorrarTrabajo(index),
            );
          }),
    );
  }
}
