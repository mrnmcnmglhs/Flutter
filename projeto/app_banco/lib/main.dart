import 'package:app_banco/Screens/boletos.dart';
import 'package:app_banco/Screens/cartoes.dart';
import 'package:app_banco/Screens/pix.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(Banco());
}

// st
class Banco extends StatelessWidget {
  const Banco({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaInicial(), // coloque a tela inicial dentro do material
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0XFFfb6f92),
        title: Row(children: [Icon(Icons.person), Text("Olá S/N")]),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 380,
                height: 80,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Color(0XFFfff0f3),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: 
                
                Padding(padding: EdgeInsetsGeometry.all(10),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Saldo Atual"), Text("R\$10,50", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)],),)
                 
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0XFFfff0f3), foregroundColor: Colors.black),
                onPressed: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => Pix()),);
                }, child: Column(children: [Icon(Icons.pix),Text("Pix") ]),
              ),

              TextButton( 
                style: TextButton.styleFrom(backgroundColor: Color(0XFFfff0f3), foregroundColor: Colors.black),
                onPressed: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => Boletos()),);
                }, child: Column( children: [ Icon(Icons.document_scanner), Text("Boletos")], ),
              ),

              TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0XFFfff0f3), foregroundColor: Colors.black),
                onPressed: (){
                Navigator.push( context, MaterialPageRoute(builder: (context) => Cartoes()),);
              }, child: Column(children: [Icon(Icons.credit_card), Text("Cartões") ],)),
              
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0XFFfff0f3), foregroundColor: Colors.black),
                onPressed: AlertDialog.adaptive, child: Column(children: [Icon(Icons.attach_money), Text("Emprestimos") ],))
            ],
          ),
        ],
      ),
    );
  }
}

// color: Color(0XFF12378)
