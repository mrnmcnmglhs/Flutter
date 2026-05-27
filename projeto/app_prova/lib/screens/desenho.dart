import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_prova/components/btnDeletar.dart';

class TelaVerDesenho extends StatelessWidget {
  // A tela precisa receber o mapa com os dados do desenho selecionado
  final Map<String, dynamic> desenho;

  TelaVerDesenho({super.key, required this.desenho});

  @override
  Widget build(BuildContext context) {
    // 1. Limpando o link do poster (mesma lógica que usamos na Home)
    String posterUrl = desenho['poster'] != null && desenho['poster'].isNotEmpty
        ? desenho['poster'][0].toString().replaceAll('"', '')
        : 'https://via.placeholder.com/300x400';

    // 2. Extraindo a lista de personagens com segurança
    List personagens = desenho['personagens'] ?? [];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
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
            image: AssetImage('assets/images/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(top: 15, right: 350),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: Colors.white),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Tarja Amarela com o Título
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD700),
                        border: Border(
                          left: BorderSide(color: Colors.black, width: 4),
                          right: BorderSide(color: Colors.black, width: 4),
                          top: BorderSide(color: Colors.black, width: 4),
                        ),
                      ),
                      child: Text(
                        "DESENHO: ${desenho['titulo'].toString().toUpperCase()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Cartoon',
                        ),
                      ),
                    ),
                    // Caixa Branca com Poster e Info
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          left: BorderSide(color: Colors.black, width: 4),
                          right: BorderSide(color: Colors.black, width: 4),
                          bottom: BorderSide(color: Colors.black, width: 4),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Poster na esquerda
                          Container(
                            width: 130,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: Image.network(posterUrl, fit: BoxFit.cover),
                          ),
                          const SizedBox(width: 15),
                          // Textos na direita
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  desenho['titulo'].toString().toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'CartoonFont',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  desenho['descricao'] ?? "Sem descrição.",
                                  style: const TextStyle(fontSize: 14),
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 15),
                                // Botão Spotify
                                // Botão Spotify Atualizado
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    // 1. Pega o link que está no banco de dados
                                    final String linkMusica =
                                        desenho['musica']?.toString() ?? '';

                                    // 2. Verifica se o link não está vazio
                                    if (linkMusica.isNotEmpty) {
                                      final Uri url = Uri.parse(linkMusica);

                                      try {
                                        // 3. Tenta abrir o link no aplicativo externo (Spotify, YouTube ou Navegador)
                                        if (!await launchUrl(
                                          url,
                                          mode: LaunchMode.externalApplication,
                                        )) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Não foi possível abrir o link da música.",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              backgroundColor: Colors.redAccent,
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        // Se o link for inválido ou malformado
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "O link salvo parece estar quebrado.",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            backgroundColor: Colors.redAccent,
                                          ),
                                        );
                                      }
                                    } else {
                                      // Se não tiver música cadastrada no JSON
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Nenhuma música cadastrada para este desenho.",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          backgroundColor: Colors.orange,
                                        ),
                                      );
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.music_note,
                                    color: Colors.black,
                                  ),
                                  label: const Text(
                                    "SPOTIFY",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'Cartoon',
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(
                                      0xFF1DB954,
                                    ), // Verde Spotify
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tarja Magenta
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF0084),
                        border: Border.all(color: Color(0xFFFF0084), width: 4),
                      ),
                      child: const Text(
                        "PERSONAGENS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'CartoonFont',
                        ),
                      ),
                    ),
                    // Caixa Branca com Grid de Personagens
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFFF0084), width: 4),
                      ),
                      child: personagens.isEmpty
                          ? const Text("Nenhum personagem cadastrado.")
                          : Wrap(
                              spacing: 15,
                              runSpacing: 15,
                              children: personagens.map((p) {
                                String fotoUrl = p['foto'] != null
                                    ? p['foto'].toString().replaceAll('"', '')
                                    : '';
                                return Column(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 3,
                                        ),
                                      ),
                                      child: fotoUrl.isNotEmpty
                                          ? Image.network(
                                              fotoUrl,
                                              fit: BoxFit.cover,
                                              errorBuilder: (c, e, s) =>
                                                  const Icon(
                                                    Icons.broken_image,
                                                  ),
                                            )
                                          : const Icon(Icons.person, size: 40),
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        p['nome'].toString().toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          fontFamily: 'Cartoon',
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Botão Deletar (Magenta)
                    BotaoDeletar(
                      // Puxa o ID do mapa do desenho atual vindo do JSON
                      idDesenho: int.parse(desenho['id'].toString()),
                      onDeleteSuccess: () {
                        // Exibe um aviso de sucesso na tela
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Desenho excluído com sucesso!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // Volta para a Home (TelaGet) automaticamente
                        Navigator.pop(context);
                      },
                    ),

                    // Botão Editar (Azul/Ciano)
                    GestureDetector(
                      onTap: () {
                        // Ação de editar
                        print("Clicou em editar ID: ${desenho['id']}");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00AEEF),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40), // Espaço antes do rodapé

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
