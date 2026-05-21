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
  bool carregando = true; // Indicador de carregamento

  // Função para buscar os dados
  void get() async {
    try {
      final requisicao = await http.get(
        Uri.parse("https://app-prova-api.onrender.com/dados")
      );

      if (requisicao.statusCode == 200) {
        final dados = jsonDecode(requisicao.body);
        setState(() {
          resultado = dados;
          carregando = false;
        });
      }
    } catch (e) {
      setState(() => carregando = false);
      print("Erro ao buscar dados: $e");
    }
  }

  // Isso faz com que a API seja chamada automaticamente ao abrir a tela
  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Se estiver carregando, mostra uma barra de progresso. Se não, mostra o Grid.
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : resultado.isEmpty
              ? const Center(child: Text("Nenhum dado encontrado."))
              : GridView.builder(
                  padding: const EdgeInsets.all(5),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 3.0,
                  ),
                  itemCount: resultado.length, // O tamanho do grid será o tamanho da resposta da API
                  itemBuilder: (context, index) {
                    final item = resultado[index];
                    
                    // Retorna apenas um CardImage para cada quadrado do Grid
                    return CardImage(image: item["poster"][0]);
                  },
                ),
      // botão de atualizar manualmente
      floatingActionButton: FloatingActionButton(
        onPressed: get,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}