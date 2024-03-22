import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String weighonbody = '40';
String  Heightonbody = '100';
double bmi = 0;
var BmiIndicator;



class bodyMeasureCont extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => bodyMeasureContState();
}

class bodyMeasureContState extends State<bodyMeasureCont> {
  void initState() {
    super.initState();
    getweightfordisplay();
  }

  void getweightfordisplay() async {


    var prefs = await SharedPreferences.getInstance();
    var getweight = prefs.getString('finalweightvaluestoredinsharedpref');
    var getheight = prefs.getString('finalHeightvaluestoredinsharedpref');
    weighonbody = getweight!;
    Heightonbody = getheight!;
    print('Getting Weight fromdatabase is $weighonbody');
    print('Getting height fromdatabase is $Heightonbody');

    double height = double.parse(Heightonbody);
    double weight = double.parse(weighonbody);
    print(height);
    print(height.runtimeType);

    print(weight);
    print(weight.runtimeType);

    bmi = (weight / (height * height)) * 10000;

    if (bmi < 18.5) {
      BmiIndicator = " Underweight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      BmiIndicator = " Normalweight";
    } else if (bmi >= 25 && bmi <= 29.9) {
      BmiIndicator = " Overweight";
    } else {
      BmiIndicator = " Obesity";
    }
    setState(() {});


    print(bmi);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(80),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Weight",
                                  style: TextStyle(
                                      fontFamily: "FontMain",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: RichText(
                                  text: TextSpan(
                                    text: weighonbody,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 19, 75, 232),
                                        fontFamily: 'FontMain',
                                        fontSize: 30),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' Kgs',
                                          style: TextStyle(fontSize: 17)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 19,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Today 8:26 AM",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'FontMain',
                                      fontSize: 13),
                                )
                              ],
                            ),
                            Text(
                              "InBody SmartScale",
                              style: TextStyle(
                                  fontFamily: 'FontMain',
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 19, 75, 232),
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: Heightonbody,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'FontMain',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' cm',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                              Text("Height",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: 'FontMain'))
                            ],
                          ),
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: bmi.toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'FontMain',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' BMI',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                              Text("$BmiIndicator",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: 'FontMain'))
                            ],
                          ),
                          Column(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '20',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'FontMain',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '%',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                              Text("Body fat",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: 'FontMain'))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
