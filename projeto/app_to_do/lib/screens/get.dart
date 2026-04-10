import 'dart:convert';

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

  void fazerGet() async { // função assincrona, pois espera a requisição
    final respostaServidor = await http.get(Uri.parse("http://10.109.72.17:3000/tasks")); 
    // final - espera receber uma atribuição, que é possivel muda um vez só
    // ent, ele espera a resposta do servidor(" "), e depois aguarda a resposta("ok" ou "erro")
    // seu reset irá ser quando apertar o botão de get novamente

    if(respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);

      setState(() {
        resultado = dados[0]["title"];
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Get"),),
      body: Center(
        child: Column(children: [
          Text(resultado),
          TextButton(onPressed: fazerGet, child: Text("Fazer Get"))
        ],),
      ),
    );
  }
}