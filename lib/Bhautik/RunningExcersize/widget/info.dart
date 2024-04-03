

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

class CalaryDrationDistance extends StatefulWidget{
  double calvalue;
  final String unit;
  final String name;
 CalaryDrationDistance({ required this.calvalue,  required this.unit, required this.name,});

  @override
  State<CalaryDrationDistance> createState() => _CalaryDrationDistanceState();
}

class _CalaryDrationDistanceState extends State<CalaryDrationDistance> {


  @override
  Widget build(BuildContext context) {
   return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.calvalue.toString(), style: TextStyle(fontFamily: 'FontMain',fontSize: 25,fontWeight: FontWeight.w500),),
              Text(' ${widget.unit}',style: TextStyle(fontFamily: 'FontMain',fontSize: 11,fontWeight: FontWeight.w400),)
            ],
          ),
          SizedBox(height: 5,),
          Text(widget.name,style: TextStyle(fontFamily: 'FontMain',fontSize: 16,fontWeight: FontWeight.w400))
        ],
      ),
   );
  }
  
 
}