import 'package:flutter/material.dart';
import 'package:plus_fitness/Vinesh/S_AreaOfFocus_cont.dart';
import 'package:plus_fitness/Vinesh/S_AreaOfFocus_heading.dart';
import 'package:plus_fitness/Vinesh/S_doing-great.dart';
import 'package:plus_fitness/Vinesh/S_y-prog-cont.dart';
import 'package:plus_fitness/Vinesh/S_y-program_heading.dart';
import 'package:plus_fitness/Vinesh/footer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class exercisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => exercisePageState();
}

class exercisePageState extends State<exercisePage> {
@override
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'My Exercise',
            style: TextStyle(
                fontFamily: 'FontMain', fontSize: 22, color: Colors.indigo),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 231, 235, 237),
          surfaceTintColor: Color.fromARGB(255, 231, 235, 237),
      ),
      bottomNavigationBar: footer(),

      backgroundColor: Color.fromARGB(255, 231, 235, 237),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              heading_yourProgram(),
              yourProgram(),
              doingGreat(),
              heading_areaOfFocus(),
              areaOfFocusCont(),
            ],
          ),
        ),
      ),
    );
  }
  
 
}
