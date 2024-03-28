import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/Vinesh/T_Meals.dart';
import 'package:shared_preferences/shared_preferences.dart';

var decodedListbreakfast = 'Add Your Breakfast';
var decodelistlunch = 'Add Your Lunch'; 
var decodelistdinner = 'Add Your Dinner';
var breakfastcallist;
var lunchcallist;
var dinnercallist;
double sumofBrekfastcal = 0;
double sumoflunchcal = 0;
double sumofdinnercal = 0;

class deletemeals extends StatefulWidget {
  const deletemeals({super.key});

  @override
  State<deletemeals> createState() => deletemealsState();
}

class deletemealsState extends State<deletemeals> {
  @override
  void initState() {
    storeAndRetrieveList();
  }
  Future<void> storeAndRetrieveList() async {
    var sp = await SharedPreferences.getInstance();
    List<String>? listString =
        sp.getStringList(sharedprefkeysfinal.breakfastlist);
    List<String>? listStringlunch =
        sp.getStringList(sharedprefkeysfinal.lunchlist);
    List<String>? listStringdinner =
        sp.getStringList(sharedprefkeysfinal.dinnerlist);
    List<String>? listStringbreakfastcal =
        sp.getStringList(sharedprefkeysfinal.braekfastlistcal);
    List<String>? listStringlunchcal =
        sp.getStringList(sharedprefkeysfinal.lunchlistcal);
    List<String>? listStringdinnercal =
        sp.getStringList(sharedprefkeysfinal.dinnerlistcal);
    if (listString != null) {
      // Decode the stored items into a List<dynamic>
      decodedListbreakfast =
          listString.map((item) => json.decode(item)).toList().join(",");
    }
    if (listStringbreakfastcal != null) {
      // Decode the stored items into a List<dynamic>
      breakfastcallist = listStringbreakfastcal
          .map((item) => json.decode(item))
          .toList()
          .join(",");
      List<double> breakfastcallistdouble;
      breakfastcallistdouble = breakfastcallist
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',')
          .map<double>((e) {
        return double.parse(e);
      }).toList();

      double sum = breakfastcallistdouble.fold(
          0, (previousValue, element) => previousValue + element);
      sumofBrekfastcal = sum;
      sp.setDouble(sharedprefkeysfinal.brekfastcalsum, sumofBrekfastcal);
      var tempsum = sp.getDouble(
        sharedprefkeysfinal.brekfastcalsum,
      );
    }
    if (listStringlunch != null) {
      // Decode the stored items into a List<dynamic>
      decodelistlunch =
          listStringlunch.map((item) => json.decode(item)).toList().join(",");

    }
    if (listStringlunchcal != null) {
      // Decode the stored items into a List<dynamic>
      lunchcallist = listStringlunchcal
          .map((item) => json.decode(item))
          .toList()
          .join(",");
      List<double> lunchcallistdouble;
      lunchcallistdouble = lunchcallist
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',')
          .map<double>((e) {
        return double.parse(e);
      }).toList();

      double sum = lunchcallistdouble.fold(
          0, (previousValue, element) => previousValue + element);
      sumoflunchcal = sum;
      sp.setDouble(sharedprefkeysfinal.lunchcalsum, sumoflunchcal);
      var tempsum = sp.getDouble(
        sharedprefkeysfinal.lunchcalsum,
      );
    }
    if (listStringdinner != null) {
      decodelistdinner =
          listStringdinner.map((item) => json.decode(item)).toList().join(",");

    }
    if (listStringdinnercal != null) {
      dinnercallist = listStringdinnercal
          .map((item) => json.decode(item))
          .toList()
          .join(",");
      List<double> dinnercallistdouble;
      dinnercallistdouble = dinnercallist
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',')
          .map<double>((e) {
        return double.parse(e);
      }).toList();

      double sum = dinnercallistdouble.fold(
          0, (previousValue, element) => previousValue + element);
      sumofdinnercal = sum;
      sp.setDouble(sharedprefkeysfinal.dinnercalsum, sumofdinnercal);
      var tempsum = sp.getDouble(
        sharedprefkeysfinal.dinnercalsum,
      );
    }

    setState(() {
      // Assuming setState is defined in the same class
      // and used to update UI after retrieving data.
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.off(DragandDrop());
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined)),
            bottom: const TabBar(
              tabs: [
                Tab(
                    icon: Image(
                        image: AssetImage("assets/images/breakfast.png"))),
                Tab(icon: Image(image: AssetImage("assets/images/lunch.png"))),
                Tab(icon: Image(image: AssetImage("assets/images/dinner.png"))),
              ],
            ),
            title: const Text('Edit your buckets'),
          ),
          body:  TabBarView(
            children: [
              showsBreakfastMeals(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }

  Widget showsBreakfastMeals(){
    print(decodedListbreakfast);
    return ListView.builder(
      itemCount: decodedListbreakfast.length,
      itemBuilder: (context, index) {
      return ListTile(
        title: Text(decodedListbreakfast[index]),
      );
    },);
  }
}
