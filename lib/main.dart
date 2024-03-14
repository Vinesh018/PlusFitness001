import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:plus_fitnss/Bhautik/b_UperContainer.dart';
import 'package:plus_fitnss/Bhautik/b_login.dart';
import 'package:plus_fitnss/Bhautik/b_sign_up.dart';
import 'package:plus_fitnss/Vinesh/T_Meals.dart';

import 'package:plus_fitnss/Vinesh/v_mealsToday.dart';
import 'package:plus_fitnss/Bhautik/datepickercustom.dart';
import 'package:plus_fitnss/Vinesh/footer.dart';
import 'package:plus_fitnss/Vinesh/heading_BodyMeasurement.dart';
import 'package:plus_fitnss/Vinesh/v_bodyMeasure.dart';
import 'package:plus_fitnss/Vinesh/v_heading_mealsToday.dart';
import 'package:plus_fitnss/Vinesh/v_mealsToday.dart';
import 'package:plus_fitnss/Vinesh/v_waterHeading.dart';
import 'package:plus_fitnss/Vinesh/v_water_container.dart';
import 'package:plus_fitnss/Vinesh/waterGlass.dart';

void main() {
  runApp(
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorial',
      // home: TutorialHome(),
      // home: MainLogInPage(),
      home: MainSignUpPage(),
        
      
    ),
  );
}

class TutorialHome extends StatefulWidget {
  const TutorialHome({super.key});

  @override

  State<TutorialHome> createState() => _TutorialHomeState();
}

class _TutorialHomeState extends State<TutorialHome> {
  AppBar appbar = AppBar(
    title: const Text('My Dairy'),
    backgroundColor:  Color.fromARGB(255, 231, 235, 237),
    actions: const [
      Row(
        children: [
          DatepickerCustom(),
        ],
      ),
    ],
  );
  @override

  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      bottomNavigationBar: footer(),
      appBar: appbar,

      backgroundColor: Color.fromARGB(255, 231, 235, 237),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
                firstContainer(),
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
        
        ));
 
  }
}
