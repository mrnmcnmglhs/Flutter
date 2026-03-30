import 'package:app_portifolio/components/cardprojeto.dart';
import 'package:flutter/material.dart';
import 'package:app_portifolio/components/cardprojeto.dart';

class Telaprojetos extends StatelessWidget {
  const Telaprojetos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4B942), // fundo amarelo

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [

              const Text(
                "Projetos",
                style: TextStyle(
                  fontFamily: 'Smile Delight',
                  fontSize: 48,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Conheça os meus principais projetos!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              const CardProjeto(
                titulo: "Glimer",
                imagem: "images/glimer.png", 
              ),

              const CardProjeto(
                titulo: "Aventuras\nTuti-Frutti",
                imagem: "images/moranguinho.png",
              ),

              const CardProjeto(
                titulo: "Amores &\nMorangos",
                imagem: "images/amores_morangos.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}