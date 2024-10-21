// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:eloan/DB/functions/user_functions.dart';
import 'package:eloan/DB/models/user_model.dart';
import 'package:eloan/utility/routes.dart';
import 'package:eloan/widget/textfield.dart';
import 'package:flutter/material.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
    TextEditingController firstname = TextEditingController();
    TextEditingController lastname = TextEditingController();
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
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                const Align(
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Textboxfield(
                    text: "First name",
                    iconName: Icons.contacts_outlined,
                    txtcontroller: firstname),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Textboxfield(
                    text: "Last name",
                    iconName: Icons.contacts_outlined,
                    txtcontroller: lastname),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Textboxfield(
                    text: "E-mail",
                    iconName: Icons.email_outlined,
                    txtcontroller: email),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Textboxfield(
                    text: "Password",
                    iconName: Icons.remove_red_eye_outlined,
                    txtcontroller: password),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                MaterialButton(
                  onPressed: () async{
                    String fname = firstname.text.trim();
                    String lname = lastname.text.trim();
                    String mail = email.text.trim();
                    String pwd = password.text.trim();

                    if (fname.isEmpty ||
                        lname.isEmpty ||
                        mail.isEmpty ||
                        pwd.isEmpty) {
                      return;
                    }
                    User user =User(
                      firstName: fname,
                      lastName: lname,
                      email: mail,
                      password: pwd, 
                    );
                    addUser(user);
                    Navigator.pushNamed(context, Routes.loginpage);
                  },
                  color: Colors.black87,
                  textColor: Colors.white,
                  child: const Text("Register"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const Text("Already a member ?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginpage);
                    },
                    child: const Text("login",))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
