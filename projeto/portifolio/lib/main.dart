import 'package:flutter/material.dart';
import 'package:portifolio/screens/tela_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false, home: TelaSplash());
  }
}
