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
      backgroundColor: Color(0XFF0f3375),
      appBar: AppBar(
        title: Text("Área Pix", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0XFF2382f7),
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