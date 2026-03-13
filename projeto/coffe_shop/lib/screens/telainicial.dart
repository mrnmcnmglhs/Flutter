import 'package:coffe_shop/components/botaoinicial.dart';
import 'package:coffe_shop/components/descricao.dart';
import 'package:coffe_shop/components/titulo.dart';
import 'package:coffe_shop/screens/telaprincipal.dart';
import 'package:flutter/material.dart';

class Telainicial extends StatelessWidget {
  const Telainicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem Vinde!"),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            // componente fixo
            Titulo(),
            // componente com parametro
            Descricao(texto: "Conheça a sua nova loja de cafes favorita!"),
            Descricao(texto: "clique no botão para começar", cor: Colors.brown,),
            BotaoInicial(pagina: Principal(), texto: "Entrar")
          ],
        ),
      ),
    );
  }
}