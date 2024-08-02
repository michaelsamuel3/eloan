//import 'package:eloan/DB/models/user_model.dart';
import 'package:eloan/utility/routes.dart';
import 'package:flutter/material.dart';

class Loanpage2 extends StatefulWidget {
  const Loanpage2({super.key});

  @override
  State<Loanpage2> createState() => _LoanpageState();
}

class _LoanpageState extends State<Loanpage2> {
  @override
  Widget build(BuildContext context) {
     var user = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
           decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [
                Color.fromARGB(255, 184, 206, 224),
                Color.fromARGB(255, 190, 221, 242),
              ], radius: 1),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  const Text("LOAN AVAILABILITY",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.personalloan,arguments: user);
                      },
                      color:Colors.black,
                      textColor:Colors.white,
                      child: const Text("Personal loan" ,style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.homeloan,arguments: user);
                      },
                      color: Colors.black,
                      textColor:Colors.white,
                         child: const Text("Home loan" ,style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
