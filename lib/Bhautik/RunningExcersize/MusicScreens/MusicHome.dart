import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_fitness/Bhautik/RunningExcersize/MusicScreens/views/Playerview.dart';
import 'package:plus_fitness/exercise.dart';

class MusicHomeScreen extends StatelessWidget {

  AppBar appbar = AppBar(
    foregroundColor: Colors.black54,
    backgroundColor: Colors.black54,
        leading: InkWell(
          onTap: () =>  Get.off(exercisePage()),
          child: Icon(Icons.arrow_back,color: Colors.white,)),
          centerTitle: true,
          title: Text(' Listen Your favourite Music',style: TextStyle(fontFamily: 'FontMain',fontSize: 25,color: Colors.white),),
          automaticallyImplyLeading: false,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: appbar,
      body:
      
       Column(children:[Mainplayerscreen()] ),
    );
  }
  
}