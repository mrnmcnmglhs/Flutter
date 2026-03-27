import 'package:app_portifolio/screens/telaperfil.dart';
import 'package:flutter/material.dart';

class TelaSplash extends StatefulWidget {
  @override
  _TelaSplashState createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {

  @override
  void initState() {
    super.initState();

    // ⏳ Espera 12 segundos
    Future.delayed(Duration(seconds: 10), () {
      // 🔁 Troca de tela
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaPerfil()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset('images/video_portifolio.gif', width: double.infinity, height: double.infinity,fit: BoxFit.cover,),
    );
  }
}