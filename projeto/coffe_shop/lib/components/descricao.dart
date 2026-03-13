import 'package:flutter/material.dart';

class Descricao extends StatelessWidget {
  String texto; // o componente espera receber uma variavel string
  Color? cor = Colors.black; // a cor é opcional, se não fica padrão
  Descricao({super.key, required this.texto, this.cor});

  // componente com paramentro
  @override
  Widget build(BuildContext context) {
    // componente com parametro
    return Text(texto, 
            style: TextStyle(
              color: Colors.black,
              fontSize: 25
            ),
          );
  }
}