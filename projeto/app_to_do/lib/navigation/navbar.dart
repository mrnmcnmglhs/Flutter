import 'package:app_to_do/screens/delete.dart';
import 'package:app_to_do/screens/get.dart';
import 'package:app_to_do/screens/post.dart';
import 'package:app_to_do/screens/put.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // Por convenção no Dart, variáveis começam com letra minúscula
  int indexAtual = 0;

  List pages = [
    const TelaGet(),
    const TelaPost(),
    const TelaPut(),
    const TelaDelete(),
  ];

  void mudarIndex(int novoIndex) {
    // Para a tela mudar visualmente, a alteração da variável
    // precisa estar dentro de um setState!
    setState(() {
      indexAtual = novoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Exibe a tela baseada no index atual
      backgroundColor: const Color(0xFFF8E4C9),
      body: pages[indexAtual],

      bottomNavigationBar: CustomPaint(
        painter: NavbarShapePainter(),
        child: SizedBox(
          height: 160, // Altura total da barra
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ), 

            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Espaça os ícones igualmente
              children: [
                // Get (Home)
                IconButton(
                  icon: const Icon(Icons.home_outlined),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () => mudarIndex(0),
                ),
                // Adicionar
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () => mudarIndex(1),
                ),
                 // Editar
                IconButton(
                  icon: const Icon(Icons.edit),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () => mudarIndex(2),
                ),
                // Delete
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () => mudarIndex(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Classe que desenha a curva vermelha no fundo da barra
class NavbarShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color =
          const Color(0xFFB9332E) // Cor vermelha do seu design
      ..style = PaintingStyle.fill;

    final path = Path();

    // Começa na esquerda, um pouco abaixo do topo (deixa espaço para a curva subir)
    path.moveTo(0, size.height * 0.3);

    // Desenha a curva convexa até o lado direito
    path.quadraticBezierTo(
      size.width / 2,
      0, // Ponto invisível central que puxa a curva pra cima
      size.width,
      size.height * 0.3, // Ponto onde a curva termina na direita
    );

    // Desce a linha até o canto inferior direito
    path.lineTo(size.width, size.height);

    // Vai até o canto inferior esquerdo
    path.lineTo(0, size.height);

    // Fecha o desenho conectando com o ponto inicial
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
