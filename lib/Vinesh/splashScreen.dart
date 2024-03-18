import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plus_fitness/Bhautik/b_login.dart';
var width;
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    width = screenwidth;
    return AnimatedSplashScreen(
      splash: Lottie.asset("assets/splashAnimation/splash.json"),
      nextScreen: MainLogInPage(),
      backgroundColor: Colors.indigo.shade400,
      splashIconSize: width,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      animationDuration: Duration(seconds: 2),
    );
  }
}
