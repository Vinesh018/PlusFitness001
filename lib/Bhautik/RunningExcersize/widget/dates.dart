import 'package:flutter/material.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/Helper.dart';



class Dates extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    List<DateBox> dateboxes = [];
    DateTime date = DateTime.now().subtract(Duration(days: 3));
    for (var i = 0; i < 7; i++) {
      dateboxes.add(DateBox(date: date,active: i == 3,));
      date = date.add(Duration(days: 1));
    }
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 2),
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: 50,
        height: 70,
        decoration: BoxDecoration(
          gradient: active? LinearGradient(colors: [Colors.indigoAccent,Colors.indigo.shade100],begin: Alignment.topCenter) : null,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(11),
        ),
        child: DefaultTextStyle.merge(
          style: active? TextStyle(fontFamily: 'FontMain',color: Colors.white) : null,
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(daysofweek[date.weekday]!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,fontFamily: 'FontMain')),
              Text(date.day.toString().padLeft(2,'0'),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,fontFamily: 'FontMain')),
            ],
          ),
        ),
      ),
    );
  }
}