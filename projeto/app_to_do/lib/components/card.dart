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
        alignment: Alignment.center,
        children: [
          Container(
            width: 362,
            height: 73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black, width: 2.0),
              color: cor,
            ),
            child: ListTile(
              leading: SizedBox(
                width: 40,
                height: 40,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ), 
              ),
              title: Text(title),

              trailing: GestureDetector(
                onTap: fazerDelete, 
                child: const Icon(Icons.delete),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
