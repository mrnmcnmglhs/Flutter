import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:app_prova/components/btnDeletar.dart';
import 'package:app_prova/components/btnEditar.dart';
import 'package:app_prova/components/btnSpotify.dart';
import 'package:app_prova/components/boxPersonagens.dart';

class TelaVerDesenho extends StatelessWidget {
  // A tela precisa receber o mapa com os dados do desenho selecionado
  final Map<String, dynamic> desenho;

  TelaVerDesenho({super.key, required this.desenho});

  @override
  Widget build(BuildContext context) {
    // Limpando o link do poster (mesma lógica que usamos na Home)
    String posterUrl = desenho['poster'] != null && desenho['poster'].isNotEmpty
        ? desenho['poster'][0].toString().replaceAll('"', '')
        : 'https://via.placeholder.com/300x400';

    // Extraindo a lista de personagens com segurança
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
              image: AssetImage('assets/images/header.png'),
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
                          Container(
                            width: 130,
                            height: 240,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                            ),
                            child: Image.network(posterUrl, fit: BoxFit.cover),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  desenho['titulo'].toString().toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cartoon',
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

                                BotaoSpotify(urlMusica: desenho['musica']),
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
                child: BoxPersonagens(listaPersonagens: desenho['personagens']),
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
                    BotaoEditar(
                      desenho: desenho, // Passa o mapa do desenho atual
                      onEditSuccess: () {
                        // Código que roda quando o formulário avisa que deu certo:
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Desenho atualizado com sucesso!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );

                        // Fecha a tela de detalhes e volta para a Home limpando a pilha
                        Navigator.pop(context);
                      },
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
