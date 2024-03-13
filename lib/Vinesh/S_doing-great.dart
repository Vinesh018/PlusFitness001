import 'package:flutter/material.dart';

class doingGreat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(164, 158, 158, 158)
                              .withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  child: Row(
                    children: [
                      Image.asset("assets/images/back.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                            width: 180,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("You're doing great !",
                                    style: TextStyle(
                                        fontFamily: 'FontMainBold',
                                        fontSize: 15,
                                        color: Colors.indigo)),
                                Text("Keep it up",
                                    style: TextStyle(
                                        fontFamily: 'FontMain',
                                        color: Colors.grey,
                                        fontSize: 13)),
                                Text("and stick to your plan.",
                                    style: TextStyle(
                                        fontFamily: 'FontMain',
                                        color: Colors.grey,
                                        fontSize: 13)),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: -25,
            child: Container(
              child: Image.asset("assets/images/runner.png"),
              height: 150,
              width: 150,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ],
      ),
    );
  }
}
