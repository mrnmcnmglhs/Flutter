import 'dart:convert';

import 'package:app_to_do/components/h2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaPut extends StatefulWidget {
  const TelaPut({super.key});

  @override
  State<TelaPut> createState() => _TelaPutState();
}

class _TelaPutState extends State<TelaPut> {
  // logica
  List listaApi = []; // guarda os dados da api
  List controladores = []; // guarda os controladores

  @override // permite a pagina rezete para o estado inicial, fazendo um get novamente
  void initState() {
    // função do estado inicial do Flutter
    super.initState();
    fazerGet();
  }

  void fazerGet() async {
    final respostaServidor = await http.get(
      Uri.parse("https://api-app-to-do-1.onrender.com/tasks"),
    );

    if (respostaServidor.statusCode == 200) {
      final dados = jsonDecode(
        respostaServidor.body,
      ); // variavel que decodifica os pacotes do http

      setState(() {
        listaApi = dados;

        for (final item in listaApi) {
          controladores.add(
            TextEditingController(),
          ); // para cada item da lista, ira adicionar um controlador
        }
      });
    }
  }

  // função para atualizar os dados do get, utilizando o id, e
  // precisa do index da lista dos controladores para atulizar as novas informações
  void fazerPut(final id, final index) async {
    final respostaServidor = await http.patch(
      Uri.parse("https://api-app-to-do-1.onrender.com/tasks/$id"),
      headers: {
        "Content-type": "application/json",
      }, // identificando o tipo de conteudo que esta sendo atualizado
      body: jsonEncode({"title": controladores[index].text}),
    );

    if (respostaServidor.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Informações atualizadas com sucesso!")),
      );
    }
    fazerGet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8E4C9),
      body: ListView(
        children: [
          H2(subtitulo: 'Edite as suas tarefas'),

          for (final item in listaApi)
            Card(
              child: ListTile(
                title: Text(item["title"]),
                subtitle: TextField(
                  controller: controladores[listaApi.indexOf(item)],
                ),
                trailing: GestureDetector(
                  onTap: () => fazerPut(item["id"], listaApi.indexOf(item)),
                  child: Icon(Icons.edit),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
