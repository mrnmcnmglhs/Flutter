import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardImage extends StatelessWidget {
  final String image;
  CardImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4)
      ),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        httpHeaders: const{
          'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
        },
        placeholder: (context, url) => const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.white,
          child: Icon(Icons.broken_image, color: Colors.grey,),
        ),
      ),
    );
  }
}