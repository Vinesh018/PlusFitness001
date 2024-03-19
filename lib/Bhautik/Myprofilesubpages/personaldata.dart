import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plus_fitness/Vinesh/T_Meals.dart';
import 'package:image_picker/image_picker.dart';

double screenWidth = 0;
double screenHeight = 0;

class PersonalDataMainShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainerandimage(),
    );
  }
}

class GradientContainerandimage extends StatefulWidget {
  @override
  State<GradientContainerandimage> createState() =>
      _GradientContainerandimageState();
}

class _GradientContainerandimageState extends State<GradientContainerandimage> {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    double y = MediaQuery.of(context).size.height;
    screenHeight = y;
    print(screenHeight);
    print(screenWidth);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
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
        Positioned(
          top: screenHeight / 4.5,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.white10, Colors.white70],
                ),
                border: Border.all(width: 1, color: Colors.grey.shade100),
                borderRadius: BorderRadius.circular(100)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              child: Image.asset(
                'assets/images/boy.png',
                height: screenHeight / 8,
                width: screenHeight / 8,
              ),
            ),
          ),
        ),
        Positioned(
            left: screenWidth / 1.65,
            top: screenHeight / 2.9,
            child: Icon(
              Icons.camera,
              size: screenWidth / 12,
              color: Colors.indigo,
            ))
      ],
    );
  }
}
