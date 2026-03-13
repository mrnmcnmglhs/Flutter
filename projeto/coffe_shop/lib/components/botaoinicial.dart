import 'package:flutter/material.dart';

class BotaoInicial extends StatelessWidget {
  Widget pagina;
  String texto;

  BotaoInicial({super.key, required this.pagina, required this.texto});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 30),
        fixedSize: Size(150, 60)
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => pagina,));
      },
      child: Text(texto),
    );
  }
}