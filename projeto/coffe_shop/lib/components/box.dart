import 'package:flutter/material.dart';



class Boxisy extends StatelessWidget {
  String texto;
  String foto;
  String descricao;
  String valor;
  Boxisy({super.key, required this.texto, required this.foto, required this.descricao, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.brown, 
        borderRadius: BorderRadiusGeometry.circular(20),
      ), 
      child: Row(
        children: [
          Padding(padding: EdgeInsets.only(left: 10),
            child: 
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(foto),
                fit: BoxFit.cover),
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
            ),
          ),
          
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 30), 
                child: 
                  Text(
                    texto, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ,),

              Padding(padding: EdgeInsets.only(top: 10, left: 20),
                child: SizedBox(width: 180, child: Text(descricao, style: TextStyle(fontSize: 20, color: Colors.white))),
              ),
              Padding(padding: EdgeInsets.only(top: 20),
                child: Text(valor, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40),),
              )
            ],
          )
        ],
      ),
    );;
  }
}