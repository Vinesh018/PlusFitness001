import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plus_fitness/Bhautik/b_userprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool readonly = true;
String weightValue = '25';
String? weightvaluefromsharedprefrence;
String hintText = hintText ?? 'No value';

class userdatacontainer extends StatefulWidget {
  @override
  State<userdatacontainer> createState() => _userdatacontainerState();
}

class _userdatacontainerState extends State<userdatacontainer> {
  FocusNode weightfocus = FocusNode();
  @override
  void initState() {
    super.initState();
    getweightfordisplay();
  }

  void getweightfordisplay() async {
    var prefs = await SharedPreferences.getInstance();
    var getweight = prefs.getString('finalweightvaluestoredinsharedpref');
    if (getweight == null) {
      hintText = 'enter weight in kgs';
    } else {
      hintText = getweight;
      print('Hinttext in initstat is $hintText');
    }
  }

  void _toggle() {
    setState(() {
      readonly = false;
    });
  }

  // void setweighvalue(String hintText) async {
  //   setState(() {});
  //   var prefs = await SharedPreferences.getInstance();
  //   var getweight = prefs.getString('finalweightvaluestoredinsharedpref');
  //   print('Getweighvarjdhfis $getweight');
  //   hintText = getweight!;
  // }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    TextEditingController _weightcontroller = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight / 8),
                  child: Text(
                    'My Personal Detail',
                    style: TextStyle(
                      fontFamily: 'FontMain',
                      fontSize: 20,
                    ),
                  ),
                ),
                TextFormField(
                    focusNode: weightfocus,
                    controller: _weightcontroller,
                    keyboardType: TextInputType.number,
                    readOnly: readonly,
                    decoration: InputDecoration(
                        hintText: hintText,
                        suffixIcon: IconButton(
                            onPressed: () {
                              // _toggle();
                            },
                            icon: Icon(Icons.edit)),
                        border: InputBorder.none),
                    onChanged: (value) async {
                      print('First text field: $value');
                      weightValue = value;
                      String weightValueonsaved =
                          _weightcontroller.text.toString();
                      print(weightValueonsaved);

                      var pef = await SharedPreferences.getInstance();
                      pef.setString('finalweightvaluestoredinsharedpref',
                          weightValueonsaved);
                      print('Hint Text is $hintText');
                    }),
                FloatingActionButton(
                  onPressed: () async {
                    String weightValueonsaved =
                        _weightcontroller.text.toString();
                    print(weightValueonsaved);
                    if (weightValueonsaved == null ||
                        weightValueonsaved.length == 0) {
                      hintText = 'Enter value Plese';
                      weightfocus.requestFocus();
                    } else {
                      var pef = await SharedPreferences.getInstance();
                      pef.setString('finalweightvaluestoredinsharedpref',
                          weightValueonsaved);
                      print('Hint Text is $hintText');
                    }
                  },
                  child: Text('Save'),
                )
              ],
            ),
          ),
          Text(hintText),
        ],
      ),
    );
  }
}
