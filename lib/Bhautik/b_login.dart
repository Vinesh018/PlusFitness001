import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plus_fitness/Bhautik/b_sign_up.dart';
import 'package:plus_fitness/main.dart';

class MainLogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 235, 237),
        body: SingleChildScrollView(
          child: Column(
            children: [Login()],
          ),
        ));
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        RotatedBox(
            quarterTurns: 195,
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
      Rect.fromPoints(Offset(650, 900), Offset(-150, 50)),
      3.14,
      3.14,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class InnerdataOfBlueContainer extends StatefulWidget {
  @override
  State<InnerdataOfBlueContainer> createState() =>
      _InnerdataOfBlueContainerState();
}

class _InnerdataOfBlueContainerState extends State<InnerdataOfBlueContainer> {
  var width;
  TextEditingController pswdController1 = TextEditingController();
  TextEditingController _emailcontroller1 = TextEditingController();
  final _passwordValidationkey1 = GlobalKey<FormState>();
  final _emailValidationkey1 = GlobalKey<FormState>();
  FocusNode pswdFocus1 = FocusNode();
  FocusNode _emailfocus1 = FocusNode();
  int validateEmail(String? emailadress) {
    String pattternemail = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattternemail);
    if (emailadress!.isEmpty || emailadress.length == 0) {
      return 1;
    } else if (!regExp.hasMatch(emailadress)) {
      return 2;
    } else {
      return 0;
    }
  }

  bool validateEmailbool(String? emailadress) {
    String pattternemail = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattternemail);
    if (emailadress!.isEmpty || emailadress.length == 0) {
      return false;
    } else if (!regExp.hasMatch(emailadress)) {
      return false;
    } else {
      return true;
    }
  }

  int validatePassword(String? pswd) {
    String pattternpassword =
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
    RegExp regExp = RegExp(pattternpassword);

    if (pswd!.isEmpty || pswd.length == 0) {
      return 1;
    } else if (!regExp.hasMatch(pswd)) {
      return 2;
    } else {
      return 0;
    }
  }

  bool validatePasswordbool(String? pswd) {
    String pattternpassword =
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
    RegExp regExp = RegExp(pattternpassword);
    if (pswd!.isEmpty || pswd.length == 0) {
      return false;
    } else if (!regExp.hasMatch(pswd)) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    width = screenWidth;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    children: [enterEmailTextField(), enterPasswordTextField()],
                  ),
                ),
                logInButtonField(),
              ],
            ),
          ),
          createAccount(),
          TextandThumb(),
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

  Widget enterEmailTextField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        left: 15,
        right: 15,
      ),
      child: Form(
        key: _emailValidationkey1,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          maxLines: 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _emailcontroller1,
          onChanged: (value) {},
          validator: (value) {
            int res = validateEmail(value);
            if (res == 1) {
              return "Please  fill email address";
            } else if (res == 2) {
              return "Please enter valid email address";
            } else {
              return null;
            }
          },
          focusNode: _emailfocus1,
          autofocus: false,
          //  Before Editaed Code
          style: TextStyle(
              color: Colors.indigo.shade700,
              decoration: TextDecoration.none,
              decorationColor: Color.fromARGB(0, 252, 230, 166)),
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300)),
            hintText: 'Enter Email',
            errorText: '',
            hintStyle: TextStyle(
                fontSize: 16,
                fontFamily: 'FontMain',
                color: Colors.grey.shade600),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            errorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey.shade300,
                )),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
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
      padding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
      child: Form(
        key: _passwordValidationkey1,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: pswdController1,
          focusNode: pswdFocus1,
          obscureText: true,
          enableSuggestions: false,
          maxLines: 1,
          validator: (value) {
            int res = validatePassword(value);
            if (res == 1) {
              return "Please fill password";
            } else if (res == 2) {
              return "Please enter strong password:";
            } else {
              return null;
            }
          },
          style: TextStyle(
              color: Colors.indigo.shade700,
              decoration: TextDecoration.none,
              decorationColor: Color.fromARGB(0, 252, 230, 166)),
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            errorMaxLines: 2,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300)),
            hintText: 'Enter Password',
            errorText: '',
            hintStyle: TextStyle(
                fontSize: 16,
                fontFamily: 'FontMain',
                color: Colors.grey.shade600),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            errorBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey.shade300,
                )),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget logInButtonField() {
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
                "Log In",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'FontMain', fontSize: 17),
              )),
            )),
        onTap: () {
          _emailValidationkey1.currentState?.validate();
          _passwordValidationkey1.currentState?.validate();
          if (_emailcontroller1.text.isEmpty) {
            var snackBar = SnackBar(content: Text('Plese enter email adress'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            _emailfocus1.requestFocus();
          } else if (validateEmailbool(_emailcontroller1.text) == false) {
            var snackBar =
                SnackBar(content: Text('Plese enter valid email adress'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            _emailfocus1.requestFocus();
          } else if (pswdController1.text.isEmpty) {
            var snackBar = SnackBar(content: Text('Plese enter password'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            pswdFocus1.requestFocus();
          } else {
            FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller1.text, password: pswdController1.text)
                .then((value) {
                  Get.off(TutorialHome()); 
                }, ).onError((error, stackTrace) {
                  var snackBar = SnackBar(content: Text('Invalid Username or Password !'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  print('Error in password ${error.toString()}');
                }, );
          }
        },
      ),
    );
  }

  Widget createAccount() {
    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Text(
                'Create Account',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 17,
                    color: Colors.transparent,
                    fontFamily: 'FontMain',
                    fontWeight: FontWeight.w100,
                    decorationColor: Colors.white,
                    decorationThickness: 2,
                    shadows: [
                      Shadow(color: Colors.white, offset: Offset(0, -5))
                    ]),
              ),
              onTap:() {
               
               Get.off(MainSignUpPage());
              } ,
            ),
          ),
        ],
      ),
    );
  }

  Widget mainAndSubHeading() {
    return Padding(
      padding: const EdgeInsets.only(top: 110, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Log In',
            style: TextStyle(
                fontSize: 35,
                color: Colors.indigo,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Log in with your email and password',
              style: TextStyle(
                  color: Colors.indigo.shade800,
                  fontFamily: 'FontMain',
                  fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
