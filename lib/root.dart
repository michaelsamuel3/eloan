import 'package:eloan/screens/homeloan.dart';
import 'package:eloan/screens/homescreen.dart';
import 'package:eloan/screens/loan1.dart';
import 'package:eloan/screens/loan2.dart';
import 'package:eloan/screens/login.dart';
import 'package:eloan/screens/personalloan.dart';
import 'package:eloan/screens/resultscreen.dart';
import 'package:eloan/screens/signin.dart';
import 'package:eloan/screens/splashscreen.dart';
import 'package:eloan/utility/routes.dart';
import 'package:eloan/widget/frgtpass.dart';
import 'package:flutter/material.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashscreen,
        routes: {
          Routes.splashscreen: (context) => const Splashscreen(),
          Routes.loginpage: (context) => const Loginpage(),
          Routes.forgotpassword: (context) => const Forgetpass(),
          Routes.signinpage: (context) => const Signinpage(),
          Routes.homescreen: (context) => const Homescreen(),
          Routes.loanpage1: (context) => const Loanpage1(),
          Routes.loanpage2: (context) => const Loanpage2(),
          Routes.homeloan: (context) => const HomeLoan(),
          Routes.personalloan: (context) => const PersonalLoan(),
           Routes.resultscreen: (context) => const Resultscreen(),
        });
  }
}
