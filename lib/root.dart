import 'package:flutter/material.dart';

import 'screens/homeloan.dart';
import 'screens/homescreen.dart';
import 'screens/loan1.dart';
import 'screens/loan2.dart';
import 'screens/login.dart';
import 'screens/personalloan.dart';
import 'screens/resultscreen.dart';
import 'screens/signin.dart';
import 'screens/splashscreen.dart';
import 'utility/routes.dart';
import 'widget/frgtpass.dart';

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
