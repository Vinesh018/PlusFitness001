import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plus_fitness/Bhautik/constansts/firebaseconst.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/Vinesh/T_Meals.dart';
import 'package:plus_fitness/Vinesh/temp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class mealsToday extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => mealsTodayState();
}

List<String> decodedListbreakfast = [];
List<String> decodelistlunch = [];
List<String> decodelistdinner = [];
double sumofBrekfastcal = 0;
double sumoflunchcal = 0;
double sumofdinnercal = 0;
List<String> namesofbrekfast = [];
List<String> calariesofbreakfast = [];
List<String> namesoflunch = [];
List<String> calariesoflunch = [];
List<String> namesofdinner = [];
List<String> calariesofdinner = [];

double Sumofcal = 0;

class mealsTodayState extends State<mealsToday> {
  @override
  void initState() {
    storeAndRetrieveList();
    Confetti();
    super.initState();
  }

  Future<void> getdatameals() async {
    var sp = await SharedPreferences.getInstance();
    usermail1 = sp.getString(sharedprefkeysfinal.useremail);
    await FirebaseFirestore.instance
        .collection(firebaseconst.mealsBreakfast)
        .doc(usermail1)
        .get()
        .then(
      (value) {
        var fields = value.data();
        cals = fields!['breakfast'];
        print(cals);
        cals = (cals as List?)?.map((item) => item as String).toList();
        decodedListbreakfast = cals ?? ['Calculating Calaries'];
      },
    );
  }

  Future<void> getlunchmeals() async {
    var sp = await SharedPreferences.getInstance();
    usermail1 = sp.getString(sharedprefkeysfinal.useremail);
    await FirebaseFirestore.instance
        .collection(firebaseconst.mealsLunch)
        .doc(usermail1)
        .get()
        .then(
      (value) {
        var fields = value.data();
        calslunch = fields!['lunch'];
        calslunch =
            (calslunch as List?)?.map((item) => item as String).toList();
        decodelistlunch = calslunch ?? ['Calculating Calaries'];
      },
    );
  }

  Future<void> getdinnermeals() async {
    var sp = await SharedPreferences.getInstance();
    usermail1 = sp.getString(sharedprefkeysfinal.useremail);
    await FirebaseFirestore.instance
        .collection(firebaseconst.mealsDinner)
        .doc(usermail1)
        .get()
        .then(
      (value) {
        var fields = value.data();
        calsdinner = fields!['dinner'];
        print(calsdinner);
        calsdinner =
            (calsdinner as List?)?.map((item) => item as String).toList();
        decodelistdinner = calsdinner ?? ['Calculating Calaries'];
      },
    );
  }


