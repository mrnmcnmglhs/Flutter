import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Links extends StatelessWidget {
  String url;
  String imagem;
  Links({super.key, required this.url, required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.grey,
      child: Column(
        children: [
          GestureDetector(
            // identifica onde o user esta clicando e gera um função apartir disso
            child: Image.network(imagem), // toda vez que clicar na imagem, o user sera redirecionado para o clique externo
            onTap: ()async{
              // para o flutter entender a url, é necessario tarnsformar em uri
              Uri converterUrl = Uri.parse(url);
              if(await canLaunchUrl(converterUrl)){ // se a função de lancher for verdadeira
                await(launchUrl(converterUrl));
              }
            },
          ) 
        ],
      ),
    );
  }
}

// Links(url:"www.google.com", imagem: "http...")