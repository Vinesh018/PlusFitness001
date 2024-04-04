import 'package:flutter/material.dart';
int steps = 0;
var xcoordinate;
var ycoordinate;
var zcoordinate;
double miles = 0;
double duration = 0;
double calories = 0;
double addValue = 0.025;
double distnaces = 0.0;
double previousDistance = 0.0;


class Steps extends StatefulWidget {
  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(top: 25),
       child: Column(
        children: [
          Text('1234',style: TextStyle(fontFamily: 'FontMain',fontSize: 33,fontWeight: FontWeight.w800),),
          Text('Total Steps',style: TextStyle(fontFamily: 'FontMain',fontSize: 13,fontWeight: FontWeight.w500,
          height: 2),),
        ],
       ),
     );
  }
}