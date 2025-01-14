import 'package:aplicacion_trabajos/componentes/boton_dialog.dart';
import 'package:flutter/material.dart';

class DialogNuevoTrabajo extends StatelessWidget {
  const DialogNuevoTrabajo({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        height: 200,
        child: Column(
          children: [
            TextField(),
            Row(
              children: [
                BotonDialog(textoBoton: "Guardar", accionBoton: (){}),//Boton guardar
                BotonDialog(textoBoton: "Cancelar", accionBoton: (){}),//Boton cancelar
              ],
            ),
          ],
        ),
      ),
    );
  }
}