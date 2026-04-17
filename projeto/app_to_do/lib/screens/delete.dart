import 'dart:convert';
import 'package:app_to_do/components/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaDelete extends StatefulWidget {
  const TelaDelete({super.key});

  @override
  State<TelaDelete> createState() => _TelaDeleteState();
}

class _TelaDeleteState extends State<TelaDelete> {
  List listaApi = [];

  // REMOVED: Color? corLista; (We don't need to save this in the state)

  @override
  void initState() {
    super.initState();
    fazerGet();
  }

  void fazerGet() async {
    final respostaServidor = await http.get(
      Uri.parse("https://api-app-to-do.onrender.com/tasks"),
    );

    if (respostaServidor.statusCode == 200) {
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        listaApi = dados;
      });
    }
  }

  void fazerDelete(dynamic id) async {
    final respostaServidor = await http.delete(
      Uri.parse("https://api-app-to-do.onrender.com/tasks/$id"),
    );

    if (respostaServidor.statusCode == 200 ||
        respostaServidor.statusCode == 201) {
      fazerGet();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Tarefa deletada com sucesso!",
            style: TextStyle(
              fontFamily: 'Bestigia',
              fontSize: 24,
              color: Colors.black,
            ), // Adjusted fontSize to be safer
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF8E4C9),
      // IMPLEMENTED COLOR LOGIC HERE:
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(top: 60, right: 60),
              child: Text(
                "Bem Vinde!",
                style: TextStyle(
                  fontFamily: 'Bestigia',
                  fontSize: 64,
                  color: Colors.black,
                ),
              ),
            ),

            ListView.builder(
              itemCount:
                  listaApi.length, // Tells Flutter how many items to draw
              itemBuilder: (context, index) {
                final item = listaApi[index];

                // The Magic: Modulo operator (%) ensures the index loops back to 0
                // when it reaches the end of the colors list.
                final corAtual = coresCard[index % coresCard.length];

                return CardTasks(
                  cor: corAtual, // Pass the dynamically calculated color
                  fazerDelete: () => fazerDelete(item["id"]),
                  title: item["title"],
                  image: item["image"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Ensure your CardTasks widget accepts this color in its Container/BoxDecoration!
final List<Color> coresCard = const [
  Color(0XFFF5A9C7),
  Color(0XFF69C63D),
  Color(0XFF62A4E2),
  Color(0XFFF8A69B),
];
