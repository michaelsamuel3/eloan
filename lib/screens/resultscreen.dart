import 'package:flutter/material.dart';

class Resultscreen extends StatefulWidget {
  const Resultscreen({super.key});

  @override
  State<Resultscreen> createState() => _ResultscreenState();
}

class _ResultscreenState extends State<Resultscreen> {
  @override
  Widget build(BuildContext context) {
    final details =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final amount = details["amount"] as double;
    final emi = details["emi"] as double;
    return Scaffold(
        body: ListView(
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Icon(
                    Icons.handshake_outlined,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.height * 0.10,
                  ),
                  const Align(
                    child: Text(
                      "E-LOAN APP",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/person.png"),fit: BoxFit.scaleDown)),
                    ),
                  ),
                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Center(
                    child: Text(
                      "AMOUNT ELIGIBLE:    ${amount.floor()}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Center(
                    child: Text(
                      "EMI:     ${emi.floor()}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
          ),
        )
      ],
    ));
  }
}
