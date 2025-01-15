import 'package:flutter/material.dart';

class BotonDialog extends StatelessWidget {
  final String textoBoton;
  final Function()? accionBoton;
  const BotonDialog({
    super.key,
    required this.textoBoton,
    required this.accionBoton,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: accionBoton,
    color: Colors.teal[300],
    child: Text(textoBoton),
    );
  }
}
