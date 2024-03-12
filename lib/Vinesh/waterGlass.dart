import 'package:flutter/material.dart';

class waterGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
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
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.shade100,
                          Colors.blueAccent.shade200
                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80, right: 20, top: 7),
                    child: SizedBox(
                        child: Text(
                      "Prepare your stomach for lunch with one or two glass of water ",
                      style: TextStyle(
                          fontFamily: 'FontMain',
                          color: Colors.indigo.shade700,
                          fontSize: 15),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: -10,
            child: Container(
              child: Image.asset("assets/images/glass.png"),
              height: 90,
              width: 90,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ],
      ),
    );
  }
}
