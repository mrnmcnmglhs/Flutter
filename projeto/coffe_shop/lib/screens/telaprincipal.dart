import 'package:coffe_shop/components/box.dart';
import 'package:coffe_shop/components/titulo.dart';
import 'package:flutter/material.dart';
 
class Principal extends StatelessWidget {
  const Principal({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Titulo(),
        backgroundColor: const Color.fromARGB(255, 199, 176, 168),
      ),
      body: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Boxisy(texto: "Strayberry Coffee", foto: 'images/coffe.jpg', descricao: "Café com leite de amendoas rosa", valor: "R\$ 45,90"),
            Boxisy(texto: "Match Coffee", foto: 'images/match.jpg', descricao: "Café com leite e match", valor: "R\$ 50,90"),
            Boxisy(texto: "Caramel Coffee", foto: 'images/coffe.jpg', descricao: "Café com leite e carelo", valor: "R\$ 60,90"),
          ],
        ),
      ),
    );
  }
}