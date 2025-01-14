import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTrabajo extends StatelessWidget {
  final String textoTrabajo;
  final bool valorCheckbox;
  final Function(bool?)? cambiaValorCheckbox;
  final Function(BuildContext) borraTrabajo;

  const ItemTrabajo({
    super.key,
    required this.textoTrabajo,
    required this.valorCheckbox,
    required this.cambiaValorCheckbox,
    required this.borraTrabajo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              onPressed: borraTrabajo,
              ),
          ],
        ),
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
                  onChanged: cambiaValorCheckbox,
                ),

                //Text
                Text(
                  textoTrabajo,
                  style: TextStyle(
                    color: Colors.orange[200],
                    decoration: valorCheckbox
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.orange[200],
                    decorationThickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
