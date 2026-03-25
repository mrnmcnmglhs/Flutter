import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaSplash()
    );
  }
}

class TelaSplash extends StatelessWidget {
  const TelaSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Image.asset('images/video_portifolio.gif', width: double.infinity, height: double.infinity,fit: BoxFit.cover,),
    );
  }
}