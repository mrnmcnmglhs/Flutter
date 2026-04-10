import 'package:app_to_do/screens/delete.dart';
import 'package:app_to_do/screens/get.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // logica
  int IndexAtual = 0; // variavel que indica em qual tela eu estou
  List pages = [
    TelaGet(),
    TelaDelete()
  ];

  void mudarIndex(int novoIndex){
    // função de mudar a tela
    IndexAtual = novoIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(IndexAtual),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.get_app), label: "Get"),
        BottomNavigationBarItem(icon: Icon(Icons.delete), label: "Delete")
      ],
      currentIndex: IndexAtual,
      onTap: mudarIndex,
      ),
    );
  }
}