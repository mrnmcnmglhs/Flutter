import 'package:flutter/material.dart';

class Cartoes extends StatefulWidget {
  const Cartoes({super.key});

  @override
  State<Cartoes> createState() => _CartoesState();
}

class _CartoesState extends State<Cartoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0XFFfb6f92),
        title: Text("Cartões")
      ),

      body: 
      Column(
        children: [
          Container(
            width: 360,
            height: 250,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color(0XFFff92c2),
              borderRadius: BorderRadius.circular(20)
            ),
          )
          
        ],
      )
    );
  }
}