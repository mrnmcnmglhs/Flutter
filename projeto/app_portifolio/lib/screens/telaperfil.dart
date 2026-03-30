import 'package:app_portifolio/components/cardSkill.dart';
import 'package:app_portifolio/components/iconSkill.dart';
import 'package:app_portifolio/components/botao.dart';

import 'package:app_portifolio/screens/telaprojetos.dart';

import 'package:flutter/material.dart';


class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('images/fundo_perfil.png', fit: BoxFit.cover),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 34,
                  right: 34,
                  top: 34,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 260,
                          height: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/foto_perfil.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Olá!",
                                style: TextStyle(
                                  fontFamily: 'Smile Delight',
                                  fontSize: 95,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Sou a Mariana Macena, tenho 19 anos, atualmente estou na faculdade Gran, cursando o tecnologo em Analise e Desenvolvimento de Sistemas. Em paralelo, trabalho na Bosch como Aprendiz de Solucoes Digitais. Este portfolio reune projetos que refletem minha evolucao, foco em design e desenvolvimento de interfaces.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFamily: 'Panton',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                ),
                              ),

                              const SizedBox(height: 20),

                              // 🔘 BOTÕES ADICIONADOS AQUI
                              Row(
                                children: [
                                  BotaoPersonalizado(
                                    texto: "Projetos",
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Telaprojetos(),
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(width: 10),

                                  BotaoPersonalizado(
                                    texto: "GitHub",
                                    onPressed: () async {
                                      final url = Uri.parse("https://github.com/mrnmcnmglhs");
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/trajetoria.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                          width: 280,
                          height: 350,
                          decoration: BoxDecoration(
                            color: Color(0XFFBCCE69),
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsGeometry.only(
                                  top: 20,
                                  right: 90,
                                ),
                                child: Text(
                                  "Tecnologias de\n Conhecimento",
                                  style: TextStyle(
                                    fontFamily: 'Smile Delight',
                                    fontSize: 35,
                                    color: Colors.black,
                                    height: 0.8,
                                  ),
                                ),
                              ),

                              Cardskill(
                                procentagem: "80%",
                                icon: Iconskill(img: 'images/figma.jpg'),
                                icon2: Iconskill(img: 'images/vscode.jpg'),
                                icon3: Iconskill(img: 'images/sql.jpg'),
                                icon4: Iconskill(img: 'images/canva.jpg'),
                              ),
                              Cardskill(
                                procentagem: "50%",
                                icon: Iconskill(img: 'images/vscode.jpg'),
                                icon2: Iconskill(img: 'images/vscode.jpg'),
                                icon3: Iconskill(img: 'images/vscode.jpg'),
                                icon4: Iconskill(img: 'images/vscode.jpg'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}