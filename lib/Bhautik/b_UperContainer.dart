import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/Vinesh/v_mealsToday.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_lerp/animated_text_lerp.dart';


List<String> decodedListbreakfast = [];
List<String> decodelistlunch = [];
List<String> decodelistdinner = [];
double sumofBrekfastcal = 0;
double sumoflunchcal = 0;
double sumofdinnercal = 0;
List<String> calariesofbreakfast = [];
List<String> calariesoflunch = [];
List<String> calariesofdinner = [];
double? eatencals = 0;
Color textColor = Colors.indigo;
Color carbscolor = Colors.black;
Color protiencolor = Colors.black;
Color fatscolor = Colors.black;

var carbs;
var carbsper;

var fats;
var fatsper;

var protein;
var proteinper;

class firstContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [FirstrowOfBody(), SecondRowAndContainer()],
    );
  }
}

class FirstrowOfBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Mediterranean diet",
            style: TextStyle(fontFamily: "FontMain", fontSize: 18),
          ),
          InkWell(
              onTap: () {},
              child: const Row(
                children: [
                  Text(
                    'Details ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontFamily: 'FontMain'),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class SecondRowAndContainer extends StatefulWidget {
  @override
  State<SecondRowAndContainer> createState() => _SecondRowAndContainerState();
}

class _SecondRowAndContainerState extends State<SecondRowAndContainer> {
  @override
  void initState() {
    storeAndRetrieveList();
    getsumofcals();
  }

  Future<void> storeAndRetrieveList() async {
    var sp = await SharedPreferences.getInstance();
    List<String>? listString =
        sp.getStringList(sharedprefkeysfinal.breakfastlist);
    List<String>? listStringlunch =
        sp.getStringList(sharedprefkeysfinal.lunchlist);
    List<String>? listStringdinner =
        sp.getStringList(sharedprefkeysfinal.dinnerlist);
    decodedListbreakfast = listString ?? [];

    // print('The Lenth of Setting decodce is ${decodedListbreakfast.length}');
    decodelistlunch = listStringlunch ?? [];
    // print('The Lenth of Setting decodce lunch is ${decodelistlunch.length}');
    decodelistdinner = listStringdinner ?? [];
    // print('The Lenth of Setting decodce dinner is ${decodelistdinner.length}');
    setState(() {
      calariesofbreakfast = [];
      // print('============================================================================');
      for (var i = 0; i < decodedListbreakfast.length; i++) {
        String str = decodedListbreakfast[i];
        var resultcal;
        resultcal = str.split(',')[1];
        resultcal = resultcal.replaceAll('"', '');
        calariesofbreakfast.add(resultcal);
      }

      List<double> dataListAsDouble =
          calariesofbreakfast.map((data) => double.parse(data)).toList();
      sumofBrekfastcal =
          dataListAsDouble.fold(0, (previous, current) => previous + current);

      // For Lunch Name And Calaries Display -----------------------------------------------------------------------------------------------------

      calariesoflunch = [];
      for (var i = 0; i < decodelistlunch.length; i++) {
        String str = decodelistlunch[i];
        var resultcal;
        resultcal = str.split(',')[1];
        resultcal = resultcal.replaceAll('"', '');
        calariesoflunch.add(resultcal);
        // print("the calaries are :: $calariesoflunch");
        // print(calariesoflunch.runtimeType);
      }

      List<double> dataListAsDoubleoflunch =
          calariesoflunch.map((data) => double.parse(data)).toList();

      // print(dataListAsDoubleoflunch);
      sumoflunchcal = dataListAsDoubleoflunch.fold(
          0, (previous, current) => previous + current);

      // print(dataListAsDoubleoflunch.runtimeType);
      // print(sumofBrekfastcal);

      // For Dinner Name And Calaries Display -----------------------------------------------------------------------------------------------------

      calariesofdinner = [];
      for (var i = 0; i < decodelistdinner.length; i++) {
        String str = decodelistdinner[i];
        var resultcal;
        resultcal = str.split(',')[1];
        resultcal = resultcal.replaceAll('"', '');
        calariesofdinner.add(resultcal);
      }

      List<double> dataListAsDoubleofdinner =
          calariesofdinner.map((data) => double.parse(data)).toList();
      sumofdinnercal = dataListAsDoubleofdinner.fold(
          0, (previous, current) => previous + current);
      Sumofcal = sumofBrekfastcal + sumofdinnercal + sumoflunchcal;
      if (Sumofcal > 2500) {
        textColor = Colors.red;
      }
      if (Sumofcal <= 2500) {
        textColor = Colors.indigo;
      }

      carbs = Sumofcal / 8;

      if (carbs! >= 312.5) {
        carbs = 312.5;
      }
      if (carbs! <= 0) {
        carbs = 0;
      }

      carbsper = carbs / 312.5;
      carbs = 312.5 - carbs;
      if (carbs! <= 0) {
        carbscolor = Colors.green;
      }
      if (carbs > 0) {
        carbscolor = Colors.black;
      }

      protein = Sumofcal / 16;

      if (protein! >= 156.25) {
        protein = 156.25;
      }
      if (protein! <= 0) {
        protein = 0;
      }
      proteinper = protein / 156.25;
      protein = 156.25 - protein;
      if (protein! <= 0) {
        protiencolor = Colors.green;
      }
      if (protein > 0) {
        protiencolor = Colors.black;
      }

      fats = Sumofcal / 36;

      if (fats! >= 69.45) {
        fats = 69.45;
      }
      if (fats! <= 0) {
        fats = 0;
      }
      fatsper = fats / 69.45;
      fats = 69.45 - fats;
      if (fats! <= 0) {
        fatscolor = Colors.green;
      }
      if (fats > 0) {
        fatscolor = Colors.black;
      }

      // print("----------------------------");

      // print("Carbs value $carbsper");

      // print("----------------------------");

      sp.setDouble(sharedprefkeysfinal.sumofallcalaries, Sumofcal);
      // print("[][][][][][][][][][][]");
      // print(Sumofcal);
      // print("[][][][][][][][][][][]");
    });
  }

  Future<void> getsumofcals() async {
    var sp = await SharedPreferences.getInstance();
    eatencals = sp.getDouble(sharedprefkeysfinal.sumofallcalaries);
    if (eatencals! >= 2500) {
      eatencals = 2500;
   
    }
    if (eatencals! <= 0) {
      eatencals = 0;
    }
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: DelayedWidget(
        delayDuration: Duration(milliseconds: 400), // Not required
        animationDuration: Duration(seconds: 2), // Not required
        animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // Not required
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(80),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  FirstRowMakeCommon(),
                  Divider(
                    indent: 30.0,
                    endIndent: 30.0,
                  ),
                  SecondRowOfShadow()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstRowOfContainer extends StatelessWidget {
  final String mainhead;
  final String imgadress;
  final double subtext;
  final Color bordercolor;

  FirstRowOfContainer(
      {required this.mainhead,
      required this.subtext,
      required this.bordercolor,
      required this.imgadress});
  @override
  Widget build(BuildContext context) {



    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(color: bordercolor, width: 3))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        mainhead,
                        style: TextStyle(
                            fontFamily: 'FontMain', color: Colors.grey),
                      ),
                    ),
                    Row(
                     
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          // 'assets/images/eaten.png',
                          imgadress,
                          height: 40,
                          width: 40,
                        ),
                        AnimatedNumberText(
                          subtext.toInt(), // int or double
                          curve: Curves.easeIn,
                          duration: const Duration(seconds: 2),
                          style: TextStyle(
                            color: textColor,
                            fontFamily: "FontMain",
                            fontSize: 28,
                          ),
                          
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Align(
                              child: Text(
                            ' kcal',
                            style: TextStyle(
                                fontFamily: 'FontMain',
                                fontSize: 13,
                                color: Colors.grey),
                          )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ], 
          ),
        ],
      ),
    );
  }
}

