import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

class InnerdataOfBlueContainer extends StatefulWidget {
  @override
  State<InnerdataOfBlueContainer> createState() =>
      _InnerdataOfBlueContainerState();
}

class _InnerdataOfBlueContainerState extends State<InnerdataOfBlueContainer> {
  var width;
  bool _obscured = true;
    void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (pswdFocus.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
       pswdFocus.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  TextEditingController pswdController = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  final _emailValidationkey = GlobalKey<FormState>();
  final _passwordValidationkey = GlobalKey<FormState>();
  final _UsernameValidationKey = GlobalKey<FormState>();
  FocusNode _emailfocus = FocusNode();
  FocusNode _username = FocusNode();
    FocusNode pswdFocus = FocusNode();
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

  int validateUsername(String? urname) {
    String patternforusername =
        r'^(?=.{4,9}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$'; //Only contains alphanumeric characters, underscore and dot.
    RegExp regExp = RegExp(patternforusername);
    if (urname!.isEmpty || urname.length == 0) {
      return 1;
    } else if (!regExp.hasMatch(urname)) {
      return 2;
    } else {
      return 0;
    }
  }

  bool validateUsernamebool(String? urname) {
    String patternforusername =
        r"^(?=[a-zA-Z0-9._]{4,9}$)(?!.*[_.]{2})[^_.].*[^_.]$";
    RegExp regExp = RegExp(patternforusername);
    if (urname!.isEmpty || urname.length == 0) {
      return false;
    } else if (!regExp.hasMatch(urname)) {
      return false;
    } else {
      return true;
    }
  }

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
          redirectLogin(),
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
      padding: const EdgeInsets.only(top: 5, left: 15, right: 35, bottom: 5),
      child: Form(
        key: _passwordValidationkey,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: pswdController,
          focusNode: pswdFocus,
          obscureText: _obscured,
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
             suffixIcon: GestureDetector(
              onTap: _toggleObscured,
              child: Icon(
                 _obscured
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
                  color: Colors.indigo.shade400,
                )),
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
          _UsernameValidationKey.currentState?.validate();
          _emailValidationkey.currentState?.validate();
          _passwordValidationkey.currentState?.validate();
          if (usernamecontroller.text.isEmpty) {
            var snackBar = SnackBar(content: Text('Plese enter username'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            _username.requestFocus();
          } else if (validateUsernamebool(usernamecontroller.text) == false) {
            var snackBar = SnackBar(
                content: Text(
                    'username should contain 4 - 9 character,numbers,.and _'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            _username.requestFocus();
          } else if (_emailcontroller.text.isEmpty) {
            var snackBar = SnackBar(content: Text('Plese enter email adress'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            _emailfocus.requestFocus();
          } else if (validateEmailbool(_emailcontroller.text) == false) {
            var snackBar =
                SnackBar(content: Text('Plese enter valid email adress'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            _emailfocus.requestFocus();
          } else if (pswdController.text.isEmpty) {
            var snackBar = SnackBar(content: Text('Plese enter password'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            pswdFocus.requestFocus();
          } else if (validatePasswordbool(pswdController.text) == false) {
            var snackBar = SnackBar(
                content: Text(
                    'Password must have Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            pswdFocus.requestFocus();
          } else {

          FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailcontroller.text, password: pswdController.text).then((value) {
               Get.off(
                  () => MainLogInPage(),
                  transition: Transition.downToUp,
                );
// Named Route
                GetPage(
                  name: "/next_Screen",
                  page: () => MainSignUpPage(),
                  transition: Transition.rightToLeft,
                );
          },  
         
          ).onError((error, stackTrace) {
            var snackBar = SnackBar(content: Text('Plese Enter Valid Details !'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            print('Error While Sign Up ${error.toString()}');
          });  
          }
        },
      ),
    );
  }

  Widget redirectLogin() {
    return Padding(
      padding: const EdgeInsets.only(right: 5, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              child: Text(
                'Log In',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                    color: Colors.transparent,
                    fontFamily: 'FontMain',
                    fontWeight: FontWeight.w100,
                    decorationColor: Colors.indigo.shade400,
                    decorationThickness: 3,
                    shadows: [
                      Shadow(
                          color: Colors.indigo.shade800, offset: Offset(0, -5))
                    ]),
              ),
              onTap: () {
                 Get.off(
                  () => MainLogInPage(),
                  transition: Transition.leftToRight,
                );
// Named Route
                GetPage(
                  name: "/next_Screen",
                  page: () => MainSignUpPage(),
                  transition: Transition.rightToLeft,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget enterEmailTextField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        left: 15,
        right: 35,
      ),
      child: Form(
        key: _emailValidationkey,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          maxLines: 1,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _emailcontroller,
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
          focusNode: _emailfocus,
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

  Widget enterUsernameTextField() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 35,
      ),
      child: TextFormField(
        focusNode: _username,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: usernamecontroller,
        keyboardType: TextInputType.text,
        onChanged: (value) {},
        validator: (value) {
          int res = validateUsername(value);
          if (res == 1) {
            return 'Plese fill username';
          } else if (res == 2) {
            return " should Contain character,number or . and _";
          } else {
            return null;
          }
        },
        maxLines: 1,
        style: TextStyle(
            color: Colors.indigo.shade700,
            decoration: TextDecoration.none,
            decorationColor: Color.fromARGB(0, 252, 230, 166)),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          errorMaxLines: 1,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300)),
          hintText: 'Enter Username',
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
