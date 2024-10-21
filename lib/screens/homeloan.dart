// ignore_for_file: avoid_print, use_build_context_synchronously, unused_local_variable

import 'package:eloan/DB/functions/user_functions.dart';
import 'package:eloan/DB/models/user_model.dart';
import 'package:eloan/utility/routes.dart';
import 'package:eloan/widget/amounteligible.dart';
import 'package:eloan/widget/emicalculator.dart';
import 'package:eloan/widget/scoresetter.dart';
import 'package:flutter/material.dart';

class HomeLoan extends StatelessWidget {
  const HomeLoan({super.key});

  @override
  Widget build(BuildContext context) {
    var userkey = ModalRoute.of(context)?.settings.arguments as dynamic;
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
                      height: MediaQuery.of(context).size.height * 0.04,
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
                        "TENURES AVAILABLE",
                        style: TextStyle(fontSize: 35, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: MaterialButton(
                        onPressed: () async {
                          User user = await getUser(userkey);
                          print(userkey);

                          int score = score_setter(
                              cibil: user.cibil as int,
                              age: user.age as int,
                              exp: user.exp as double,
                              income: user.income as double,
                              jobType: user.jobType as String);
                          double amount = amountEligible(
                              income: user.income as double,
                              score: user.cibil as int);

                          double emi = emiCalculator(
                              amount_eligible: amount ,
                              tenure: 12 ,
                              interest_rate: 8);
                          print("emi=$emi");

                          print("amount eligible=$amount");

                          Navigator.pushNamed(context, Routes.resultscreen,
                              arguments: {"amount": amount, "emi": emi});
                        },
                        color: Colors.black,
                        textColor: Colors.white,
                        child: const Text(
                          "12 months",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: MaterialButton(
                        onPressed: () async {
                          User user = await getUser(userkey);

                          int score = score_setter(
                              cibil: user.cibil as int,
                              age: user.age as int,
                              exp: user.exp as double,
                              income: user.income as double,
                              jobType: user.jobType as String);
                          double amount = amountEligible(
                              income: user.income as double,
                              score: user.cibil as int);

                          double emi = emiCalculator(
                              amount_eligible: amount,
                              tenure: 24,
                              interest_rate: 16);

                          print("emi=$emi");

                          print("amount eligible=$amount");

                          Navigator.pushNamed(context, Routes.resultscreen,
                              arguments: {"amount": amount, "emi": emi});
                        },
                        color: Colors.black,
                        textColor: Colors.white,
                        child: const Text(
                          "24 months",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: MaterialButton(
                        onPressed: () async {
                          User user = await getUser(userkey);

                          int score = score_setter(
                              cibil: user.cibil as int,
                              age: user.age as int,
                              exp: user.exp as double,
                              income: user.income as double,
                              jobType: user.jobType as String);
                          double amount = amountEligible(
                              income: user.income as double,
                              score: user.cibil as int);

                          double emi = emiCalculator(
                              amount_eligible: amount,
                              tenure: 36,
                              interest_rate: 12);

                          print("emi=$emi");

                          print("amount eligible=$amount");

                          Navigator.pushNamed(context, Routes.resultscreen,
                              arguments: {"amount": amount, "emi": emi});
                        },
                        color: Colors.black,
                        textColor: Colors.white,
                        child: const Text(
                          "36 months",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: MaterialButton(
                        onPressed: () async {
                          User user = await getUser(userkey);
                          print(userkey);

                          int score = score_setter(
                              cibil: user.cibil as int,
                              age: user.age as int,
                              exp: user.exp as double,
                              income: user.income as double,
                              jobType: user.jobType as String);
                          double amount = amountEligible(
                              income: user.income as double,
                              score: user.cibil as int);

                          double emi = emiCalculator(
                              amount_eligible: amount,
                              tenure: 48,
                              interest_rate: 14);

                          print("emi=$emi");

                          print("amount eligible=$amount");

                          Navigator.pushNamed(context, Routes.resultscreen,
                              arguments: {"amount": amount, "emi": emi});
                        },
                        color: Colors.black,
                        textColor: Colors.white,
                        child: const Text(
                          "48 months",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: MaterialButton(
                        onPressed: () async {
                          User user = await getUser(userkey);

                          int score = score_setter(
                              cibil: user.cibil as int,
                              age: user.age as int,
                              exp: user.exp as double,
                              income: user.income as double,
                              jobType: user.jobType as String);
                          double amount = amountEligible(
                              income: user.income as double,
                              score: user.cibil as int);

                          double emi = emiCalculator(
                              amount_eligible: amount,
                              tenure: 60,
                              interest_rate: 17);

                          print("emi=$emi");

                          print("amount eligible=$amount");

                          Navigator.pushNamed(context, Routes.resultscreen,
                              arguments: {"amount": amount, "emi": emi
                              });
                        },
                        color: Colors.black,
                        textColor: Colors.white,
                        child: const Text(
                          "60 months",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
