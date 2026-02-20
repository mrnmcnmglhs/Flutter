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
      appBar: AppBar(title: Text("Àrea de Boletos"),),
    );
  }
}