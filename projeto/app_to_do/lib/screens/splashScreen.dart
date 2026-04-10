import 'package:app_to_do/navigation/navbar.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // logica
  @override // garante que a função resete toda vez que iniciar o app
  // função de atribuir instruções no estado inicial da tela - carregamento
  void initState(){
    super.initState();
    Future.delayed(
      // estabelece um determinado tempo e depois realiza uma ação
      Duration(seconds: 15),
      (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Navbar()));
      }  
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          children: [
            Icon(Icons.task, size: 80,),
            Text("Paper Easy"),
            Divider(indent: 50, endIndent: 50,),
            Text("Tenha todas as suas tarefas em um lugar só")
          ],
        ),
      )
    );
  }
}