import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BotaoDeletar extends StatefulWidget {
  final int idDesenho; // Recebe o ID do desenho para mandar para a API
  final VoidCallback onDeleteSuccess; // Função que roda quando a exclusão dá certo

  const BotaoDeletar({
    super.key,
    required this.idDesenho,
    required this.onDeleteSuccess,
  });

  @override
  State<BotaoDeletar> createState() => _BotaoDeletarState();
}

class _BotaoDeletarState extends State<BotaoDeletar> {
  bool _isLoading = false; // Controla o spinner de carregamento

  // Caixa de diálogo para confirmar antes de apagar de vez
  void _confirmarExclusao() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(
          "EXCLUIR?", 
          style: TextStyle(fontFamily: 'CartoonFont', fontWeight: FontWeight.bold),
        ),
        content: const Text("Tem certeza que quer deletar esse desenho do banco de dados? Esta ação não pode ser desfeita."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx), // Fecha o aviso sem fazer nada
            child: const Text("NÃO", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx); // Fecha o aviso
              _deletarDoServidor(); // Dispara o DELETE
            },
            child: const Text("SIM, DELETAR", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  // Função que faz a requisição DELETE na API
  void _deletarDoServidor() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Monta a URL passando o ID correspondente ao final
      final url = Uri.parse("https://app-prova-api.onrender.com/dados/${widget.idDesenho}");
      final resposta = await http.delete(url);

      if (resposta.statusCode == 200 || resposta.statusCode == 204) {
        if (mounted) {
          // Avisa o componente pai que foi deletado com sucesso
          widget.onDeleteSuccess();
        }
      } else {
        _mostrarErro("Erro da API: Código ${resposta.statusCode}");
      }
    } catch (e) {
      _mostrarErro("Não foi possível conectar ao servidor.");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _mostrarErro(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isLoading ? null : _confirmarExclusao,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFFFF0084), 
        ),
        child: _isLoading
            ? const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : const Icon(Icons.delete, color: Colors.white, size: 40),
      ),
    );
  }
}