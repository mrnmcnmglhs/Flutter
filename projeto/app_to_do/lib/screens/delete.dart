import 'dart:convert';

import 'package:app_to_do/components/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaDelete extends StatefulWidget {
  const TelaDelete({super.key});

  @override
  State<TelaDelete> createState() => _TelaDeleteState();
}

class _TelaDeleteState extends State<TelaDelete> {
  // logica
  List listaApi = [];

  @override // garante que o estado inicial sempre reinicie
  // tem como objetivo rodar uma função ao abrir a tela
  void initState(){
    super.initState(); // garantindo que ira funçõ o estado inicial
    fazerGet();
  }

  void fazerGet() async{
    final respostaServidor = await http.get(
      Uri.parse("http://10.109.72.26:3000/tasks")
    );

    if(respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        listaApi = dados;
      });
    }
  }

  void fazerDelete(final id) async {
    final respostaServidor = await http.delete(Uri.parse("http://10.109.72.26:3000/tasks/$id"));

    if(respostaServidor.statusCode == 200 || respostaServidor.statusCode == 201){
      fazerGet(); // atualizando a tela

      // tipo um popup
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Tarefa deletada com sucesso!", style: TextStyle(fontFamily: 'Bestigia', fontSize: 64, color: Colors.black)))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF8E4C9),
      appBar: AppBar(title: Text("DELETAR")),
      body: ListView(
        children: [
          for(final item in listaApi)
            CardTasks(
              indexOriginal: item["id"],
              child: ListTile(
                leading: Row(children: [Image.asset(item['image']), Text(item['title'])],),
                trailing: GestureDetector(
                  onTap: () => fazerDelete(item["id"]),
                  child: Icon(Icons.delete),
                ),
              ),
            )
        ],
      ),
    );
  }
}