import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_prova/components/input_forms.dart';
import 'package:app_prova/components/btnForms.dart';

class ControladorPersonagem {
  final TextEditingController nomeCtrl = TextEditingController();
  final TextEditingController fotoCtrl = TextEditingController();
}

class TelaFormulario extends StatefulWidget {
  final Map<String, dynamic>?
  dadosIniciais; // Se for nulo = ADD, se tiver dados = EDIT

  const TelaFormulario({super.key, this.dadosIniciais});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final PageController _pageController = PageController();

  // Controladores Parte 1
  final _tituloCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _posterCtrl = TextEditingController();
  final _musicaCtrl = TextEditingController();

  // Controladores Parte 2 (Personagens)
  final List<ControladorPersonagem> _listaPersonagens = List.generate(
    4,
    (index) => ControladorPersonagem(),
  );

  @override
  void initState() {
    super.initState();
    // SE FOR EDIÇÃO, PREENCHE OS CAMPOS AUTOMATICAMENTE
    if (widget.dadosIniciais != null) {
      _tituloCtrl.text = widget.dadosIniciais!['titulo'] ?? '';
      _descCtrl.text = widget.dadosIniciais!['descricao'] ?? '';
      _posterCtrl.text = widget.dadosIniciais!['poster'][0] ?? '';
      _musicaCtrl.text = widget.dadosIniciais!['musica'] ?? '';

      List personagensJson = widget.dadosIniciais!['personagens'] ?? [];
      for (int i = 0; i < personagensJson.length && i < 4; i++) {
        _listaPersonagens[i].nomeCtrl.text = personagensJson[i]['nome'] ?? '';
        _listaPersonagens[i].fotoCtrl.text = personagensJson[i]['foto'] ?? '';
      }
    }
  }

  void salvar() async {
    // Validação básica
    if (_tituloCtrl.text.isEmpty || _posterCtrl.text.isEmpty) return;

    List personagensFinal = [];
    for (var p in _listaPersonagens) {
      if (p.nomeCtrl.text.isNotEmpty) {
        personagensFinal.add({
          "nome": p.nomeCtrl.text,
          "foto": p.fotoCtrl.text.isNotEmpty
              ? p.fotoCtrl.text
              : "https://via.placeholder.com/150",
        });
      }
    }

    final corpoDados = {
      "titulo": _tituloCtrl.text,
      "descricao": _descCtrl.text,
      "poster": [_posterCtrl.text],
      "musica": _musicaCtrl.text,
      "personagens": personagensFinal,
    };

    bool ehEdicao = widget.dadosIniciais != null;
    String urlBase = "https://app-prova-api.onrender.com/dados";
    String url = ehEdicao ? "$urlBase/${widget.dadosIniciais!['id']}" : urlBase;

    try {
      final response = ehEdicao
          ? await http.put(
              Uri.parse(url),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(corpoDados),
            )
          : await http.post(
              Uri.parse(url),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(corpoDados),
            );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Navigator.pop(context, true); // Retorna true para avisar que salvou
      }
    } catch (e) {
      print("Erro ao salvar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool ehEdicao = widget.dadosIniciais != null;

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
          children: [_buildParte1(ehEdicao), _buildParte2(ehEdicao)],
        ),
      ),
    );
  }

  Widget _buildParte1(bool edicao) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: Colors.white),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),

            const SizedBox(height: 15),

            Center(
              child: Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: _posterCtrl.text.trim().isEmpty
                    ? const Icon(Icons.image, size: 50, color: Colors.grey)
                    : Image.network(
                        _posterCtrl.text.trim().replaceAll(
                          '"',
                          '',
                        ), // Limpa as aspas se vier da edição
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          // Se o link for inválido enquanto o usuário digita
                          return const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.red,
                              size: 50,
                            ),
                          );
                        },
                      ),
              ),
            ),
            const SizedBox(height: 20),

            InputCartoon(label: "NOME DO DESENHO:", controller: _tituloCtrl),
            InputCartoon(
              label: "DESCRIÇÃO:",
              controller: _descCtrl,
              maxLines: 3,
            ),
            InputCartoon(
              label: "URL DO POSTER:",
              controller: _posterCtrl,
              onChanged: (v) => setState(() {}),
            ),
            InputCartoon(label: "URL MÚSICA:", controller: _musicaCtrl),

            const SizedBox(height: 20),

            BotaoFormulario(
              texto: "CONTINUAR",
              acao: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParte2(bool edicao) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              ),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(color: Colors.white),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),

            const SizedBox(height: 15),

            for (int i = 0; i < 4; i++) ...[
              Text(
                "PERSONAGEM #${i + 1}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cartoon',
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputCartoon(
                      label: "NOME:",
                      controller: _listaPersonagens[i].nomeCtrl,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InputCartoon(
                      label: "FOTO:",
                      controller: _listaPersonagens[i].fotoCtrl,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],

            const SizedBox(height: 15),

            BotaoFormulario(
              texto: edicao ? "ATUALIZAR" : "ADICIONAR",
              acao: salvar,
              cor: edicao ? const Color(0xFF00AEEF) : const Color(0xFFFF0084),
            ),
          ],
        ),
      ),
    );
  }
}
