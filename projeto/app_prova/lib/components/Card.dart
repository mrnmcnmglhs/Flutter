import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  String image;
  CardImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
      child: Image.network(image, width: 80,),
    );
  }
}