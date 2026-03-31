import 'package:flutter/material.dart';

class CardProjeto extends StatelessWidget {
  final String titulo;
  final String imagem;

  const CardProjeto({super.key, required this.titulo, required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 25),
          height: 180,
          width: 400,
          padding: EdgeInsets.only(left: 20, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Color(0xFF5B0E2D), Color(0xFF9B3A63)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),

          child: Text(
            titulo,
            style: const TextStyle(
              fontFamily: 'Smile Delight',
              fontSize: 54,
              color: Colors.white,
            ),
          ),
        ),

        Positioned(
          left: 320,
          top: 70,
          child: 
            Image.asset(imagem, height: 120),
        )
      ],
    );
  }
}
