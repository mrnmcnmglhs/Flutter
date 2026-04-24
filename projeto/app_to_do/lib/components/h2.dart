import 'package:flutter/material.dart';

class H2 extends StatelessWidget {
  String subtitulo;

  H2({super.key, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 30, right: 80, bottom: 20),
      child: Text(
        subtitulo,
        style: TextStyle(
          fontFamily: 'Bestigia',
          fontSize: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}
