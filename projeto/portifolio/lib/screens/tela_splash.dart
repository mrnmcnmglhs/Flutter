
import 'package:flutter/material.dart';
import 'package:portifolio/screens/tela_perfil.dart';

class TelaSplash extends StatefulWidget {
  @override
  _TelaSplashState createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
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