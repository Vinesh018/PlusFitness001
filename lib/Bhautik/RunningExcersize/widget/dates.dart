import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/Helper.dart';


var screenWidth ;
var screenHeight;
class Dates extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    List<DateBox> dateboxes = [];
    DateTime date = DateTime.now().subtract(Duration(days: 3));
    for (var i = 0; i < 7; i++) {
      dateboxes.add(DateBox(date: date,active: i == 3,));
      date = date.add(Duration(days: 1));
    }
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:dateboxes,
       ),
     );
  }
  
}

class DateBox extends StatelessWidget {
 final DateTime date;
 final bool active;
 DateBox({  this.active = false, required this.date});

//  TextStyle dateandname = TextStyle(fontFamily: 'FontMain',color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: screenWidth/8 -1 ,
        height: 70,
        decoration: BoxDecoration(
          gradient: active? LinearGradient(colors: [Colors.indigoAccent,Colors.indigo.shade100],begin: Alignment.topCenter) : LinearGradient(colors: [Color.fromRGBO(251, 235, 209, 1), Color.fromRGBO(248, 207, 183, 1),  Color.fromRGBO(245, 184, 161, 1)],begin: Alignment.bottomLeft),
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(11),
        ),
        child: DefaultTextStyle.merge(
          style: active? TextStyle(fontFamily: 'FontMain',color: Colors.white) : null,
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(daysofweek[date.weekday]!,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'FontMain')),
              Text(date.day.toString().padLeft(2,'0'),style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500,fontFamily: 'FontMain')),
            ],
          ),
        ),
      ),
    );
  }
}