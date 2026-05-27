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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent, 
        elevation: 0,
        // Ajuste o tamanho caso o banner do header precise de mais espaço
        toolbarHeight: 70, 
        flexibleSpace: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/header.png'), // Caminho corrigido
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
                      style: TextStyle(color: Colors.white, backgroundColor: Colors.black54),
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      children: [
                        // --- BLOCO AZUL DO FIGMA ---
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color(0xff009fe3), // Azul do Figma
                            border: Border.all(color: Colors.black, width: 4),
                          ),
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
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // CORRIGIDO: 2 colunas como no Figma
                                  crossAxisSpacing: 15.0,
                                  mainAxisSpacing: 15.0,
                                  childAspectRatio: 0.65, // Deixa os cards mais esticados/verticais
                                ),
                                itemCount: resultado.length,
                                itemBuilder: (context, index) {
                                  final item = resultado[index];
                                  // Pegando a primeira imagem do array de posters
                                  return CardImage(image: item["poster"][0]);
                                },
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 25),

                        // --- BOTÃO AMARELO (ADICIONAR) ---
                        GestureDetector(
                          onTap: () {
                            // Próximo passo: Navegação para a tela de Add
                            print("Ir para tela de adicionar");
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xfffff200), // Amarelo CN
                              border: Border.all(color: Colors.black, width: 4),
                            ),
                            child: const Text(
                              "ADICIONAR\nDESENHOS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Cartoon',
                                color: Colors.black,
                                height: 1.1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
      ),
    );
  }
}