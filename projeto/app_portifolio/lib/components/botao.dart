import 'package:flutter/material.dart';

class BotaoPersonalizado extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotaoPersonalizado({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(texto, style: TextStyle(fontFamily: 'Panton',
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,),),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}