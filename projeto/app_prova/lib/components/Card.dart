import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardImage extends StatelessWidget {
  String image;
  CardImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      child: CachedNetworkImage(
        imageUrl: image,
        httpHeaders: const{
          // Esse cabeçalho finge que a requisição está vindo de um navegador de PC
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
        },
        // esperando a imagem aparecer
        placeholder: (context, url) => const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        // Se der erro (como link quebrado), mostra um ícone de erro
        errorWidget: (context, url, error) => const Center(
          child: Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
  }
}