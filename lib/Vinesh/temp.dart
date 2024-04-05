import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:plus_fitness/Bhautik/b_UperContainer.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/Vinesh/v_mealsToday.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Confetti extends StatefulWidget {
  @override
  _ConfettiState createState() => _ConfettiState();
}
int temp = 0;

class _ConfettiState extends State<Confetti> {
  late ConfettiController _controllerCenterRight;
  late ConfettiController _controllerCenterLeft;
  @override
  
  void initState() {
    SecondRowAndContainer();

    setState(() {});
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 4));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 4));
    // _controllerCenterLeft.play();
    getsumofcals1();
    gettotalcal();

    super.initState();
  }

  Future<void> getsumofcals1() async {
    var sp = await SharedPreferences.getInstance();
    var eatencal = sp.getDouble(sharedprefkeysfinal.sumofallcalaries);
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    print(eatencal);
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    setState(() {});
  }

  gettotalcal() async {
    var sp = await SharedPreferences.getInstance();
    sp.getStringList(sharedprefkeysfinal.braekfastlistcal);
    var total = sp.getDouble(sharedprefkeysfinal.sumofallcalaries);
    print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
    print(Sumofcal);
    print(total);
    print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-");
    if (total! >= 2500) {
      setState(() {
        _controllerCenterLeft.play();
      });
    } else {
      setState(() {});
    }

    setState(() {});
  }

  @override
  void dispose() {
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
          blastDirectionality: BlastDirectionality.explosive,
          maxBlastForce: 25,
          confettiController: _controllerCenterLeft,
          blastDirection: 170,
          particleDrag: 0.05,
          emissionFrequency: 0.05,
          numberOfParticles: 30,
          gravity: 0.1,

    );
      
    
  }
}
