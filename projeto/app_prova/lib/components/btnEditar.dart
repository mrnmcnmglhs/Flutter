import 'package:app_prova/screens/post.dart';
import 'package:flutter/material.dart';


class BotaoEditar extends StatelessWidget {
  final Map<String, dynamic> desenho; // Recebe os dados do desenho atual
  final VoidCallback onEditSuccess;   // Função para rodar quando a edição der certo

  const BotaoEditar({
    super.key,
    required this.desenho,
    required this.onEditSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Abre a TelaFormulario passando o desenho atual para carregar os dados
        final atualizou = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TelaFormulario(dadosIniciais: desenho),
          ),
        );

        // Se o formulário retornou true, significa que a API atualizou com sucesso
        if (atualizou == true) {
          onEditSuccess();
        }
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
    );
  }
}