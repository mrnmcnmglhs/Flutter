import 'package:flutter/material.dart';
import 'package:portifolio/components/card_projeto.dart';

class TelaProjetos extends StatelessWidget {
  const TelaProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Projetos",
          style: TextStyle(
            fontFamily: 'Smile Delight',
            fontSize: 68,
            color: Colors.black,
            height: 2
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF8E1), Color(0xFFFFD54F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                const Text(
                  "Conheca os meus principais projetos!",
                  style: TextStyle(
                    fontFamily: 'Panton',
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 35),

                const CardProjeto(
                  titulo: "Glimer",
                  imagem: "images/glimer.png",
                ),

                const CardProjeto(
                  titulo: "Aventuras Tuti-Frutti",
                  imagem: "images/moranguinho.png",
                ),

                const CardProjeto(
                  titulo: "Amores & Morangos",
                  imagem: "images/amores_morangos.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
