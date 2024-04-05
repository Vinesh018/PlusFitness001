

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_fitness/Bhautik/constansts/imagepath.dart';
import 'package:animated_text_lerp/animated_text_lerp.dart';
double showvalue = 0.0;

class CalaryDrationDistance extends StatefulWidget{
  final String imagepath;
  double calvalue;
  

  final String unit;
  final String name;
 CalaryDrationDistance({ required this.calvalue,  required this.unit, required this.name, required this.imagepath,});

  @override
  State<CalaryDrationDistance> createState() => _CalaryDrationDistanceState();
}

class _CalaryDrationDistanceState extends State<CalaryDrationDistance> {
// String temp = '';
@override
  void initState() {
  widget.calvalue.toPrecision(2);
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    String temp = widget.calvalue.toStringAsFixed(2);
    // widget.calvalue = double.parse(temp);
  
   return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5,),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1.5, color: Colors.grey.shade500)
              )
            ),
            
            child: Text(widget.name,style: TextStyle(fontFamily: 'FontMain',fontSize: 16,fontWeight: FontWeight.w400))
            // child: AnimatedNumberText(duration: null,),
            ),
          Text(widget.calvalue.toStringAsFixed(1), style: TextStyle(fontFamily: 'FontMain',fontSize: 25,fontWeight: FontWeight.w500),),
          // AnimatedNumberText(widget.calvalue, duration: Duration(seconds: 2),curve: Curves.bounceIn,style: TextStyle(
          //   fontFamily: 'FontMain',fontSize: 25,fontWeight: FontWeight.w500,
          // ),),
          Row(
            children: [
              Image.asset(widget.imagepath,height: 20,width: 20,),
              Text(' ${widget.unit}',style: TextStyle(fontFamily: 'FontMain',fontSize: 11,fontWeight: FontWeight.w400),),
            ],
          ),
        ],
      ),
   );
  }
}