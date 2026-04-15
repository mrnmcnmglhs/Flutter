import 'package:app_to_do/navigation/navbar.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // Lógica de inicialização (descomente quando for usar)
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 0), // Dica: 15 segundos é bastante tempo para uma splash screen. O ideal costuma ser de 2 a 3 segundos.
      () {
        Navigator.pushReplacement( // Use pushReplacement para o usuário não conseguir voltar para a Splash ao apertar o botão "Voltar" do celular
          context, 
          MaterialPageRoute(builder: (context) => const Navbar()),
        );
      }  
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/Splash.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column( 
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 220, left: 65, right: 108),
                  child: Text(
                    "Paper", 
                    style: TextStyle(fontFamily: 'Bestigia', fontSize: 90, color: Colors.black, height: 0.3,),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 115, top: 0, bottom: 20), 
                  child: Text(
                    "Easy", 
                    style: TextStyle(fontFamily: 'Bestigia', fontSize: 90, color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 183,
                      height: 203,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/nuvem_lapis.png'), fit: BoxFit.cover)
                      ),
                    ),
                    Container(
                      width: 87,
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/mao_lapis.png'), fit: BoxFit.cover)
                      ),
                    )

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}