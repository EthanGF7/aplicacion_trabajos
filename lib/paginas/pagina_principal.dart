import 'package:aplicacion_trabajos/componentes/item_trabajo.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {

  List trabajosLista = [
    {"titulo": "Trabajo 1", "valor": false},
    {"titulo": "Trabajo 2", "valor": true},
  ];

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
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.orange[200],),
        ),

      //Body
      body: ListView.builder(
        itemCount: trabajosLista.length,
        itemBuilder: (context, index) {

          return ItemTrabajo(
            textoTrabajo: trabajosLista[index]["titulo"],  
            valorCheckbox: trabajosLista[index]["valor"],
            );
        }
        ),

    );
  }
}