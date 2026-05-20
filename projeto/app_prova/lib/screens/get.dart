import 'dart:convert';

import 'package:app_prova/components/Card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  List resultado = [];

  void get() async{
    final requisicao = await http.get(
      Uri.parse("https://app-prova-api.onrender.com/dados")
    );

    if(requisicao.statusCode == 200){
      final dados = jsonDecode(requisicao.body);

      setState(() {
        resultado = dados;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          for(final item in resultado)
          CardImage(image: item["poster"][0]),

          TextButton(onPressed: get, child: Text("Posterrr"))
        ],
      ),
    );
  }
}