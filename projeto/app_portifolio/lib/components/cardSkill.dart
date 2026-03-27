import 'package:app_portifolio/components/iconSkill.dart';
import 'package:flutter/material.dart';

class Cardskill extends StatelessWidget {
  String procentagem;
  Widget icon, icon2, icon3, icon4;
  Cardskill({super.key, required this.procentagem, required this.icon, required this.icon2, required this.icon3, required this.icon4});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 250,
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.symmetric(vertical: 20,),
          decoration: BoxDecoration(
            color: Color(0xFFECEEDB),
            borderRadius: BorderRadius.circular(2),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [icon, icon2, icon3, icon4],
          ),
        ),

        Positioned(
          left: 20,
          top: 12,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            color: Color(0xFFF4B544),
            child: Text(
              procentagem,
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Smile Delight',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
