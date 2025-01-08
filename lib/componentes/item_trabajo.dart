import 'package:flutter/material.dart';

class ItemTrabajo extends StatelessWidget {

  final String textoTrabajo;
  final bool valorCheckbox;

  const ItemTrabajo({
    super.key,
    required this.textoTrabajo,
    required this.valorCheckbox,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              //Checkbox
              Checkbox(
                activeColor: Colors.teal[200],
                checkColor: Colors.orange[200],
                side: BorderSide(color: Colors.orange[200]!),
                value: valorCheckbox,
                onChanged: (valorRecibido) {},
              ),
                
              //Text
              Text(
                textoTrabajo, 
              style: TextStyle(
                color: Colors.orange[200],
                decoration: valorCheckbox ? TextDecoration.lineThrough : TextDecoration.none,

                decorationColor: Colors.orange[200],
                decorationThickness: 2,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
