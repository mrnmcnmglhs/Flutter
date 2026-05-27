import 'package:flutter/material.dart';

class BoxPersonagens extends StatelessWidget {
  final List<dynamic>? listaPersonagens; // Recebe a lista de personagens do desenho

  const BoxPersonagens({super.key, required this.listaPersonagens});

  @override
  Widget build(BuildContext context) {
    // Garante que se a lista vier nula do banco, o app não quebre e trate como vazia
    final List personagens = listaPersonagens ?? [];
    const String minhaFonte = 'Cartoon';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
              fontFamily: minhaFonte
            ),
          ),
        ),
        
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(color: Color(0xFFFF0084), width: 4),
              right: BorderSide(color: Color(0xFFFF0084), width: 4),
              bottom: BorderSide(color: Color(0xFFFF0084), width: 4),
            ),
          ),
          child: personagens.isEmpty
              ? const Text(
                  "NENHUM PERSONAGEM CADASTRADO.",
                  style: TextStyle(fontFamily: minhaFonte, fontSize: 14),
                )
              : Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: personagens.map((p) {
                    // Limpa as aspas extras do campo "foto" vindas do JSON
                    String fotoUrl = p['foto'] != null 
                        ? p['foto'].toString().replaceAll('"', '').trim() 
                        : '';

                    return Column(
                      children: [
                        Container(
                          width: 90,
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3),
                          ),
                          child: fotoUrl.isNotEmpty
                              ? Image.network(
                                  fotoUrl, 
                                  fit: BoxFit.cover,
                                  errorBuilder: (c, e, s) => const Icon(Icons.broken_image, color: Colors.grey),
                                )
                              : const Icon(Icons.person, size: 40, color: Colors.grey),
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
                              fontFamily: minhaFonte
                            ),
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
        ),
      ],
    );
  }
}