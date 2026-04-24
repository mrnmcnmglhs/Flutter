import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  String conteudo;
  final VoidCallback? onPressed;
  
  Botao({super.key, required this.conteudo, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsetsGeometry.only(top: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 0, 0, 0),
                  backgroundColor: Color(0XFFF1C256),
                  side: BorderSide(color: const Color.fromARGB(255, 0, 0, 0), width: 2.0),
                  minimumSize: Size(250, 50),
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Bestigia',
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    // Deixa as pontas arredondadas
                  ),
                ),
                onPressed: onPressed,
                child: Text(conteudo),
              ),
            );
  }
}