import 'package:firebase_core/firebase_core.dart';
import 'package:plus_fitness/Bhautik/b_userprofile.dart';
import 'package:plus_fitness/Vinesh/splashScreen.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:plus_fitness/Bhautik/b_UperContainer.dart';
import 'package:plus_fitness/Bhautik/b_login.dart';
import 'package:plus_fitness/Bhautik/b_sign_up.dart';
import 'package:plus_fitness/Vinesh/T_Meals.dart';
import 'package:plus_fitness/Vinesh/v_mealsToday.dart';
import 'package:plus_fitness/Bhautik/datepickercustom.dart';
import 'package:plus_fitness/Vinesh/footer.dart';
import 'package:plus_fitness/Vinesh/heading_BodyMeasurement.dart';
import 'package:plus_fitness/Vinesh/v_bodyMeasure.dart';
import 'package:plus_fitness/Vinesh/v_heading_mealsToday.dart';
import 'package:plus_fitness/Vinesh/v_mealsToday.dart';
import 'package:plus_fitness/Vinesh/v_waterHeading.dart';
import 'package:plus_fitness/Vinesh/v_water_container.dart';
import 'package:plus_fitness/Vinesh/waterGlass.dart';


Future<void> main() async {
  // For Firebase intigration
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorial',
      // home: TutorialHome(),
      // home: SplashScreen(),
      //home: MainSignUpPage(),
      home:UserProfileMainRun()
    ),
  );
}


// Main Class Where Code Start Executin
class TutorialHome extends StatefulWidget {
  const TutorialHome({super.key});

  @override
  State<TutorialHome> createState() => _TutorialHomeState();
}

class _TutorialHomeState extends State<TutorialHome> {
  AppBar appbar = AppBar(
    title: const Text('My Dairy'),
    backgroundColor: Color.fromARGB(255, 231, 235, 237),
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
