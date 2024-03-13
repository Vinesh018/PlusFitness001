import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

class MainSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 235, 237),
        body: SingleChildScrollView(
          child: Column(
            children: [BlueConatier()],
          ),
        ));
  }
}

class BlueConatier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        RotatedBox(
            quarterTurns: 45,
            child: MyArc(
              diameter: screenHeight,
              key: super.key,
            )),
        InnerdataOfBlueContainer()
      ],
    );
  }
}

class MyArc extends StatelessWidget {
  final double diameter;

  const MyArc({super.key, this.diameter = 200});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.indigo.shade400;
    canvas.drawArc(
      Rect.fromPoints(Offset(650, 900), Offset(-100, 60)),
      3.14,
      3.14,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class InnerdataOfBlueContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Sign up with your username or password',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'FontMain',
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 330,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.75),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(80),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 15,
                          right: 15,
                        ),
                        child: TextField(
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.indigo.shade700,
                              decoration: TextDecoration.none,
                              decorationColor:
                                  Color.fromARGB(0, 252, 230, 166)),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            hintText: 'enter Username',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'FontMain',
                                color: Colors.grey.shade600),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 15,
                          right: 15,
                        ),
                        child: TextField(
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.indigo.shade700,
                              decoration: TextDecoration.none,
                              decorationColor:
                                  Color.fromARGB(0, 252, 230, 166)),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            hintText: 'enter email',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'FontMain',
                                color: Colors.grey.shade600),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 15),
                        child: TextField(
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.indigo.shade700,
                              decoration: TextDecoration.none,
                              decorationColor:
                                  Color.fromARGB(0, 252, 230, 166)),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300)),
                            hintText: 'enter password',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'FontMain',
                                color: Colors.grey.shade600),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45, right: 125),
                  child: InkWell(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.80),
                        ),
                        width: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 35),
                          child: Center(
                              child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'FontMain',
                                fontSize: 17),
                          )),
                        )),
                    onTap: null,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        color: Colors.transparent,
                        fontFamily: 'FontMainLight',
                        decorationColor: Colors.indigo,
                        decorationThickness: 3,
                        shadows: [
                          Shadow(color: Colors.black, offset: Offset(0, -5))
                        ]),
                  ),
                  onTap: null,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
