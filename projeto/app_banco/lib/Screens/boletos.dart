import 'package:flutter/material.dart';

class Boletos extends StatefulWidget {
  const Boletos({super.key});

  @override
  State<Boletos> createState() => _BoletosState();
}

class _BoletosState extends State<Boletos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0f3375),
      appBar: AppBar(
        backgroundColor: Color(0XFF2382f7),
        title: Text("Àrea de Boletos", style: TextStyle(color: Colors.white),),
        
      ),
    );
  }
}