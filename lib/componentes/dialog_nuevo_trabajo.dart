import 'package:aplicacion_trabajos/componentes/boton_dialog.dart';
import 'package:flutter/material.dart';

class DialogNuevoTrabajo extends StatelessWidget {
  final TextEditingController tecTexTrabajo;
  final Function()? accionGuardar;
  final Function()? accionCancelar;

  const DialogNuevoTrabajo({
    super.key,
    required this.tecTexTrabajo,
    required this.accionGuardar,
    required this.accionCancelar,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: tecTexTrabajo,
              cursorColor: Colors.orange[300],
              decoration: InputDecoration(
                hintText: "Escribe el trabajo...",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.teal[100],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotonDialog(textoBoton: "Guardar", accionBoton: accionGuardar),//Boton guardar
                BotonDialog(textoBoton: "Cancelar", accionBoton: accionCancelar),//Boton cancelar
              ],
            ),
          ],
        ),
      ),
    );
  }
}