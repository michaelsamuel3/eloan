// ignore_for_file: avoid_print

// import 'package:eloan/DB/functions/user_functions.dart';
// import 'package:eloan/utility/routes.dart';
// import 'package:eloan/widget/textfield.dart';
// import 'package:flutter/material.dart';

// class Loginpage extends StatefulWidget {
//   const Loginpage({super.key});

//   @override
//   State<Loginpage> createState() => _LoginpageState();
// }

// class _LoginpageState extends State<Loginpage> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
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
//                   height: MediaQuery.of(context).size.height * 0.10,
//                 ),
//                 const Align(
//                   child: Text(
//                     "L O G I N",
//                     style: TextStyle(fontSize: 35, color: Colors.black,fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.06,
//                 ),
//                 Textboxfield(
//                     text: "User email",
//                     iconName: Icons.contacts_outlined,
//                     txtcontroller: email),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 Textboxfield(
//                     text: "Password",
//                     iconName: Icons.remove_red_eye_outlined,
//                     txtcontroller: password),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 // Container(
//                 //   height: MediaQuery.of(context).size.height * 0.05,
//                 //   width: MediaQuery.of(context).size.width * 0.8,
//                 //   alignment: Alignment.topRight,
//                 //   child: TextButton(
//                 //       onPressed: () {
//                 //         Navigator.pushNamed(context, Routes.forgotpassword);
//                 //       },
//                 //       child: const Text(
//                 //         "Forgot password",
//                 //         textDirection: TextDirection.rtl,
//                 //         textAlign: TextAlign.right,
//                 //       )),
//                 // ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 MaterialButton(
//                   onPressed: () async {
//                     final mail = email.text.trim();
//                     final pwd = password.text.trim();

//                     if (mail.isEmpty || pwd.isEmpty) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text("invalid input")));
//                       return;
//                     }

//                     dynamic users = await getUsers();
//                     users.forEach((user) {
//                       print(
//                           "user email : ${user.email}\n password : ${user.password}");
//                       if (user.email == mail && user.password == pwd) {
//                         print("user key : ${user.key}");
//                         Navigator.pushNamed(context, Routes.homescreen,
//                             arguments: user);
//                       }
//                     });
//                   },
//                   color: Colors.black87,
//                   textColor: Colors.white,
//                   child: const Text("login"),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                     const Text("Not a member ?"),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, Routes.signinpage);
//                   },
//                   child: const Text(
//                     "Sign up",
//                   ),
//                 )
//                 ],
//               )
//               ],
//             ),
//           ),
//         )
//       ],
//     ));
//   }
// }

import 'package:eloan/DB/functions/user_functions.dart';
import 'package:eloan/utility/routes.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                    const Align(
                      child: Text(
                        "L O G I N",
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
                        controller: email,
                        decoration: InputDecoration(
                          labelText: 'User email',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
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
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    // ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          final mail = email.text.trim();
                          final pwd = password.text.trim();

                          dynamic users = await getUsers();
                          bool userFound = false;
                          for (var user in users) {
                            if (user.email == mail && user.password == pwd) {
                              userFound = true;
                              Navigator.pushNamed(
                                context,
                                Routes.homescreen,
                                arguments: user,
                              );
                              break;
                            }
                          }

                          if (!userFound) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("User not found")),
                            );
                          }
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
                        "Login",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not a member?",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.signinpage);
                          },
                          child: const Text(
                            "Sign up",
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
