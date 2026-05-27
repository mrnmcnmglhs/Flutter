import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// CLASSE AUXILIAR para organizar os controladores de cada personagem
class ControladorPersonagem {
  final TextEditingController nomeCtrl = TextEditingController();
  final TextEditingController fotoCtrl = TextEditingController();
}

class TelaPost extends StatefulWidget {
  const TelaPost({super.key});

  @override
  State<TelaPost> createState() => _TelaPostState();
}

class _TelaPostState extends State<TelaPost> {
  final PageController _pageController = PageController();
  
  // --- CONTROLADORES DA PARTE 1 ---
  final TextEditingController _tituloCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();
  final TextEditingController _posterCtrl = TextEditingController();
  final TextEditingController _musicaCtrl = TextEditingController();

  final String _minhaFonte = 'Cartoon';

  final List<ControladorPersonagem> _listaPersonagens = [
    ControladorPersonagem(),
    ControladorPersonagem(),
    ControladorPersonagem(),
    ControladorPersonagem(),
  ];

  // Função para enviar os dados para a API (POST)
  void salvarNoServidor() async {
    if (_tituloCtrl.text.trim().isEmpty || 
        _descCtrl.text.trim().isEmpty || 
        _posterCtrl.text.trim().isEmpty) {
      
      // Mostra um aviso vermelho na tela para o usuário
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Ei! Os campos NOME, DESCRIÇÃO e POSTER são obrigatórios!",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 3),
        ),
      );
      
      // Para a execução do código aqui para não enviar nada para a API
      return; 
    }
    
    List personagensParaEnviar = [];
    
    // Varre a lista de personagens e só adiciona os que tiverem o nome preenchido
    for (var personagem in _listaPersonagens) {
      if (personagem.nomeCtrl.text.isNotEmpty) {
        personagensParaEnviar.add({
          "nome": personagem.nomeCtrl.text,
          // Se o usuário não colar uma foto, enviamos a foto padrão para não quebrar a API
          "foto": personagem.fotoCtrl.text.isNotEmpty 
              ? jsonEncode(personagem.fotoCtrl.text) // Trata as aspas se necessário, ou envie puro:
              : "https://via.placeholder.com/150"
        });
      }
    }

    final novoDesenho = {
      "titulo": _tituloCtrl.text,
      "descricao": _descCtrl.text,
      "poster": [_posterCtrl.text],
      "musica": _musicaCtrl.text,
      "personagens": personagensParaEnviar
    };

    try {
      final resposta = await http.post(
        Uri.parse("https://app-prova-api.onrender.com/dados"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(novoDesenho),
      );

      if (resposta.statusCode == 201 || resposta.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Desenho adicionado com sucesso!")),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      print("Erro ao salvar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fundo-editar.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildParte1(),
            _buildParte2(),
          ],
        ),
      ),
    );
  }

  Widget _buildParte1() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
            
            const SizedBox(height: 10),

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
              child: _posterCtrl.text.isEmpty 
                ? const Icon(Icons.image, size: 50) 
                : Image.network(_posterCtrl.text, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            _buildInput("NOME DO DESENHO:", _tituloCtrl),
            _buildInput("DESCRIÇÃO:", _descCtrl, maxLines: 3),
            _buildInput("URL DO POSTER:", _posterCtrl, onChanged: (v) => setState(() {})),
            _buildInput("LINK MUSICA:", _musicaCtrl),
            const SizedBox(height: 20),
            _buildBotaoProximo("CONTINUAR", () {
              _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildParte2() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
              onPressed: () => _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease),
            ),
            const SizedBox(height: 10),
            
            // Loop gerando os pares de campos para cada personagem
            for (int i = 0; i < 4; i++) ...[
              Text(
                "PERSONAGEM #${i + 1}", 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: _minhaFonte, color: Colors.black),
              ),
              const SizedBox(height: 5),
              // Linha combinando Nome e URL lado a lado para economizar espaço vertical
              Row(
                children: [
                  Expanded(
                    flex: 4, // Dá um pouco mais de espaço para o Nome
                    child: _buildInput("NOME:", _listaPersonagens[i].nomeCtrl),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 5, // Espaço para a URL da Foto
                    child: _buildInput("URL FOTO:", _listaPersonagens[i].fotoCtrl),
                  ),
                ],
              ),
              const Divider(color: Colors.black, thickness: 1),
              const SizedBox(height: 10),
            ],
            
            const SizedBox(height: 20),
            _buildBotaoProximo("ADICIONAR", salvarNoServidor),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(String label, TextEditingController ctrl, {int maxLines = 1, Function(String)? onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, fontFamily: _minhaFonte)),
        const SizedBox(height: 5),
        TextField(
          controller: ctrl,
          maxLines: maxLines,
          onChanged: onChanged,
          style: TextStyle(fontFamily: _minhaFonte, fontSize: 15, color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 2), borderRadius: BorderRadius.zero),
            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.zero),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildBotaoProximo(String texto, VoidCallback acao) {
    return GestureDetector(
      onTap: acao,
      child: Center(
        child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFFFF0084),
        ),
        child: Text(
          texto,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: _minhaFonte),
        ),
      ),
      )
    );
  }
}