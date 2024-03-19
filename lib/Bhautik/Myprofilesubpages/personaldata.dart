import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plus_fitness/Vinesh/T_Meals.dart';

double screenWidth = 0;
double screenHeight = 0;

class PersonalDataMainShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    screenHeight = y;
    screenwidth = x;
    return Scaffold(
      body: GradientContainerandimage(),
    );
  }
}

class GradientContainerandimage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Container(
        height: screenHeight / 3,
        decoration: BoxDecoration(
          boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.indigo.shade100,
                  Colors.indigo.shade900,
                ]),
            border: Border(
              bottom: BorderSide(color: Colors.indigo.shade500),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            )),
      ),
        Image.asset('assets/images/userprofile.png',
              height: 200,
              width: 200,)
      ],
    );
  }
}