class FirstRowMakeCommon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: FirstRowOfContainer(
                mainhead: 'Eaten',
                imgadress: 'assets/images/eaten.png',
                bordercolor: Color.fromRGBO(206, 215, 240, 1),
                subtext: Sumofcal,
              ),
            ),
            FirstRowOfContainer(
              mainhead: 'Burned',
              imgadress: 'assets/images/burned.png',
              bordercolor: Color.fromRGBO(236, 201, 209, 1),
              subtext: 104,
            ),
          ],
        ),
        //  Circular Indicator here
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CircularIndicatorcustom(),
        ),
      ],
    );
  }
}

class SecondRowOfShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      // First Widget here
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CommoncarbsProtinefat(
            headText: 'Carbs',
            coolor1: Colors.indigo.shade200,
            coolor2: Colors.indigo.shade700,
            backgroundColor: Colors.indigo.shade100,
            percentage: carbsper ?? 0,
            textcolor: carbscolor,
            subtext: (carbs ?? 0).toStringAsFixed(1)),
        CommoncarbsProtinefat(
            headText: 'Protien',
            coolor1: Colors.pink.shade200,
            coolor2: Colors.pink.shade700,
            backgroundColor: Colors.pink.shade100,
            percentage: proteinper ?? 0,
            textcolor: protiencolor,
            subtext: (protein ?? 0).toStringAsFixed(1)),
        CommoncarbsProtinefat(
            headText: 'Fats',
            coolor1: Colors.amber.shade200,
            coolor2: Colors.amber.shade700,
            backgroundColor: Colors.amber.shade100,
            percentage: fatsper ?? 0,
            textcolor: fatscolor,
            subtext: (fats ?? 0).toStringAsFixed(1)),
      ],
    );
  }
}

