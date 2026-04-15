import 'package:flutter/material.dart';

class CardTasks extends StatelessWidget {
  final int indexOriginal;
  Widget child;

  CardTasks({super.key, required this.indexOriginal, required this.child});
  
  final List<Color> _coresCard = const[
    Color(0XFFF5A9C7),
    Color(0XFF69C63D),
    Color(0XFF62A4E2),
    Color(0XFFF8A69B),
  ];

  @override
  Widget build(BuildContext context) {
    final corAtual = _coresCard[indexOriginal % _coresCard.length];
    return Stack(
      children: [
        Container(
          width: 362,
          height: 73,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: corAtual
          ),
          child: ListTile(
              subtitle: Text("Item ${indexOriginal + 1}"),
          ),
        )
      ],
    );
  }
}