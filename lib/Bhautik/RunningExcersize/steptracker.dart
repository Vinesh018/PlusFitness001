import 'package:flutter/material.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/dates.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/graph.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/info.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/stats.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/step.dart';

class Steptracker extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      leading: IconButton(onPressed: () {
        
      }, icon: Icon(Icons.arrow_back_ios_new)),
    ),
    body: Column(
      children: [
        Dates(),
        Steps(),
        Graph(),
        Info(),
        Stats()
      ],
    ),
   );
  }

}