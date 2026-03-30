import 'package:flutter/material.dart';

class CardProjeto extends StatelessWidget {
  final String titulo;
  final String imagem;

  const CardProjeto({
    super.key,
    required this.titulo,
    required this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF5B0E2D),
            Color(0xFF9B3A63),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // 📝 Título
          Positioned(
            top: 25,
            left: 25,
            child: Text(
              titulo,
              style: const TextStyle(
                fontFamily: 'Smile Delight', 
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              imagem,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}