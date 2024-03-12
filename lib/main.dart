import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:plus_fitnss/Vinesh/v_mealsToday.dart';
=======
import 'package:plus_fitnss/Bhautik/datepickercustom.dart';
import 'package:plus_fitnss/Vinesh/footer.dart';
import 'package:plus_fitnss/Vinesh/heading_BodyMeasurement.dart';
import 'package:plus_fitnss/Vinesh/v_bodyMeasure.dart';
import 'package:plus_fitnss/Vinesh/v_heading_mealsToday.dart';
import 'package:plus_fitnss/Vinesh/v_mealsToday.dart';
import 'package:plus_fitnss/Vinesh/v_waterHeading.dart';
import 'package:plus_fitnss/Vinesh/v_water_container.dart';
import 'package:plus_fitnss/Vinesh/waterGlass.dart';
>>>>>>> Stashed changes

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorial',
      home: TutorialHome(),
      
    ),
  );
}

class TutorialHome extends StatefulWidget {
  const TutorialHome({super.key});

  @override
<<<<<<< Updated upstream
=======
  State<TutorialHome> createState() => _TutorialHomeState();
}

class _TutorialHomeState extends State<TutorialHome> {
  AppBar appbar = AppBar(
    title: const Text('My Dairy'),
    actions: const [
      Row(
        children: [
          DatepickerCustom(),
        ],
      ),
    ],
  );
  @override
>>>>>>> Stashed changes
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      bottomNavigationBar: footer(),
      appBar: appbar,
<<<<<<< Updated upstream
      body: Column(
        children: const [
          // mealsToday(),
        ],
=======
      backgroundColor: Color.fromARGB(255, 231, 235, 237),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              heading_mealsToday(),
              mealsToday(),
              heading_BodyMeasurement(),
              bodyMeasureCont(),
              heading_water(),
              waterContainer(),
              waterGlass(),
            ],
          ),
        ),
        
>>>>>>> Stashed changes
      ),
    );
  }
}
