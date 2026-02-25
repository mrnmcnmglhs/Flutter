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
      backgroundColor: Color(0XFF0f3375),
      appBar: AppBar(
        backgroundColor: Color(0XFF2382f7),
        title: Text("Cartões", style: TextStyle(color: Colors.white)),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/cartao.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text("Pegar Fatura"),
              )
            ]
          ),
          Column(
            children: [
              Text(
                "Fatura",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
