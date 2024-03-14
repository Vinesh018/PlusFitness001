
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plus_fitness/Bhautik/b_login.dart';
import 'package:plus_fitness/Vinesh/footer.dart';
import 'package:plus_fitness/exercise.dart';

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
      Rect.fromPoints(Offset(600, 800), Offset(-100, 50)),
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
  var width;
  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;
    width = ScreenWidth;
      
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          mainAndSubHeading(),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 330,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.75),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(80),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      enterUsernameTextField(),
                      enterEmailTextField(),
                      enterPasswordTextField()
                    ],
                  ),
                ),
                signUpButtonField(),
              ],
            ),
          ),
          fogotPassword(),
          // sfgbjhsdfghsdgvfhj
          TextandThumb()
        ],
      ),
    );
   
  }

  Widget TextandThumb() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Social login can save your valuable time',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1))),
                  width: width / 2 - 80,
                  child: Text('')),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: RotatedBox(
                    quarterTurns: 1,
                    child: Image.asset(
                      'assets/images/Down_thumb.png',
                      height: 25,
                      width: 25,
                    )),
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1))),
                  width: width / 2 - 80,
                  child: Text('')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [socialButtons()],
            ),
          )
        ],
      ),
    );
  }

  Widget socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(160, 45),
                side: const BorderSide(
                  width: 1.0,
                  color: Colors.blue,
                )),
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  "assets/images/g_logo.png",
                  height: 25,
                  width: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "Google",
                  style: TextStyle(
                      fontFamily: "FontMain",
                      fontSize: 17,
                      color: Colors.black),
                )
              ],
            )),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                minimumSize: Size(160, 45),
                side: const BorderSide(
                  width: 1.0,
                  color: Colors.blue,
                )),
            onPressed: () {},
            child: Row(
              children: [
                Image.asset(
                  "assets/images/fb.png",
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Facebook",
                  style: TextStyle(
                      fontFamily: "FontMain",
                      fontSize: 17,
                      color: Colors.white),
                )
              ],
            )),
      ],
    );
  }

  Widget enterPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
      child: TextFormField(
        obscureText: true,
        enableSuggestions: false,
        maxLines: 1,
        style: TextStyle(
            color: Colors.indigo.shade700,
            decoration: TextDecoration.none,
            decorationColor: Color.fromARGB(0, 252, 230, 166)),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300)),
          hintText: 'Enter Password',
          hintStyle: TextStyle(
              fontSize: 16,
              fontFamily: 'FontMain',
              color: Colors.grey.shade600),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
 
  Widget signUpButtonField() {
     return Padding(
      padding: const EdgeInsets.only(top: 45, right: 125),
      child: InkWell(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.80),
            ),
            width: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
              child: Center(
                  child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'FontMain', fontSize: 17),
              )),
            )),
        onTap: () {
            Get.to((MainLogInPage()));
        },
      ),
    );
    
  }

  Widget fogotPassword() {
    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Text(
                'Forgot Password',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 17,
                    color: Colors.transparent,
                    fontFamily: 'FontMain',
                    fontWeight: FontWeight.w100,
                    decorationColor: Colors.indigo,
                    decorationThickness: 3,
                    shadows: [
                      Shadow(color: Colors.grey.shade800, offset: Offset(0, -5))
                    ]),
              ),
              onTap: null,
            ),
          ),
        ],
      ),
    );
  }

  Widget enterEmailTextField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        maxLines: 1,
        style: TextStyle(
            color: Colors.indigo.shade700,
            decoration: TextDecoration.none,
            decorationColor: Color.fromARGB(0, 252, 230, 166)),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300)),
          hintText: 'Enter Email',
          hintStyle: TextStyle(
              fontSize: 16,
              fontFamily: 'FontMain',
              color: Colors.grey.shade600),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }

  Widget enterUsernameTextField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
      ),
      child: TextFormField(
        keyboardType: TextInputType.name,
        maxLines: 1,
        style: TextStyle(
            color: Colors.indigo.shade700,
            decoration: TextDecoration.none,
            decorationColor: Color.fromARGB(0, 252, 230, 166)),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300)),
          hintText: 'Enter Username',
          hintStyle: TextStyle(
              fontSize: 16,
              fontFamily: 'FontMain',
              color: Colors.grey.shade600),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }

  Widget mainAndSubHeading() {
    return Padding(
      padding: const EdgeInsets.only(top: 90, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Sign up with your username and email',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'FontMain', fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
