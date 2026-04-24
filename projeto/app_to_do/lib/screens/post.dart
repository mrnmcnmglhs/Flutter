import 'dart:convert';

import 'package:app_to_do/components/btn.dart';
import 'package:app_to_do/components/h2.dart';
import 'package:app_to_do/components/input.dart';
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

  void fazerPost() async {
    final respostaServidor = await http.post(
      Uri.parse("https://api-app-to-do-1.onrender.com/tasks"),
      headers: {
        "Content-type": "aplication/json",
      }, // enviando um json para o post
      body: jsonEncode({
        "title": valorDigitado.text,
        "image": valorDigitado.text,
        "status": valorDigitado.text,
      }),
    );

    if (respostaServidor.statusCode == 201 ||
        respostaServidor.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sua tarefa foi adicionada com sucesso")),
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
            H2(subtitulo: "Adicione novas tarefas"),
            
            Padding(
              padding: EdgeInsetsGeometry.only(right: 260),
              child: Text(
                "Insira a sua tarefa",
                style: TextStyle(
                  fontFamily: 'Rinnero',
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Input(controller: valorDigitado, placheholder: 'Ex: Jogar Amor Doce'),

            Botao(conteudo: 'Adicionar', onPressed: fazerPost)
          ],
        ),
      ),
    );
  }
}