class CommoncarbsProtinefat extends StatefulWidget {
  final String headText;
  final Color coolor1;
  final Color coolor2;
  final Color backgroundColor;
  final String subtext;
  final double percentage;
  Color textcolor;

  CommoncarbsProtinefat(
      {required this.headText,
      required this.coolor1,
      required this.coolor2,
      required this.subtext,
      required this.backgroundColor,
      required this.percentage,
      required this.textcolor});

  @override
  State<CommoncarbsProtinefat> createState() => _CommoncarbsProtinefatState();
}

class _CommoncarbsProtinefatState extends State<CommoncarbsProtinefat>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 25),
      child: Column(
        children: [
          Text(
            widget.headText,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'FontMain',
              fontSize: 17,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 3),
            child: LinearPercentIndicator(
              width: 90.0,
              animation: true,
              animationDuration: 1000,
              lineHeight: 5.0,
              percent: widget.percentage,
              backgroundColor: widget.backgroundColor,
              linearGradient:
                  LinearGradient(colors: [widget.coolor1, widget.coolor2]),
              barRadius: Radius.circular(10),
            ),
          ),
          Row(
            children: [
              Text(
                widget.subtext,
                style: TextStyle(color: widget.textcolor),
              ),
              Text(
                ' g left',
                style: TextStyle(color: widget.textcolor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CircularIndicatorcustom extends StatefulWidget {
  double per = (eatencals ?? 1) / 2500;
  @override
  State<CircularIndicatorcustom> createState() =>
      _CircularIndicatorcustomState();
}

class _CircularIndicatorcustomState extends State<CircularIndicatorcustom> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 60.0,
      backgroundWidth: 1,
      curve: Curves.easeIn,
      lineWidth: 12.0,
      animation: true,
      animationDuration: 1000,
      percent: widget.per,
      center: SizedBox(
        height: 50,
        child: Column(
          children: [
            AnimatedNumberText(
              (2500 - (eatencals ?? 0)).toInt(), // int or double
              curve: Curves.easeIn,
              duration: const Duration(seconds: 2),
              style: TextStyle(
                color: textColor,
                fontFamily: "FontMain",
                fontSize: 20,
              ),
            ),
            Text("kcal left")
          
            
          ],
        ),
      ),
      backgroundColor: Colors.indigo.shade500,
      circularStrokeCap: CircularStrokeCap.round,
      linearGradient: LinearGradient(colors: [
        Colors.indigo.shade100,
        Colors.indigo.shade700,
      ]),
    );
  }
}
