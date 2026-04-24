import 'package:app_to_do/components/btn.dart';
import 'package:app_to_do/components/input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaLocal extends StatefulWidget {
  const TelaLocal({super.key});

  @override
  State<TelaLocal> createState() => _TelaLocalState();
}

class _TelaLocalState extends State<TelaLocal> {
  List<String> itens = [];
  TextEditingController valorDigitado = TextEditingController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    // variavel dados espera o banco iniciar
    final dados = await SharedPreferences.getInstance();

    setState(() {
      itens = dados.getStringList('nomes') ?? [];
      // ?? - representar que a lista pode ser vazia
    });
  }

  // CRIAÇÃO DE DADOS
  void criarDados() async {
    final dados = await SharedPreferences.getInstance();
    setState(() {
      itens.add(valorDigitado.text);
    });

    await dados.setStringList('nomes', itens);
  }

  // DELETARR DADOS
  void deletarDados(int index) async {
    final dados = await SharedPreferences.getInstance();
    setState(() {
      itens.removeAt(index);
    });
    await dados.setStringList('nomes', itens);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8E4C9),
      body: Center(
        child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: 30, right: 10),
            child: Text(
              "Armazenamento de Dados",
              style: TextStyle(
                fontFamily: 'Bestigia',
                fontSize: 40,
                color: Colors.black,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.only(right: 260),
            child: Text(
              "Crie um novo dado",
              style: TextStyle(
                fontFamily: 'Rinnero',
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // SALVAR DADOS
          Input(controller: valorDigitado, placheholder: 'placheholder'),

          Botao(conteudo: 'Criar Dados', onPressed: criarDados),

          for (final nome in itens)
            Card(
              child: ListTile(
                leading: Text(nome),
                trailing: GestureDetector(
                  onTap: () => deletarDados(itens.indexOf(nome)),
                  child: Icon(Icons.remove),
                ),
              ),
            ),
        ],
      ),
      )
    );
  }
}
