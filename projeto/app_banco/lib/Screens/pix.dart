import 'package:flutter/material.dart';
import 'dart:io';

class Pix extends StatefulWidget {
  const Pix({super.key});

  @override
  State<Pix> createState() => _PixState();
}

class _PixState extends State<Pix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Área Pix"),
        backgroundColor: Color(0XFFfb6f92),
      ),
      body: Center(
        child: Container(
          width: 370,
          height: 25,
          child: Column(),
        ),

      )
    );
  }
}