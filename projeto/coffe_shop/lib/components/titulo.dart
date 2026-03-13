import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  const Titulo({super.key});

  @override
  Widget build(BuildContext context) {
    // componente fixo
    return Text(
      "Coffe Shop",
      style: TextStyle(
        fontSize: 35,
        color: Colors.brown,
        fontWeight: FontWeight.bold
      ),
    );
  }
}