import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eloan/screens/login.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: MediaQuery.of(context).size.height*0.7,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Color.fromARGB(255, 169, 182, 252),
        splash:  Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
            ),
            Icon(Icons.handshake_outlined,
            color:Colors.black,
            size: MediaQuery.of(context).size.height*0.15,),
             Text("E-LOAN APP",
            style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.height*0.05,fontStyle: FontStyle.normal),textAlign: TextAlign.center,),
            

          ],
        ),
         nextScreen: const Loginpage(),
      ),
    );
  }
}