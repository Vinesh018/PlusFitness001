import 'package:flutter/material.dart';

class bodyMeasureCont extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => bodyMeasureContState();
}

class bodyMeasureContState extends State<bodyMeasureCont> {
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
                                  text: const TextSpan(
                                    text: '203.8 ',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 19, 75, 232),
                                        fontFamily: 'FontMain',
                                        fontSize: 30),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'lbs',
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
                                text: const TextSpan(
                                  text: '185 ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'FontMain',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'cm',
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
                                text: const TextSpan(
                                  text: '27.3 ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'FontMain',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'BMI',
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                              Text("Overweight",
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
