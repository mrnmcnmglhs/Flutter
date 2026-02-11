import 'package:flutter/material.dart';

void main() {
  // função principal que executa o código
  runApp(TelaContador()); // função que executa o app
  // na maioria dos casos, não há necessidade de colocar const
}

class TelaContador extends StatefulWidget {
  const TelaContador({super.key});

  // quando vc faz uma tela com parametros,
  // esses parametros vão aqui
  @override
  // busca o estado da tela de acordo com os parametros dela
  State<TelaContador> createState() => _TelaContadorState();
}

class _TelaContadorState extends State<TelaContador> {
  // logica em Dart
  int contador = 0;

  void add() {
    // com isso, não precisa relondar a pagina
    setState(() {
      contador++;
    });
  }

  void estacaZero() {
    setState(() {
      contador = 0;
    });
  }

  void minuir() {
    setState(() {
      if (contador <= 0) {
        estacaZero();
      } else {
        contador--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // importa todos os widgets/componentes
      home: Scaffold(
        // divide a tela em tres partes
        appBar: AppBar(title: Text("Contadorr")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$contador", style: TextStyle(fontSize: 40),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(style: TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 215, 248, 203)), onPressed: add, child: Icon(Icons.add)),
                  TextButton(style: TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 248, 183, 183)), onPressed: minuir, child: Icon(Icons.remove)),
                  TextButton(style: TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 255, 222, 222)), onPressed: estacaZero, child: Icon(Icons.refresh)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
