import 'package:app_prova/components/Card.dart';
import 'package:flutter/material.dart';

class Ultimosdesenhos extends StatelessWidget {
  List dadosCompletos;

  Ultimosdesenhos({super.key, required this.dadosCompletos});

  @override
  Widget build(BuildContext context) {
    // caso a lista tenha menos de 6 itens, irá pegar o que há disponivel
    final int quantidade = dadosCompletos.length;
    final int inicio = quantidade > 6 ? quantidade - 6 : 0;

    // cria uma sublista com os ultimos 6 itens e inverte (.reversed)
    // para os novos desenhos aparecem primeiro
    final ultimosSeis = dadosCompletos
        .sublist(inicio, quantidade)
        .reversed
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: Color(0XFF00AEF0)),
              child: Text(
                "Desenhos",
                style: TextStyle(
                  fontFamily: 'Cartoon',
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(color: Color(0XFF00AEF0)),

          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap:
                true, // Importante: faz o Grid ocupar só o espaço dos 6 itens
            physics:
                const NeverScrollableScrollPhysics(), // Evita conflito de rolagem
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  3, // 3 colunas (vai gerar automaticamente 2 linhas para fechar os 6)
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio:
                  0.7, // Ajuste esse número se precisar esticar ou encolher a altura dos cards
            ),
            itemCount: ultimosSeis.length,
            itemBuilder: (context, index) {
              final item = ultimosSeis[index];
              return CardImage(image: item["poster"][0]);
            },
          ),
        ),
      ],
    );
  }
}
