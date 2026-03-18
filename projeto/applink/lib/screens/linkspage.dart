import 'package:applink/components/links.dart';
import 'package:flutter/material.dart';

class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Links(url: "https://i.pinimg.com/736x/16/c2/be/16c2be27a8987e37fd2904e575dad12f.jpg", imagem: "https://pbs.twimg.com/profile_images/626202996507049984/KkAnR3BM_400x400.jpg")
          ],
        ),
      ),
    );
  }
}