import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_fitness/Vinesh/Exercise/Running/running.dart';

var width;
class areaOfFocusCont extends StatefulWidget {
  const areaOfFocusCont({super.key});

  @override
  State<areaOfFocusCont> createState() => _areaOfFocusContState();
}

class _areaOfFocusContState extends State<areaOfFocusCont> {

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    width = screenwidth/2;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 180,
                  width: width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: Image.asset("assets/images/area1.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 180,
                 width: width -  40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: Image.asset("assets/images/area2.png"),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 180,
                  width: width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      // Get.to(FitnessTrackingApp());
                    },
                    child: Image.asset("assets/images/area3.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 180,
              width: width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 7,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: InkWell(
                    child: Image.asset("assets/images/area1.png"),
                    onTap: () => print("tapped"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// GridView.count(
//   primary: false,
//   padding: const EdgeInsets.all(20),
//   crossAxisSpacing: 10,
//   mainAxisSpacing: 10,
//   crossAxisCount: 2,
//   children: <Widget>[
//     Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.teal[100],
//       child: const Text("He'd have you all unravel at the"),
//     ),
//     Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.teal[200],
//       child: const Text('Heed not the rabble'),
//     ),
//     Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.teal[300],
//       child: const Text('Sound of screams but the'),
//     ),
//     Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.teal[400],
//       child: const Text('Who scream'),
//     ),
//     Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.teal[500],
//       child: const Text('Revolution is coming...'),
//     ),
//     Container(
//       padding: const EdgeInsets.all(8),
//       color: Colors.teal[600],
//       child: const Text('Revolution, they...'),
//     ),
//   ],
// )
