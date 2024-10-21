// ignore_for_file: avoid_print

import 'package:eloan/DB/functions/user_functions.dart';
import 'package:eloan/DB/models/user_detail_model.dart';
import 'package:eloan/DB/models/user_model.dart';
import 'package:eloan/utility/routes.dart';
import 'package:eloan/widget/scoresetter.dart';
import 'package:eloan/widget/textfield.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController age = TextEditingController();
  TextEditingController jobexperience = TextEditingController();
  TextEditingController salaried = TextEditingController();
  TextEditingController monthlyincome = TextEditingController();
  TextEditingController cibilscore = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var user = ModalRoute.of(context)?.settings.arguments;
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
                    "REGISTRATION",
                    style: TextStyle(fontSize: 40, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Textboxfield(
                    text: "Age",
                    iconName: Icons.contact_page_outlined,
                    txtcontroller: age),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Textboxfield(
                    text: "Job experience",
                    iconName: Icons.account_balance_wallet_rounded,
                    txtcontroller: jobexperience),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Textboxfield(
                    text: "Salaried/Self-employeed",
                    iconName: Icons.account_balance_outlined,
                    txtcontroller: salaried),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Textboxfield(
                    text: "Monthly Income",
                    iconName: Icons.wallet_rounded,
                    txtcontroller: monthlyincome),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Textboxfield(
                    text: "Cibil score",
                    iconName: Icons.credit_score,
                    txtcontroller: cibilscore),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                MaterialButton(
                  onPressed: () {
                    String userAge = age.text.trim();
                    String userExp = jobexperience.text.trim();
                    String userType = salaried.text.trim();
                    String userIncome = monthlyincome.text.trim();
                    String userScore = cibilscore.text.trim();

                    if (userAge.isEmpty ||
                        userExp.isEmpty ||
                        userType.isEmpty ||
                        userIncome.isEmpty ||
                        userScore.isEmpty) {
                      return;
                    }
                    UserDetails details = UserDetails(
                        age: int.parse(userAge),
                        exp: double.parse(userExp),
                        jobType: userType,
                        income: double.parse(userIncome),
                        cibil: int.parse(userScore));
                    addUserDetails(user as User, details);
                    int score = score_setter(
                        age: details.age,
                        exp: details.exp,
                        jobType: details.jobType,
                        income: details.income,
                        cibil: details.cibil);
                    if (score < 5) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("YOU ARE NOT ELIGEBLE")));
                    } else if (score > 5 && score <7) {
                      Navigator.pushNamed(context, Routes.loanpage1,arguments: user.key);
                    } else {
                       Navigator.pushNamed(context, Routes.loanpage2,arguments: user.key);
                    }

                  //  print("age : ${details.age}");
                  },
                  color: Colors.black87,
                  textColor: Colors.white,
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
