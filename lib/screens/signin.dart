// // ignore_for_file: avoid_print, use_build_context_synchronously
// import 'package:eloan/DB/functions/user_functions.dart';
// import 'package:eloan/DB/models/user_model.dart';
// import 'package:eloan/utility/routes.dart';
// import 'package:eloan/widget/textfield.dart';
// import 'package:flutter/material.dart';

// class Signinpage extends StatefulWidget {
//   const Signinpage({super.key});

//   @override
//   State<Signinpage> createState() => _SigninpageState();
// }

// class _SigninpageState extends State<Signinpage> {
//     TextEditingController firstname = TextEditingController();
//     TextEditingController lastname = TextEditingController();
//     TextEditingController email = TextEditingController();
//     TextEditingController password = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView(
//       children: [
//         Center(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             decoration: const BoxDecoration(
//               gradient: RadialGradient(colors: [
//                 Color.fromARGB(255, 184, 206, 224),
//                 Color.fromARGB(255, 190, 221, 242),
//               ], radius: 1),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.08,
//                 ),
//                 const Align(
//                   child: Text(
//                     "S I G N U P",
//                     style: TextStyle(fontSize: 35, color: Colors.black,fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.06,
//                 ),
//                 Textboxfield(
//                     text: "First name",
//                     iconName: Icons.contacts_outlined,
//                     txtcontroller: firstname),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 Textboxfield(
//                     text: "Last name",
//                     iconName: Icons.contacts_outlined,
//                     txtcontroller: lastname),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 Textboxfield(
//                     text: "E-mail",
//                     iconName: Icons.email_outlined,
//                     txtcontroller: email),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 Textboxfield(
//                     text: "Password",
//                     iconName: Icons.remove_red_eye_outlined,
//                     txtcontroller: password),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                 ),
//                 MaterialButton(
//                   onPressed: () async{
//                     String fname = firstname.text.trim();
//                     String lname = lastname.text.trim();
//                     String mail = email.text.trim();
//                     String pwd = password.text.trim();

//                     if (fname.isEmpty ||
//                         lname.isEmpty ||
//                         mail.isEmpty ||
//                         pwd.isEmpty) {
//                       return;
//                     }
//                     User user =User(
//                       firstName: fname,
//                       lastName: lname,
//                       email: mail,
//                       password: pwd, 
//                     );
//                     addUser(user);
//                     Navigator.pushNamed(context, Routes.loginpage);
//                   },
//                   color: Colors.black87,
//                   textColor: Colors.white,
//                   child: const Text("Register"),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//             Row(mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                     const Text("Already a member ?"),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, Routes.loginpage);
//                     },
//                     child: const Text("login",))
//               ],
//             )
//               ],
//             ),
//           ),
//         ),
//       ],
//     ));
//   }
// }

import 'package:eloan/DB/functions/user_functions.dart';
import 'package:eloan/DB/models/user_model.dart';
import 'package:eloan/utility/routes.dart';
import 'package:flutter/material.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                  colors: [
                    Color.fromARGB(255, 235, 238, 241),
                    Color.fromARGB(255, 150, 208, 247),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    const Align(
                      child: Text(
                        "S I G N U P",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: TextFormField(
                        controller: firstname,
                        decoration: InputDecoration(
                          labelText: 'First name',
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: TextFormField(
                        controller: lastname,
                        decoration: InputDecoration(
                          labelText: 'Last name',
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          String fname = firstname.text.trim();
                          String lname = lastname.text.trim();
                          String mail = email.text.trim();
                          String pwd = password.text.trim();

                          User user = User(
                            firstName: fname,
                            lastName: lname,
                            email: mail,
                            password: pwd,
                          );

                          addUser(user);
                          Navigator.pushNamed(context, Routes.loginpage);
                        }
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 80,
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already a member?",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.loginpage);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
