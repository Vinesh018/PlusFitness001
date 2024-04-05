import 'package:confetti/confetti.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/double_extensions.dart';
import 'package:plus_fitness/Bhautik/Animation/delayanimation.dart';
import 'package:plus_fitness/Bhautik/Myprofilesubpages/contactuspage.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/Vinesh/setValue.dart';

import 'package:plus_fitness/Vinesh/temp.dart';
import 'package:plus_fitness/Vinesh/temp1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:plus_fitness/Bhautik/b_UperContainer.dart';
import 'package:plus_fitness/Vinesh/v_mealsToday.dart';
import 'package:plus_fitness/Bhautik/datepickercustom.dart';
import 'package:plus_fitness/Vinesh/footer.dart';
import 'package:plus_fitness/Vinesh/heading_BodyMeasurement.dart';
import 'package:plus_fitness/Vinesh/v_bodyMeasure.dart';
import 'package:plus_fitness/Vinesh/v_heading_mealsToday.dart';
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
        // home: Confetti(),
      //home: StoreusingSharedPreferences(),
        //home: PersonalDataMainShow(),
        //home: SplashScreen(),
      //home: MainSignUpPage(),
        //home:UserProfileMainRun()
        // home: AnimatedDigitWidgetExample()
        // home: MyHomePageb(),
        home: TutorialHome()
        // home: MyHomePageb(),
        // home: MyAppt(),
        // home: ContactusPageMain()
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

  @override
  void initState() {

    Confetti();
    super.initState();
  }
  AppBar appbar = AppBar(
   
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
    ),
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Get.off(TutorialHome());
        },
        child: const Text(
          'Plusfitness',
          style: TextStyle(
              fontFamily: 'FontMain', fontSize: 22, color: Colors.indigo),
        ),
      ),
    ),
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
                name(),
                Confetti(),
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
