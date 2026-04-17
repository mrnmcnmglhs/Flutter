import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaPost extends StatefulWidget {
  const TelaPost({super.key});

  @override
  State<TelaPost> createState() => _TelaPostState();
}

class _TelaPostState extends State<TelaPost> {
  // variavel que observa o que o user digita
  TextEditingController valorDigitado = TextEditingController();

  void fazerPost() async{
    final respostaServidor = await http.post(Uri.parse("https://api-app-to-do.onrender.com/tasks"), 
      headers: {"Content-type": "aplication/json"}, // enviando um json para o post
      body: jsonEncode({
        "title": valorDigitado.text,
        "image": valorDigitado.text,
        "status": valorDigitado.text
      })
    
    );

    if (respostaServidor.statusCode == 201 || respostaServidor.statusCode == 200){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sua tarefa foi adicionada com sucesso"))
      );
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
              padding: EdgeInsetsGeometry.only(top: 60, right: 25, bottom: 30),
              child: Text(
                "Adicione uma tarefa",
                style: TextStyle(
                  fontFamily: 'Bestigia',
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
            ),
            Text("Inisira a sua tarefa"),
            TextField(controller: valorDigitado,),
            TextButton(onPressed: fazerPost, child: Text("Adicionar Dado"))
          ],
        ),
      ),
    );
  }
}