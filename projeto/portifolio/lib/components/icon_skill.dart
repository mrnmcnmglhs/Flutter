import 'package:flutter/material.dart';

class Iconskill extends StatelessWidget {
  String img;

  Iconskill({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50, height: 50,
      padding: EdgeInsets.all(3), // espessura da borda
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0XFF9E1F64), Color(0XFFFE76B6), Color(0XFFBE2A52)]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(12), // menor que o de fora
        ),
      ),
    );
  }
}
