// biblioteca qie importa os componentes do flutter
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  // runApp -roda o app, e dentro dos parentes a pagina
  // stateless -> estático
  // staful -> danamica
  runApp(TelaInicial());
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // material app prove os componentes para a sua tela
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        // scaffold - divide a tela em ate tres partes
        appBar: AppBar(
          title: Text(
            "Tela Inicial - Bem Vinde!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 85, 14, 38),
          centerTitle: true,
        ),
        body: 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 30,
            children: [
              Container(
                width: 50,
                height: 50,
                color: const Color.fromARGB(255, 255, 205, 221),
                margin: EdgeInsets.only(top: 20),
              ),
              Container(
                width: 50,
                height: 50,
                color: const Color.fromARGB(255, 243, 160, 186),
              ),
              Container(
                width: 50,
                height: 50,
                color: const Color.fromARGB(255, 240, 109, 150),
          ),
          Row(
            spacing: 50,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 50, 
                height: 50, 
                color: const Color.fromARGB(255, 199, 88, 125)),
              Container(
                width: 50, 
                height: 50, 
                color: const Color.fromARGB(255, 167, 42, 84)),
              Container(
                width: 50, 
                height: 50, 
                color: Colors.pink),
            ],
          ),
          ],
        ),
      ),
    );
  }
}
