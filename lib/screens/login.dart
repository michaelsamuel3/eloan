// ignore_for_file: avoid_print

import 'package:eloan/DB/functions/user_functions.dart';
import 'package:eloan/utility/routes.dart';
import 'package:eloan/widget/textfield.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                        fontStyle: FontStyle.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Align(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Textboxfield(
                    text: "User email",
                    iconName: Icons.contacts_outlined,
                    txtcontroller: email),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Textboxfield(
                    text: "Password",
                    iconName: Icons.remove_red_eye_outlined,
                    txtcontroller: password
                    ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.forgotpassword);
                      },
                      child: const Text(
                        "Forgot password",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                MaterialButton(
                  onPressed: () async {
                    final mail = email.text.trim();
                    final pwd = password.text.trim();

                    if (mail.isEmpty || pwd.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("invalid input")));
                      return;
                    }

                    dynamic users = await getUsers();
                    users.forEach((user) {
                      print(
                          "user email : ${user.email}\n password : ${user.password}");
                      if (user.email == mail && user.password == pwd) {
                        print("user key : ${user.key}");
                        Navigator.pushNamed(context, Routes.homescreen,
                            arguments: user);
                      }
                    });
                  },
                  color: Colors.black87,
                  textColor: Colors.white,
                  child: const Text("login"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text("Not a member ?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signinpage);
                  },
                  child: const Text(
                    "Sign up",
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
