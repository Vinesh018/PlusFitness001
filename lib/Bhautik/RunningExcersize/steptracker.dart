import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/dates.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/graph.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/info.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/stats.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/step.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/animatedgraph.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/widget/accelerometer.dart';
import 'package:plus_fitness/Vinesh/S_AreaOfFocus_cont.dart';
import 'package:plus_fitness/exercise.dart';

class Steptracker extends StatelessWidget{
  TextStyle appbartextstyle = TextStyle(fontFamily: 'FontMain',fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      leading: IconButton(onPressed: () {
        Get.off(exercisePage());
      }, icon: Icon(Icons.arrow_back_ios_new)),
      title: Text('Activity',style: appbartextstyle,),
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          AccelerometerExample(),
          Dates(),
          Steps(),
          graphdata(),
          // Graph(),//This graph is Without animation
          Info(),
          Stats()
        ],
      ),
    ),
   );
  }

}