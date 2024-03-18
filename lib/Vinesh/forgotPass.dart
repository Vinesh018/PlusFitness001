import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:plus_fitness/Bhautik/b_login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

TextEditingController _emailcontroller1 = TextEditingController();
FocusNode _emailfocus1 = FocusNode();
final _emailValidationkey1 = GlobalKey<FormState>();
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

AlertDialog alert = AlertDialog(
  title: const Text('Alert Dialog Title'),
  content: const Text('This is a basic alert dialog in Flutter.'),
  actions: <Widget>[
    TextButton(
      child: const Text('OK'),
      onPressed: () {},
    ),
  ],
);

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return MainLogInPage();
                  },
                ));
              },
              icon: Icon(Icons.arrow_back_ios_new,
                  size: 25, color: Colors.white)),
          backgroundColor: Colors.indigo.shade400,
          elevation: 3,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Text(
                "Enter your Email and we will send you an Password reset link",
                style: TextStyle(fontFamily: "FontMain", fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 15,
                right: 15,
              ),
              child: Form(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: ElevatedButton(
                  onPressed: () {
                    print("email; is :  $_emailcontroller1");
                    print(_emailcontroller1.text);
                    try {
                      FirebaseAuth.instance.sendPasswordResetEmail(
                          email: _emailcontroller1.text);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Get.off(MainLogInPage());
                                    },
                                    child: Text("ok"))
                              ],
                              content: Text(
                                "Reset Password link sent... ",
                                style: TextStyle(
                                    fontFamily: "FontMain", fontSize: 20),
                              ),
                            );
                          });
                    } on FirebaseAuthException catch (e) {
                      print("in catch");
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                content: Text("Please enter correct email"));
                          });
                    }

                    print(_emailcontroller1.text);
                  },
                  child: Text(
                    "Reset Password",
                    style: TextStyle(fontFamily: "FontMain", fontSize: 15),
                  )),
            )
          ]),
        ));
  }
}
