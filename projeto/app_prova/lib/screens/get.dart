import 'dart:convert';
import 'package:app_prova/components/Card.dart';
import 'package:app_prova/components/UltimosDesenhos.dart';
import 'package:app_prova/screens/desenho.dart';
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50,
        flexibleSpace: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/header.png',
              ), // Caminho corrigido
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundo.png'), // Caminho corrigido
            fit: BoxFit.cover,
          ),
        ),
        child: carregando
            ? const Center(child: CircularProgressIndicator(color: Colors.cyan))
            : resultado.isEmpty
            ? const Center(
                child: Text(
                  "Nenhum dado encontrado.",
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black54,
                  ),
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Ir para tela de adicionar");
                      },
                      child: Container(
                        width: 190,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xfffff200),
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
                          child: Text(
                            "ADICIONAR\nDESENHOS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Cartoon',
                              color: Colors.black,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(color: const Color(0xff009fe3)),
                      child: Column(
                        children: [
                          // Título "DESENHOS"
                          const Text(
                            "DESENHOS",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Cartoon',
                              color: Colors.black,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Grid interno de 2 colunas
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15.0,
                                  mainAxisSpacing: 15.0,
                                  childAspectRatio: 0.65,
                                ),
                            itemCount: resultado.length,
                            itemBuilder: (context, index) {
                              final item = resultado[index];
                              // Pegando a primeira imagem do array de posters
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TelaVerDesenho(
                                        desenho: resultado[index],
                                      ),
                                    ),
                                  );
                                },
                                child: CardImage(
                                  image: resultado[index]['poster'][0]
                                      .toString()
                                      .replaceAll('"', ''),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black, width: 4),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/rodape-grande.png'),
                          fit: BoxFit.cover,
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
