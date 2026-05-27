import 'package:flutter/material.dart';
import 'package:app_prova/screens/post.dart';


class BotaoAdicionarHome extends StatelessWidget {
  final VoidCallback onAddSuccess; // Função que roda quando um desenho novo é cadastrado

  const BotaoAdicionarHome({super.key, required this.onAddSuccess});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Abre a TelaFormulario no modo de criação (sem passar dadosIniciais)
        final cadastrou = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TelaFormulario(),
          ),
        );

        // Se o formulário retornou true, significa que o POST deu certo
        if (cadastrou == true) {
          onAddSuccess();
        }
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xFFFFD700), 
        ),
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 35,
        ),
      ),
    );
  }
}