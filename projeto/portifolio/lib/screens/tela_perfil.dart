import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portifolio/components/botao.dart';
import 'package:portifolio/components/card_skill.dart';
import 'package:portifolio/components/icon_skill.dart';
import 'package:portifolio/screens/tela_projetos.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/fundo_perfil.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsGeometry.only(
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

                      Column(
                        children: [
                          Text(
                            "Olá!",
                            style: TextStyle(
                              fontFamily: 'Smile Delight',
                              fontSize: 95,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 170,
                            child: Padding(
                              padding: EdgeInsetsGeometry.only(left: 10),
                              child: AutoSizeText(
                                "Sou a Mariana Macena, tenho 19 anos, atualmente estou na faculdade Gran, cursando o tecnologo em Analise e Desenvolvimento de Sistemas. Em paralelo, trabalho na Bosch como Aprendiz de Solucoes Digitais. Este portfolio reune projetos que refletem minha evolucao, foco em design e desenvolvimento de interfaces.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFamily: 'Panton',
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                ),
                                minFontSize: 11,
                                maxLines: 13,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
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
                              icon2: Iconskill(img: 'images/python.jpg'),
                              icon3: Iconskill(img: 'images/mysql.jpg'),
                              icon4: Iconskill(img: 'images/react.jpg'),
                            ),
                            Cardskill(
                              procentagem: "50%",
                              icon: Iconskill(img: 'images/github.jpg'),
                              icon2: Iconskill(img: 'images/flutter.jpg'),
                              icon3: Iconskill(img: 'images/firebase.jpg'),
                              icon4: Iconskill(img: 'images/fast.jpg'),
                            ),
                          ],
                        ),
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.only(
                              left: 10,
                              bottom: 20,
                            ),
                            child: Botao(
                              nome: "Projetos",
                              cor: Color(0XFFF3AF30),
                              texto_cor: Colors.black,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TelaProjetos(),
                                  ),
                                );
                              },
                            ),
                          ),

                          Padding(
                            padding: EdgeInsetsGeometry.only(bottom: 40),
                            child: Botao(
                              nome: "GitHub",
                              cor: Color(0XFFBE2A52),
                              texto_cor: Colors.white,
                              onPressed: () async {
                                final url = Uri.parse(
                                  "https://github.com/mrnmcnmglhs",
                                );
                                await launchUrl(url);
                              },
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/uiux.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
