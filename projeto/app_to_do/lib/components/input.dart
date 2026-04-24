import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String? placheholder;

  const Input({super.key, required this.controller, required this.placheholder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: 450,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: placheholder,
                  filled: true,
                  fillColor: Color(0XFFF9D7B5),
                  // borda quando o campo não foi selecionado
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(2),
                  ),

                  // borda quando o campo foi selecionado
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFFF5731F)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            );
  }
}