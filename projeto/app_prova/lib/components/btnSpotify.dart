import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BotaoSpotify extends StatelessWidget {
  final String? urlMusica; // Recebe o link vindo do json

  const BotaoSpotify({super.key, required this.urlMusica});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        // Limpa o link removendo possíveis aspas extras do JSON
        final String linkLimpo = urlMusica?.toString().replaceAll('"', '').trim() ?? '';

        // Verifica se o link não está vazio
        if (linkLimpo.isNotEmpty) {
          final Uri url = Uri.parse(linkLimpo);
          
          try {
            // Tenta abrir o link no aplicativo externo
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              _mostrarAviso(context, "Não foi possível abrir o link da música.", Colors.redAccent);
            }
          } catch (e) {
            _mostrarAviso(context, "O link salvo parece estar quebrado.", Colors.redAccent);
          }
        } else {
          _mostrarAviso(context, "Nenhuma música cadastrada para este desenho.", Colors.orange);
        }
      },
      icon: const Icon(Icons.music_note, color: Colors.black),
      label: const Text(
        "SPOTIFY", 
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Cartoon'),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1DB954),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        elevation: 2,
      ),
    );
  }

  // Função auxiliar interna para mostrar os SnackBars de aviso
  void _mostrarAviso(BuildContext context, String mensagem, Color corFundo) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem, style: const TextStyle(fontFamily: 'Cartoon')),
        backgroundColor: corFundo,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}