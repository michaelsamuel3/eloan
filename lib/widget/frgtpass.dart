import 'package:eloan/utility/routes.dart';
import 'package:eloan/widget/textfield.dart';
import 'package:flutter/material.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  TextEditingController currentpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController reenterpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueGrey, Colors.white],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Icon(
                Icons.handshake_outlined,
                color: Colors.black,
                size: MediaQuery.of(context).size.height * 0.15,
              ),
              const Align(
                child: Text(
                  "E-LOAN APP",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Textboxfield(
                  text: "Current password",
                  iconName: Icons.password,
                  txtcontroller: currentpassword),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Textboxfield(
                  text: "New password",
                  iconName: Icons.password,
                  txtcontroller: newpassword),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Textboxfield(
                  text: "Re-enter password",
                  iconName: Icons.password,
                  txtcontroller: reenterpassword),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.loginpage);
                },
                color: Colors.black87,
                textColor: Colors.white,
                child: const Text("Register"),
              
              ),
            ],
          ),
        )
      ],
    ));
  }
}
