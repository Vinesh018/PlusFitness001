import 'dart:ffi';

import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(bottom: 25,top: 15),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CalaryDrationDistance(calvalue: 345, unit: 'kcal', name: 'Calaries',),
          CalaryDrationDistance(calvalue: 3.6, unit: 'km', name: 'Distance',),
          CalaryDrationDistance(calvalue: 1.5, unit: 'hr', name: 'Hours',),
        ],
       ),
     );
  } 
}

class CalaryDrationDistance extends StatelessWidget{
  final double calvalue;
  final String unit;
  final String name;
  const CalaryDrationDistance({ required this.calvalue,  required this.unit, required this.name,});
  @override
  Widget build(BuildContext context) {
   return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(calvalue.toString(), style: TextStyle(fontFamily: 'FontMain',fontSize: 25,fontWeight: FontWeight.w500),),
              Text(' $unit',style: TextStyle(fontFamily: 'FontMain',fontSize: 11,fontWeight: FontWeight.w400),)
            ],
          ),
          SizedBox(height: 5,),
          Text(name,style: TextStyle(fontFamily: 'FontMain',fontSize: 16,fontWeight: FontWeight.w400))
        ],
      ),
   );
  }
}