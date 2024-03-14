import 'package:flutter/material.dart';

class yourProgram extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => yourProgramState();
}

class yourProgramState extends State<yourProgram> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 240,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.indigo.shade200, Colors.indigoAccent.shade700],
              ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next workout",
                        style: TextStyle(
                            fontFamily: 'FontMainLight',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text("Legs Toning and",
                            style: TextStyle(
                                fontFamily: 'FontMain',
                                fontSize: 23,
                                color: Colors.white)),
                      ),
                      Text("Glutes Workout at Home",
                          style: TextStyle(
                              fontFamily: 'FontMain',
                              fontSize: 23,
                              color: Colors.white)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text("68 min",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'FontMain',
                                  fontSize: 15))
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_arrow,
                                size: 30,
                                color: Colors.indigo,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