  Future<void> storeAndRetrieveList() async {
    await getdatameals();
    await getlunchmeals();
    await getdinnermeals();
    setState(() {
      namesofbrekfast = [];
      calariesofbreakfast = [];
      for (var i = 0; i < decodedListbreakfast.length; i++) {
        String str = decodedListbreakfast[i];
        String resultname;
        resultname = str.split(',')[0];
        resultname = resultname.replaceAll('"', '');
        namesofbrekfast.add(resultname);
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
      namesoflunch = [];
      calariesoflunch = [];
      for (var i = 0; i < decodelistlunch.length; i++) {
        String str = decodelistlunch[i];
        String resultname = str.split(',')[0];
        resultname = resultname.replaceAll('"', '');
        namesoflunch.add(resultname);

        var resultcal;
        resultcal = str.split(',')[1];
        resultcal = resultcal.replaceAll('"', '');
        calariesoflunch.add(resultcal);
      }

      List<double> dataListAsDoubleoflunch =
          calariesoflunch.map((data) => double.parse(data)).toList();
      sumoflunchcal = dataListAsDoubleoflunch.fold(
          0, (previous, current) => previous + current);

      // For Dinner Name And Calaries Display -----------------------------------------------------------------------------------------------------
      namesofdinner = [];
      calariesofdinner = [];
      for (var i = 0; i < decodelistdinner.length; i++) {
        String str = decodelistdinner[i];
        String resultname = str.split(',')[0];
        resultname = resultname.replaceAll('"', '');
        namesofdinner.add(resultname);
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
    });
    print('The sum of calaries is $Sumofcal');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            children: [
              DelayedWidget(
                delayDuration: Duration(milliseconds: 200), // Not required
                animationDuration: Duration(seconds: 1), // Not required
                animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        if (decodedListbreakfast == 'Add Your Breakfast') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DragandDrop(),
                              ));
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.deepOrange.shade100,
                                scrollable: true,
                                title: Text('Breakfast'),
                                content: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(namesofbrekfast.join(","))),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Container(
                        height: 190,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.deepOrange.shade100,
                                Colors.deepOrange.shade500
                              ],
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(70),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 15),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Breakfast",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'FontMainBold',
                                      fontSize: 17),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    namesofbrekfast.join(","),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'FontMain',
                                        fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: RichText(
                                    text: TextSpan(
                                      text: sumofBrekfastcal.toStringAsFixed(0),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'FontMain',
                                          fontSize: 25),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' Kcal',
                                            style: TextStyle(fontSize: 13)),
                                      ],
                                    ),
                                  ),
                                )
                                //////
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -2,
                      top: -30,
                      child: Container(
                        child: Image.asset("assets/images/breakfast.png"),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(79, 255, 255, 255),
                            borderRadius: BorderRadius.circular(50)),
                        width: 75,
                        height: 70,
                      ),
                    ),
                  ],
                ),
              ),
              //-----------------------2nd Box for LUNCH ----------------------//
              DelayedWidget(
                delayDuration: Duration(milliseconds: 200), // Not required
                animationDuration: Duration(seconds: 3), // Not required
                animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if (decodelistlunch == 'Add Your Lunch') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DragandDrop(),
                                ));
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.blue.shade100,
                                  scrollable: true,
                                  title: Text('Lunch'),
                                  content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        namesoflunch.join(","),
                                      )),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          height: 190,
                          width: 130,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blueAccent.shade100,
                                  Colors.blueAccent.shade700
                                ],
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(70),
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40, left: 15),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lunch",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'FontMainBold',
                                        fontSize: 17),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(
                                      namesoflunch.join(","),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'FontMain',
                                          fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: RichText(
                                      text: TextSpan(
                                        text: sumoflunchcal.toStringAsFixed(0),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'FontMain',
                                            fontSize: 25),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: ' Kcal',
                                              style: TextStyle(fontSize: 13)),
                                        ],
                                      ),
                                    ),
                                  )
                                  //////
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -2,
                        top: -30,
                        child: Container(
                          child: Image.asset("assets/images/lunch.png"),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(79, 255, 255, 255),
                              borderRadius: BorderRadius.circular(50)),
                          width: 75,
                          height: 70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //-------------------3rd Box for Snack ----------------------//
              DelayedWidget(
                delayDuration: Duration(milliseconds: 200), // Not required
                animationDuration: Duration(seconds: 5), // Not required
                animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Container(
                        height: 190,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.pinkAccent.shade100,
                                Colors.pinkAccent.shade700
                              ],
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(70),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 15),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  "Snack",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'FontMainBold',
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  width: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(
                                      "Recommended 800 Kcal",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'FontMain',
                                          fontSize: 11),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.pinkAccent,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),

                                //////
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -2,
                        top: -30,
                        child: Container(
                          child: Image.asset("assets/images/snack.png"),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(79, 255, 255, 255),
                              borderRadius: BorderRadius.circular(50)),
                          width: 75,
                          height: 70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //--------------------------4th box for Dinner --------------//
              DelayedWidget(
                delayDuration: Duration(milliseconds: 200), // Not required
                animationDuration: Duration(seconds: 5), // Not required
                animation: DelayedAnimations.SLIDE_FROM_RIGHT,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if (decodelistdinner == 'Add Your Dinner') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DragandDrop(),
                                ));
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.purple.shade200,
                                  scrollable: true,
                                  title: Text('Dinner'),
                                  content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        namesofdinner.join(","),
                                      )),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Container(
                          height: 190,
                          width: 130,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.deepPurple.shade100,
                                  Colors.deepPurple.shade700
                                ],
                              ),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(70),
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40, left: 15),
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dinner",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'FontMainBold',
                                        fontSize: 17),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Text(
                                      namesofdinner.join(','),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'FontMain',
                                          fontSize: 11),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: RichText(
                                      text: TextSpan(
                                        text: sumofdinnercal.toStringAsFixed(0),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'FontMain',
                                            fontSize: 25),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: ' Kcal',
                                              style: TextStyle(fontSize: 13)),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -2,
                        top: -30,
                        child: Container(
                          child: Image.asset("assets/images/dinner.png"),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(79, 255, 255, 255),
                              borderRadius: BorderRadius.circular(50)),
                          width: 75,
                          height: 70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
