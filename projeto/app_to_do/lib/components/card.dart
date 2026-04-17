import 'package:flutter/material.dart';

class CardTasks extends StatelessWidget {
  // 1. Added 'final' to make the widget immutable
  Color cor; 
  final String title;
  final String image;
  final VoidCallback fazerDelete;

  // 2. Added 'const' to the constructor
  CardTasks({
    super.key,
    required this.fazerDelete, 
    required this.title, 
    required this.image,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: Stack(
        children: [
          Container(
            width: 362,
            height: 73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: cor
            ),
            child: ListTile(
              // 3. Removed the Row. Image goes in leading, Text goes in title.
              leading: Image.network(
                image,
                width: 40,
                height: 40,
                fit: BoxFit.cover, // Ensures the image doesn't stretch weirdly
              ),
              title: Text(title),
              
              // 4. Fixed the function execution!
              trailing: GestureDetector(
                onTap: fazerDelete, // Pass the function reference directly
                child: const Icon(Icons.delete),
              ),
            ),
          )
        ],
      ),
    );
  }
}