import 'package:app_green_food/Screams/Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Intermediaria());
}

class Intermediaria extends StatelessWidget {
  const Intermediaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splash_tela());
  }
}

class Splash_tela extends StatefulWidget {
  const Splash_tela({super.key});

  @override
  State<Splash_tela> createState() => _Splash_telaState();
}

class _Splash_telaState extends State<Splash_tela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF849E16),
      body: Stack(
        children: [
          Image.asset(
            'assets/fundo.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(right:70, left: 20),
                  child: Text("Green Food",
                  style: TextStyle(fontFamily: 'Louvere', fontSize: 60, color: Colors.white, ),
                  ),
                ),
                
                Padding(padding: EdgeInsets.only(left:200),
                  child: Text("Green Mood",
                  style: TextStyle(fontFamily: 'Louvere', fontSize: 60, color: Colors.white, ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(right:100, left: 20),
                  child: Text("and a Great Life",
                  style: TextStyle(fontFamily: 'Louvere', fontSize: 60, color: Colors.white, ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(right: 20, top: 50),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: 
                      TextButton(
                        style: TextButton.styleFrom(backgroundColor: Color(0XFFD9560E), foregroundColor: Colors.white),
                        onPressed: (){
                          Navigator.push( context, MaterialPageRoute(builder: (context) => Login()),);
                        }, child: Column(children: [Text("Começar", style: TextStyle(fontSize: 35),)],),
                      ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(left: 40, top: 90),
                  child: 
                  Container(
                    width: 350,
                    height: 360,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/estrelinha1.png'), 
                      fit: BoxFit.cover),
                    ),
                  )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
