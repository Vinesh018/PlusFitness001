import 'package:flutter/material.dart';

class mealsToday extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => mealsTodayState();
}

class mealsTodayState extends State<mealsToday> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 180,
          width: 125,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepOrange.shade100,
                  Colors.deepOrange.shade500
                ],
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(70),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          child: Column(
            children: [],
          ),
        ),
        Text("data")
      ],
    );
  }
}
