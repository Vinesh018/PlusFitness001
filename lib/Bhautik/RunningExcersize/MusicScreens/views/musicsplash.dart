import 'dart:async';

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/MusicScreens/MusicHome.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreenformusic extends StatefulWidget {
  @override
  State<Splashscreenformusic> createState() => _SplashscreenformusicState();
}

class _SplashscreenformusicState extends State<Splashscreenformusic> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MusicHomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.blue.shade500,
          Colors.blue.shade400,
          Colors.indigo.shade300,
          Colors.indigo.shade400,
          Colors.indigo.shade500,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: DelayedWidget(
          animationDuration: Duration(seconds: 3),
          child: Center(
              child: Text(
            'Take a Deep Breath',
            style: GoogleFonts.dancingScript(
              textStyle: TextStyle(color: Colors.white),
              fontSize: 35,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              
            ),
          )),
        ),
      ),
    );
  }
}
