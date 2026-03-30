import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  String nome;
  Color cor;
  Color texto_cor;
  VoidCallback onPressed;

  Botao({
    super.key,
    required this.nome,
    required this.cor,
    required this.texto_cor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: cor),
      onPressed: onPressed,
      child: Text(
        nome,
        style: TextStyle(
          fontFamily: 'Smile Delight',
          fontSize: 35,
          color: texto_cor,
        ),
      ),
    );
  }
}
