import 'package:flutter/material.dart';
import 'package:plus_fitnss/Vinesh/S_AreaOfFocus_cont.dart';
import 'package:plus_fitnss/Vinesh/S_AreaOfFocus_heading.dart';
import 'package:plus_fitnss/Vinesh/S_doing-great.dart';
import 'package:plus_fitnss/Vinesh/S_y-prog-cont.dart';
import 'package:plus_fitnss/Vinesh/S_y-program_heading.dart';
import 'package:plus_fitnss/Vinesh/footer.dart';

class exercisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => exercisePageState();
}

class exercisePageState extends State<exercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
