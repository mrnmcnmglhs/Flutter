import 'package:flutter/material.dart';

class BotaoFormulario extends StatelessWidget {
  final String texto;
  final VoidCallback acao;
  final Color cor;

  const BotaoFormulario({
    super.key,
    required this.texto,
    required this.acao,
    this.cor = const Color(0xFFFF0084),
  });

  @override
  Widget build(BuildContext context) {
    const String minhaFonte = 'Cartoon';

    return ElevatedButton(
      onPressed: acao,
      style: ElevatedButton.styleFrom(
        backgroundColor: cor,
        minimumSize: const Size(double.infinity, 55),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
      ),
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          fontFamily: minhaFonte,
        ),
      ),
    );
  }
}