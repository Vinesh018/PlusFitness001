import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:plus_fitness/Bhautik/constansts/sharedprefkeys.dart';
import 'package:plus_fitness/Vinesh/T_Meals.dart';
import 'package:shared_preferences/shared_preferences.dart';

 List<String> decodedListbreakfast = [];
 List<String> decodelistlunch = [];
 List<String> decodelistdinner = [];
// double sumofBrekfastcal = 0;
// double sumoflunchcal = 0;
// double sumofdinnercal = 0;

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

    decodedListbreakfast = listString!;
    decodelistlunch = listStringlunch!;
    decodelistdinner = listStringdinner!;

    setState(() {
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
          body: TabBarView(
            children: [
              showsBreakfastMeals(),
              showslunchMeals(),
              showsDinnerMeals()
            ],
          ),
        ),
      ),
    );
  }

  Widget showsBreakfastMeals() {
    return ListView.builder(
      // itemCount: decodedListbreakfast.length,
      itemCount: decodedListbreakfast.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Card(
              color: Colors.indigo.shade200,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(decodedListbreakfast[index]),
              )),
          trailing: IconButton(
              onPressed: () async {
               
                   var sp = await SharedPreferences.getInstance();
                  decodedListbreakfast.removeAt(index);
                  decodedListbreakfast.removeWhere((item) => item == index);
                sp.setStringList(sharedprefkeysfinal.breakfastlist,decodedListbreakfast);      
              setState(() { });
              },
              icon: Icon(Icons.delete)),
        );
      },
    );
  }
   Widget showslunchMeals() {
    return ListView.builder(
      itemCount: decodelistlunch.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Card(
              color: Colors.indigo.shade200,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(decodelistlunch[index]),
              )),
          trailing: IconButton(
              onPressed: () async {
               
                   var sp = await SharedPreferences.getInstance();
                  decodelistlunch.removeAt(index);
                 decodelistlunch.removeWhere((item) => item == index);
                sp.setStringList(sharedprefkeysfinal.lunchlist,decodelistlunch);      
              setState(() { });
              },
              icon: Icon(Icons.delete)),
        );
      },
    );
  }
     Widget showsDinnerMeals() {
    return ListView.builder(
      itemCount: decodelistdinner.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Card(
              color: Colors.indigo.shade200,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(decodelistdinner[index]),
              )),
          trailing: IconButton(
              onPressed: () async {
               
                   var sp = await SharedPreferences.getInstance();
                  decodelistdinner.removeAt(index);
                 decodelistdinner.removeWhere((item) => item == index);
                sp.setStringList(sharedprefkeysfinal.dinnerlist,decodelistdinner);      
              setState(() { });
              },
              icon: Icon(Icons.delete)),
        );
      },
    );
  }
}
