import 'dart:convert';

import 'package:app_to_do/components/btn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  // logica
  String resultado = "";

  void fazerGet() async {
    // função assincrona, pois espera a requisição
    final respostaServidor = await http.get(
      Uri.parse("https://api-app-to-do-1.onrender.com/tasks"),
    );
    // final - espera receber uma atribuição, que é possivel muda um vez só
    // ent, ele espera a resposta do servidor(" "), e depois aguarda a resposta("ok" ou "erro")
    // seu reset irá ser quando apertar o botão de get novamente

    if (respostaServidor.statusCode == 200) {
      final dados = jsonDecode(respostaServidor.body);

      setState(() {
        resultado = dados[0]["title"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8E4C9),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(top: 30),
              child: Text(
                "Bem vinde!",
                style: TextStyle(
                  fontFamily: 'Bestigia',
                  fontSize: 68,
                  color: Colors.black,
                ),
              ),
            ),

            Text(resultado),
            Botao(conteudo: 'Recarregar as Tarefas', onPressed: fazerGet)
          ],
        ),
      ),
    );
  }
}
