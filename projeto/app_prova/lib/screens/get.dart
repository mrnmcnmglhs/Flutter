import 'dart:convert';
import 'package:app_prova/components/Card.dart';
import 'package:app_prova/components/UltimosDesenhos.dart';
import 'package:app_prova/screens/post.dart';
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
        Uri.parse("https://app-prova-api.onrender.com/dados"),
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
      // Sua AppBar discreta para empurrar o conteúdo do jeito que você configurou
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(05.0),
        child: AppBar(backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [
              // Imagem do Header
              Container(
                width: double.infinity,
                child: const Image(
                  image: AssetImage('assets/images/header.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),

              const SizedBox(height: 10),

              // Corpo condicional (Carregando / Vazio / Conteúdo)
              Expanded(
                child: carregando
                    ? const Center(child: CircularProgressIndicator())
                    : resultado.isEmpty
                    ? const Center(child: Text("Nenhum dado encontrado."))
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            // 1. Componente dos Últmos Desenhos
                            Ultimosdesenhos(dadosCompletos: resultado),

                            const SizedBox(height: 15),

                            Center(
                              child: Padding(
                                padding: EdgeInsetsGeometry.only(
                                  top: 20,
                                  bottom: 10,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TelaPost(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0XFFF4DF00),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    side: BorderSide.none,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  child: const Text(
                                    "Adicionar Desenho",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Cartoon',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Padding(padding: EdgeInsetsGeometry.only(top: 30), child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/rodape-grande.png'), fit: BoxFit.cover,),
                              ),
                            ),),

                            const SizedBox(height: 25),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
