import 'package:flutter/material.dart';

import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/Vinesh/waveviwe.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class waterContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => waterContainerState();
}

double waterpercentage = 0;
int waterInMl = 0;
var waterDrinkTime = "--";

String waterNotification = "Keep drinking water !!";
int i = 1;

class waterContainerState extends State<waterContainer> {
     void initState() {
      super.initState();
       getweightfordisplay();
    }

     Future<void> getweightfordisplay() async {
         var prefs = await SharedPreferences.getInstance();
         var getwaterml = prefs.getInt(sharedprefkeysfinal.waterdrinkinml);
         var getwaterperctage = prefs.getDouble(sharedprefkeysfinal.waterpercentageonbottle);
         var getwaterdrinktime = prefs.getString(sharedprefkeysfinal.lastwaterdrinktime);
         waterInMl = getwaterml ?? 0;
         waterpercentage = getwaterperctage ?? 0;
         waterDrinkTime = getwaterdrinktime ?? "--";
        //  print('Getting value of Water in ml is $getwaterml');
         setState(() {
         });

     }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 250,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text.rich(TextSpan(
                              text: waterInMl.toString(),
                              style: TextStyle(
                                  fontFamily: 'FontMain',
                                  fontSize: 35,
                                  color: Color.fromARGB(255, 19, 75, 232)),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'ml',
                                  style: TextStyle(
                                      fontSize: 17, fontFamily: 'FontMain'),
                                )
                              ])),
                          Text(
                            "of daily goal 3.5L",
                            style: TextStyle(
                                fontFamily: 'FontMain',
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: screenwidth / 2 - 30,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.grey.shade500))),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 22,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Last drink $waterDrinkTime",
                                style: TextStyle(
                                    fontFamily: "FontMain",
                                    fontSize: 13,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage("assets/images/bell.png"),
                                height: 27,
                                width: 23,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: 110,
                                child: Text(
                                  "$waterNotification",
                                  style: TextStyle(
                                      fontFamily: "FontMain",
                                      fontSize: 14,
                                      color: Colors.pinkAccent,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 15, top: 50, bottom: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                       color: Colors.grey.shade300,
                                        spreadRadius: 0.1,
                                        blurRadius: 5,
                                        offset: const Offset(4, 7))
                                ]),
                            child: InkWell(

                              
                              onTap: () async {
                                DateTime date = DateTime.now();
                                String time = "${date.hour}:${date.minute}";

                                waterDrinkTime = time;

                                waterpercentage = waterpercentage + 5;
                                waterInMl = waterInMl + 175;
                                if (waterpercentage >= 100) {
                                  waterpercentage = 100;
                                }
                                if (waterInMl >= 3500) {
                                  waterInMl = 3500;
                                }

                                if (waterInMl == 700 * i) {
                                  print("multiple of 700");
                                  i++;
                                  waterNotification =
                                      " Your bottle is empty refill it";
                                } else {
                                  waterNotification = "Keep drinking water !!";
                                }
                                var pef = await SharedPreferences.getInstance();
                                pef.setInt(sharedprefkeysfinal.waterdrinkinml,
                                    waterInMl);
                                    pef.setDouble(sharedprefkeysfinal.waterpercentageonbottle,waterpercentage);
                                    pef.setString(sharedprefkeysfinal.lastwaterdrinktime, waterDrinkTime);
                                print( 'Stored dwater ml  in shared Prefrence is $waterInMl');
                                print( 'Stored dwater percetgae  in shared Prefrence is $waterpercentage');
                                print( 'Stored dwater percetgae  in shared Prefrence is $waterDrinkTime');
                                    
                                    
                                    
                                setState(() {});
                              },
                              child: Icon(Icons.add),
                            ),
                            // child: IconButton(

                            //     onPressed: () {
                            //       waterpercentage = waterpercentage + 5;
                            //       setState(() {
                            //         print(
                            //             "water percentage is in add is : $waterpercentage");
                            //       });
                            //     },
                            //     icon: const Icon(
                            //       Icons.add,
                            //       size: 25,
                            //       color: Color.fromARGB(255, 19, 75, 232),
                            //     ))
                          ),
                          Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 0.1,
                                        blurRadius: 5,
                                        offset: const Offset(4, 7))
                                  ]),
                              child: IconButton(
                                  onPressed: () async {
                                    waterpercentage = waterpercentage - 5;
                                    waterInMl = waterInMl - 175;
                                    if (waterpercentage <= 0) {
                                      waterpercentage = 0;
                                    }
                                    if (waterInMl <= 0) {
                                      waterInMl = 0;
                                    }
                                    if (waterInMl == 700 * i) {
                                      print("multiple of 700");
                                      i--;
                                      waterNotification =
                                          " Your bottle is empty refill it";
                                    } else {
                                      waterNotification =
                                          "Keep drinking water !!";
                                    }
                                    var pef =
                                        await SharedPreferences.getInstance();
                                    pef.setInt(
                                        sharedprefkeysfinal.waterdrinkinml,
                                        waterInMl);
                                     pef.setDouble(sharedprefkeysfinal.waterpercentageonbottle,waterpercentage);
                                print( 'Stored dwater ml  in shared Prefrence is $waterInMl');
                                print( 'Stored dwater percetgae  in shared Prefrence is $waterpercentage');
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.remove,
                                      size: 25,
                                      color:
                                          Color.fromARGB(255, 19, 75, 232)))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 20),
                      child: SizedBox(
                        height: 200,
                        child: Container(
                          width: 52,
                          height: 160,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 224, 226, 227),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(80.0),
                                bottomLeft: Radius.circular(80.0),
                                bottomRight: Radius.circular(80.0),
                                topRight: Radius.circular(80.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  // color: FitnessAppTheme.grey.withOpacity(0.4),
                                  offset: Offset(2, 2),
                                  blurRadius: 4),
                            ],
                          ),
                          child: WaveView(
                            percentageValue: waterpercentage,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  
 
}

class waterIndicator extends StatefulWidget {
  const waterIndicator({super.key});

  @override
  State<waterIndicator> createState() => _waterIndicatorState();
}

class _waterIndicatorState extends State<waterIndicator> {
  @override
  Widget build(BuildContext context) {
    return LiquidLinearProgressIndicator(
      value: 0.25, // Defaults to 0.5.
      valueColor: const AlwaysStoppedAnimation(
          Colors.pink), // Defaults to the current Theme's accentColor.
      backgroundColor: const Color.fromARGB(255, 231, 235,
          237), // Defaults to the current Theme's backgroundColor.
      borderColor: Colors.black12,
      borderWidth: 2.0,
      borderRadius: 50.0,

      direction: Axis.vertical,
      center: const Text("Loading"),
    );

   
  }
}
